###################
Wulfila
###################

Tool for philologist to quickly reference paradigms in synthetic languages and search from available dictionaries.  It is written in Python 3.8 and Cython and uses SQLite for storage.

**********************
Installation
**********************

To install, run the setup script:

.. code-block:: console

   $ python3 setup.py install

**********************
Usage
**********************

search
=======

Search functionality currently old supports Old Norse (``--lang on``), which is set as the default dictionary.

.. code-block:: console

   $ wulfila search "thorpkarl'"
   þorp-karl
     m. = þorpari, a churl, Fms. x. 372, Þiðr. 231. þorpkarl-ligr, 
     adj. churlish, Hkr. iii. 129.

Wulfila supports a limited set of substitution patterns, intended to facilitate searching from the command-line, where the standard American keyboard may not support the full range of Germanic chacaracters.

**********************
Languages
**********************

Language support in Wulfila is meant to be polyglottal.  Currently, it only supports an Old Icelandic dictionary.

Planned Languages
===================

Planned Language Support:

* Old Saxon
* Old High German
* Old Norse
* Old English
* Gothic
* Latin
* Classical Greek


***********************
Meaning in the Name
***********************

𐍅𐌿𐌻𐍆𐌹𐌻𐌰 was a fourth century bishop and missionary who produced a translation of the Bible from Greek into the now extinct East Germanic language of Gothic.  The Wulfila Bible today represents the overwhelming majority of surviving Gothic text, so it's a frequent subject of study for anyone interested in Germanic philology.

Much of the tool was planned out while the author was translating Gothic texts for a course in Germanic philology.  It's current lower position is due to the class moving on before the tool was usable.  

The Gothic name stuck in spite of this because it sounds cool.

******************
Dictionaries
******************

* Old Norse (``wulfila --lang on``) uses a public domain release of the Cleasby-Vigfuson Icelandic-English Ditionary, as provided by the `Germanic Lexicon Project <http://www.germanic-lexicon-project.org/texts/oi_cleasbyvigfusson_about.html>`_.
