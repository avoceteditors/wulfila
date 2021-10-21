# Module Imports
import argparse
import wulfila.build
import wulfila.config
import logging
import pathlib
import sys

from pkg_resources import get_distribution

# Configure Logger
logger = logging.getLogger()
prog = "wulfila"

######################## REPORT VERSION #########################
def report_version(args):
    """Reports version information on the library and tools."""
    logger.debug("Called version reporting operation")
    ver = get_distribution(prog).version

    if args.verbose or args.debug:
        content = [ 
            f"{prog.capitalize()} - The Document Processor",
            "Kenneth P. J. Dyer <kenneth@avoceteditors.com>",
            "Avocet Editorial Consulting",
            f"Version {ver}"
        ] 
    else:
        content = [f"{prog} - version {ver}"]

    print("\n  ".join(content))

########################### FIND PROJECT ##########################
def find_project(path):
    """Finds the project file and the project root, by 
    searching up recursively from the ``--cwd`` option."""
    project = path.joinpath("project.yml")
    if project.exists():
        return (project, path)
    else:
        try:
            return find_project(path.parent)
        except RecursionError:
            logger.critical("Unable to locate project root directory tree")
            sys.exit(1)

########################### MAIN PROCESS ##########################
def main():
    """Main process run by ``wulfila`` script."""

    parser = argparse.ArgumentParser(
        prog=prog
    )
    parser.set_defaults(func=report_version)

    ############## Options #######################

    opts = parser.add_argument_group("Options")

    # Operate on All Content
    opts.add_argument(
        "-a", "--all", action="store_true",
        help="Operate on all entries of the given type, or the most recent."
    )

    # Working Directory
    opts.add_argument( 
        "-C", "--cwd", default=".", 
        help="Sets the working directory."
    )

    # Debug
    opts.add_argument(
        "--debug", action="store_true",
        help="Enables debug log messages."
    )

    # Verbose
    opts.add_argument(
        "-v", "--verbose", action="store_true",
        help="Enables verbose log messages."
    )

    ################# Commands #####################
    cmds = parser.add_subparsers(title="Commands")

    # Build Command
    cmd_build = cmds.add_parser(
        "build",
        help="Performs build operation"
    )
    cmd_build.set_defaults(func=wulfila.build.run)

    cmd_build.add_argument(
        "-t", "--type", default="book", choices=["book", "article", "web"]
    )

    # Version Command
    cmds.add_parser(
        "version",
        help="Reports the application version (default)")

    # Parse Arguments
    args = parser.parse_args()

    # Configure Logging
    log_level = logging.WARN
    log_format = "[ %(levelname)s ]: %(message)s."
    if args.debug:
        log_level = logging.DEBUG
        log_format = "[ %(levelname)s ]: %(message)s. \n\t(%(pathname)s:%(lineno)s)"

    elif args.verbose:
        log_level = logging.INFO

    logging.basicConfig(format=log_format, level=log_level)

    ################### CONFIGURE PATHS #####################
    if args.func != report_version:
        (args.project, args.cwd) = find_project(pathlib.Path(args.cwd).resolve())
        args.config = wulfila.config.configure(args)

    # Run Process
    args.func(args)