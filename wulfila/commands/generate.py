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
import sys 

# Configure Logger
from logging import getLogger
logger = getLogger()

############################ REGEX #####################################

############################ RUN COMMAND #####################################
def run(args):
    """Runs the generate command, used to generate terms based on
    the phonological register of a configured language."""
    logger.info("Called generate operation")

    args.min = int(args.min)
    args.max = int(args.max)
    args.words = int(args.words)

    langs = args.config.registry.langs
    if args.lang is None or args.lang not in langs:
        keys = list(sorted(langs.keys()))
        if len(keys) == 0:
            logger.error("Project does not provide a configured language")
            sys.exit(1)
        else:
            key = keys[0]
    else:
        key = args.lang

    # Check Phonology
    if langs[key].phonology.empty():
        logger.error(f"Language {key} does not provide a configured phonology")
        sys.exit(1)

    logger.debug(f"Generating words from {key} phonology")

    words = langs[key].phonology.generate_words(args.words, args.min, args.max)

    ret = []
    if args.verbose:
        for word in words:
            ret.append(f"/{str(word)}/\n\t{word.latex}")
    else:
         for word in words:
            ret.append(f"/{str(word)}/")
    print("\n".join(ret))
       
