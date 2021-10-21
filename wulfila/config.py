# Module Imports
import wulfila.read
import pathlib
import re
import sys
import yaml

# Configure Logger
from logging import getLogger
logger = getLogger()

# Compile RegEX Space
space = re.compile(" ")

def path_config(config, key, default, args):

    if key in config.keys():
        if config[key][0] not in ["/", "~", ".", "$"]:
            config[key] = args.cwd.joinpath(config[key])
        else:
            config[key] = pathlib.Path(config[key]).resolve()
    else:
        config[key] = args.cwd.joinpath(default)

def configure(args):
    """Configures project, loading relevant information 
    and returning a dict with the configuration data"""
    logger.debug("Configuring Arnacia")

    # Load Project Root
    with open(args.project, "r") as f:
        config = yaml.safe_load(f)

    # Configure Project idref
    #if "project" not in config.keys():
    #    logger.critical("Invalid Key: project.yml has no 'project' key")
    #else:
    #    logger.info("Configuring with key %s", config["project"])

    # Configure Paths
    for (key, default) in [("source", "src"), ("output", "build")]:
        path_config(config, key, default, args)

    # Configure Author
    if "author" in config.keys() and "surname" not in config.keys():
        names = re.split(space, config["author"])
        config["surname"] = names[-1]

    wulfila.read.load(config)

    return config
