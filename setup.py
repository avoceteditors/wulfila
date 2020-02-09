# Module Imports
from distutils.core import setup
import pathlib
import re

# Configure Package Names
packages = [
    "wulfila",
    "wulfila.config"
]

package_dirs = {}

for package in packages:
    package_dirs[package] = re.sub("\.", "/", package)

# Configure Scripts
scripts_dir = pathlib.Path("scripts")
scripts = []

for path in scripts_dir.glob("*"):
    if path.is_file():
        scripts.append(str(path))

# Set up Library
setup(
    name="wulfila",
    version="2020.01",
    packages=packages,
    package_dir=package_dirs,
    scripts=scripts,
    package_data={'wulfila':[]}
)
