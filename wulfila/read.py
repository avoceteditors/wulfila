# Module Imports
import markdown
import yaml
import wulfila.lang

# Configure Logger
from logging import getLogger
logger = getLogger()

def read_markdown(path, meta):
    with open(path, "r") as f:
        text = f.read()
    md = markdown.Markdown(
        extensions=[
            "full_yaml_metadata",
            "markdown_checklist.extension",
            "mdx_emdash",
            "mdx_include",
            "pymdownx.critic",
            "pymdownx.inlinehilite"
        ])
    mark = md.convert(text)

    meta["mtime"] = path.stat().st_mtime
    meta["path"] = str(path)
    meta["target"] = path.stem 

    for key in meta:
        if key not in md.Meta:
            md.Meta[key] = meta[key]

    setattr(md, "Data", mark)

    return md

def read_yaml(config, path):
    with open(path, "r") as f:
        data = yaml.safe_load(f.read())

    if "language" in data:
        key = data["language"]
        if key not in config["languages"]:
            config["languages"][key] = {
                "key": key,
                "name": key,
                "phonemes": [],
                "syllabary": [],
                "lexicon_inline": config.get("lexicon_inline", True),
                "lexicon": {}
            }
        wulfila.lang.update(data, config["languages"][key])
gender = {
    "animate": "a.",
    "inanimate": "ina.",
    "masculine": "m.",
    "feminine": "f.",
    "neuter": "n.",
    "bestial": "bstl.",
    "spiritual": "s."
}
def make_entry(text, entry):

    term = entry["term"]
    category = entry["category"]
    ipa = entry["ipa"]
    short_entry = entry["short"]
    long_entry = entry["long"]

    if category == "root":
        text.append(
            f"* **{term}** /`{ipa}`/ *{category}*, {short_entry}"
        )
    elif category == "noun":
        noun_class = entry["class"]
        gen = gender.get(entry["gender"], entry["gender"])
        text.append(
            f"* **{term}** /`{ipa}`/ *{noun_class} {gen}*, {short_entry}"
        )

    for line in long_entry:
        text.append(f"  {line}")

def make_lexicon(config, data):
    base_text = [
        "---\n"
        "type: lexicon\n"
        "---\n"
    ]
    path = config["source"].joinpath(f"lexica")
    if not path.exists():
        path.mkdir()


    if data["lexicon_inline"]:
        text = base_text
        text.append(f"# Lexicon of {data['name']}")

        for key in sorted(data["lexicon"]):
            text.append(f"## {key.upper()}.")

            entries = data["lexicon"][key]

            for entry in sorted(entries):
                make_entry(text, entries[entry])

        text = "\n\n".join(text)

        md = path.joinpath(f"{data['key']}.md")

        with open(md, "w") as f:
            f.write(text)
    else:
        mddir = path.joinpath(f"{data['key']}")
        if not mddir.exists():
            mddir.mkdir()

        page = base_text
        page.append(f"# Lexicon of {data['name']}")

        for key in data["lexicon"]:
            page.append(f"* [{key.upper()}]({data['key']}/{key}.md")
            text = base_text
            text.append(f"# {key.upper()}.")
            entries = data["lexicon"][key]

            for entry in sorted(entries):
                make_entry(text, entries[entry])

            text = "\n\n".join(text)

            md = path.joinpath(f"{data['key']}/{key}.md")
            with open(md, "w") as f:
                f.write(text)

        page = "\n\n".join(page)
        md = path.joinpath(f"{data['key']}.md")
        with open(md, "w") as f:
            f.write(page)

def load(config):
    logger.debug("Loading Source Data")

    metadata = {
        "author": config.get("author", "Anonymous"),
        "surname": config.get("surname", "Anonymous"),
        "title": "Untitled",
        "type": None 
    }
    config["languages"] = {}

    # Find YaML Files
    for ext in ["yml", "yaml"]:
        for yml in config["source"].rglob(f"*.{ext}"):
            data = read_yaml(config, yml)

    # Write Lexica
    for lang, data in config["languages"].items():
        if data["lexicon"] != {}:
            make_lexicon(config, data)

    # Find Markdown Files
    mds = []
    config["source_files"] = []
    for ext in ["md", "mdx", "markdown"]:
        for md in config["source"].rglob(f"*.{ext}"):
            data = read_markdown(md, metadata)
            config["source_files"].append(data)
