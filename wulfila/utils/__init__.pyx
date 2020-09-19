"""Main Functions used to initiate utility operations"""


from wulfila.utils cimport icelandic as ois 

cpdef void update_ois():
    """Updates Old Icelandic Dictionary"""
    ois.run()

