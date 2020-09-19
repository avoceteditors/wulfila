from distutils.core import setup
from Cython.Build import cythonize

import re
import pathlib

# Configure Packages
packages = [
    "wulfila",
]
package_dirs = {}
exts = []
for package in packages:
    src = re.sub("\.", "/", package)
    package_dirs[package] = src

    # Find Cython Extensions
    path = pathlib.Path(src)
    for i in path.rglob("*.pyx"):
        exts.append(str(i))

    for i in path.rglob("*.pxd"):
        exts.append(str(i))

# Configure Scripts
scripts_path = pathlib.Path("scripts")
scripts = []
for i in scripts_path.glob('*'):
    if i.is_file():
        scripts.append(str(i))


setup(
    name="wulfila",
    version="0.1",
    scripts=scripts,
    package_dir=package_dirs,
    packages=packages,
    #package_data={"wulfila": ['avocet/data/*.sql']},
    ext_modules=cythonize(exts, language_level=3))


