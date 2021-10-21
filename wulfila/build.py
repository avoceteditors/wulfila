# Module Imports
import subprocess 
import shutil

# Configure Logger
from logging import getLogger
logger = getLogger()

def latex(args):
    pass

def run(args):
    source = str(args.config.get("source"))
    latex = str(args.config.get("output").joinpath("latex"))
    pdf = str(args.config.get("output").joinpath("pdf"))
    web = str(args.config.get("output").joinpath("web"))

    if args.type == "book":
        logger.debug("Building Books")
        command = ["sphinx-build", "-b", "latex", source, latex]
        subprocess.run(command, cwd=args.cwd)

    elif args.type == "article":
        logger.debug("Building Articles")
        command = ["sphinx-build", "-b", "latex", source, latex] 
        subprocess.run(command, cwd=args.cwd)

    elif args.type == "chapter":
        logger.debug("Building Chapters")
        command = ["sphinx-build", "-b", "latex", source, latex] 
        subprocess.run(command, cwd=args.cwd)

    else:
        logger.debug("Building Website")
        command = ["sphinx-build", "-b", "dirhtml", source, web] 
        subprocess.run(command, cwd=args.cwd)