import re
import pathlib
from distutils.core import setup

# Packages
pkgs = [
    "wulfila",
]

# Package Directories
pkgdirs = {}
dot = re.compile("\.")
for pkg in pkgs: 
    pkgdirs[pkg] = re.sub(dot, "/", pkg)

# Scripts
bin_path = pathlib.Path("scripts")
bins = []

for bin in bin_path.glob("*"):
    bins.append(bin)

setup(
    name="wulfila",
    version="21.02",
    packages=pkgs,
    package_dir=pkgdirs,
    scripts=bins
)