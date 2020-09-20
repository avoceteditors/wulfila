import logging
import pathlib
import re
import shutil
import sqlite3 as sql
import sys
import textwrap

cdef str open_bold = "\033[1m"
re_open_bold = re.compile("<B>")
cdef str open_ital = "\033[3m"
re_open_ital = re.compile("<I>")
cdef str clear_format = "\033[0m"
re_close = re.compile("</[BI]>")

cdef void run(args):
    """Search database for content"""

    cdef str dict_name
    if args.lang == "on":
        dict_name = "old-icelandic"
    else:
        logging.critical(f"Invalid Dictionary: --lang {args.lang}")
        sys.exit(1)
        

    path = pathlib.Path(sys.modules['wulfila'].__file__).parent.joinpath(f'data/{dict_name}.db')

    conn = sql.connect(path)
    cur = conn.cursor()
    cdef list results = []
    cdef str select_pattern = "SELECT entry_id FROM patterns WHERE pattern LIKE ?"
    cdef str select_entry = "SELECT term, definition FROM entries WHERE id = ?"
    cdef list rows 

    for pattern in args.term:
        logging.debug(f"Searching: '{pattern}'")
        cur.execute(select_pattern, [pattern])

        rows = []
        for row in cur.fetchall():
            rows.append(row[0])

        rows = list(set(rows))

        for row in rows:
            cur.execute(select_entry, [row])

            for (term, definition) in cur.fetchall():
                results.append((term, definition))


    cdef list clean_results = [] 
    cdef int size = shutil.get_terminal_size().columns
    size = size - 4
    for (term, definition) in results:
        clean_results.append(f"{open_bold}{term}{clear_format}")
        definition = re.sub(
            re_open_bold, open_bold,
            re.sub(re_open_ital, open_ital,
            re.sub(re_close, clear_format, definition)))


        for line in textwrap.wrap(definition, size):
            clean_results.append(f"  {line}")


    print("\n".join(clean_results))


    conn.close()




