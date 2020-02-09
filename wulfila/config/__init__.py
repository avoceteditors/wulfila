"""Provides functions to configure an operating system and load grammars."""
##################################################################################
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
##################################################################################

# Module Imports
import getpass
import pathlib

# Local Imports
import wulfila.log

# Configure Logging
logger = wulfila.log.get_logger("wulfila.config")

# Directory Structure for Root
root_dirs = {
    "etc": pathlib.Path("/etc/wulfila"),
    "share": pathlib.Path("/usr/share/wulfila")
}
user_dirs = {
    "etc": pathlib.Path.home().joinpath(".config/wulfila"),
    "share": pathlib.Path.home().joinpath(".local/share/wulfila")
}

# Initialize Dirs
def init_dirs(dirs):
    """Checks that relevant directories exist, if they do not exist, it creates them"""

    logger.debug("Checking that paths exist")

    for key, path in dirs.items():
        if not path.exists():
            logger.warn(f"Path '{str(path)}' does not exist: creating")
            path.mkdir(parents=True)

# Main Process
def run(args):
    """Main configuration process called from the command-line"""
    logger.info("Called configuration operation")

    # Initialize User DIrecotires 
    user = getpass.getuser()

    if user == "root":
        dirs = root_dirs
    else:
        dirs = user_dirs
    init_dirs(dirs)





