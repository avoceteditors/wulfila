##############################################################################
# Copyright (c) 2020, Kenneth P. J. Dyer <kenneth@avoceteditors.com>
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
# * Neither the name of the copyright holder nor the name of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
##############################################################################


# Module Imports
import argparse
import coloredlogs
import logging
import pathlib
import sys

from pkg_resources import get_distribution


#################### APPLICATION METADATA ######################
cdef str prog = "Wulfila"
cdef str byline = "Language Tool for Classical and Germanic Philologists"
cdef str author = "Kenneth P. J. Dyer <kenneth@avoceteditors.com>"
cdef str comp = "Avocet Editorial Consulting"
cdef str version = get_distribution("wulfila").version

cdef void report_version(args):
    cdef list content
    if args.verbose:
        content = [f"{prog} - {byline}", author, comp, f"Version {version}", "\n"]
    else:
        content = [f"{prog} - version {version}"]
    print("\n  ".join(content))

####################### MAIN PROCESS #######################
cpdef void run():
    """ Main process run from the command-line"""
    parser = argparse.ArgumentParser(prog="wulfila")

    parser.set_defaults(func=report_version)
    ############# OPTIONS GROUP ###############
    opts = parser.add_argument_group("Options")

    # Force
    opts.add_argument(
        "-f", "--force", action="store_true",
        help="Forces certain operations")

    # Working Directory
    opts.add_argument(
        "-C", "--working-dir", default=pathlib.Path("~/.config/wulfila").absolute(),
        help="Sets the working directory")

    # Debug
    opts.add_argument(
        "-D", "--debug", action="store_true",
        help="Enables debugging information in logging messages")

    # Verbosity
    opts.add_argument(
        "-v", "--verbose", action="store_true",
        help="Enables verbosity in logging messages")

    opts.add_argument(
        "-l", "--lang", choices=["on"], default='on',
        help="Specifies language to read and search (default on=Old Norse)")

    ################# COMMANDS #######################
    cmds = parser.add_subparsers(title="Commands", help="Command you want to execute")

    # Version Command
    cmd_ver = cmds.add_parser(
        "version",
        help="Reports version and developer information.")

    ############## PARSE ARGUMENTS ####################
    args = parser.parse_args()

    if args.debug:
        log_level = logging.DEBUG
    elif args.verbose:
        log_level = logging.INFO
    else:
        log_level = logging.WARN

    coloredlogs.install(level=log_level)

    # Call
    args.func(args)

    sys.exit(0)

