###################
Wulfila
###################

Tool for philologist and conlangers to quickly reference paradigms in synthetic languages and search from available dictionaries.  It is written in Python 3.

**********************
Installation
**********************

To install, run the setup script:

.. code-block:: console

   $ python3 setup.py install

Requires `Avocet Tools <https://github.com/avoceteditors/avocet-tools>`_ and `Dion <https://github.com/avoceteditors/dion>`_.

**********************
Usage
**********************

``generate``
==============

Reads the current configuration and generates a list of random words based on the available phonological specification for the language:

.. code-block:: console

   $ wulfila --lang proto-tongue generate 10
   /ʟi.dar/
   /di.ru.d-hu.i/
   /zu.fa.mir/
   /ðim.ðu.ba.ða.far/
   /xum.ʎuʟ/
   /a.fi.ʟa.ʟar/
   /ʟu.u/
   /bir.bʷa.dwa.a/
   /ʒa.gi.ʒa.dwu.a/
   /ra.mi.du.ga.rur/

***********************
Meaning in the Name
***********************

𐍅𐌿𐌻𐍆𐌹𐌻𐌰 was a fourth century bishop and missionary who produced a translation of the Bible from Greek into the now extinct East Germanic language of Gothic.  The Wulfila Bible today represents the overwhelming majority of surviving Gothic text, so it's a frequent subject of study for anyone interested in Germanic philology.

Much of the tool was planned out while the author was translating Gothic texts for a course in Germanic philology, and the name stuck because it sounds cool.

