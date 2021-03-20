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

# Local Imports
from .phono import *
from .lex import *

# Configure Logger
from logging import getLogger
logger = getLogger()

class Language:

    def __init__(self, name):
        self.name = name
        self.phonology = Phonology() 
        self.lexicon = Lexicon()

    def __repr__(self):
        return f'<Wulfila.{self.__class__.__name__} name="{self.name}" phonology={self.phonology} lexicon="{self.lexicon}"/>'

    def update(self, data):
        logger.debug("Updating specification for %s language" % self.name)
        if "phonology" in data:
            spec_phonology(self, data["phonology"])
        elif "terms" in data:
            spec_lexicon(self, data.get("terms", []))

class Registry:
    def __init__(self):
        self.langs = {}

    def __repr__(self):
        return f"langs={self.langs}/>"

    def update(self, name, data):
        if name not in self.langs:
            self.langs[name] = Language(name)

        self.langs[name].update(data)
