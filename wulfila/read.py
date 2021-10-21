# Module Imports
import markdown
import yaml
import wulfila.lang

# Configure Logger
from logging import getLogger
logger = getLogger()

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

