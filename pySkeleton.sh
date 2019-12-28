## Shell script to build a Python package skeleton

#!/bin/bash

usage()  {
    echo "usage: $programname [-h] name"
    echo ""
    echo "-h     display help"
    echo "name:  name of the package; populates into targeted places throughout"
    exit 0
}

if [ $# -lt 1 ]; then
    usage
    exit 1
fi


## -------------------
echo Creating folders
mkdir -p $1/$1


## -------------------
echo Creating LICENSE

license="Copyright (c) 2018

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the \"Software\"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
"

echo "$license" > $1/LICENSE


## -----------------------
echo Creating manifest
manifest="# Include the README
include *.md

# Include the license file
include LICENSE

# Include the data files
recursive-include data *
"

echo "$manifest" > $1/MANIFEST.in


## -------------------
echo Creating README.md
readme="# Example Python Package

This is a simple example \`python\` package. You can use
[Github-flavored Markdown](https://guides.github.com/features/mastering-markdown/)
to write your content.
"
echo "$readme" > $1/README.md


## -------------------
echo Creating setup files
setup="import setuptools

with open(\"README.md\", \"r\") as fh:
    long_description = fh.read()
     
setuptools.setup(name=\"$1\",
    version=\"0.1\",
    description=\"A Python package\",
    url=\"http://github.com/mygit/$1\",
    author=\"author\",
    author_email=\"author@$1.com\",
    license=\"MIT\",
    zip_safe=False,
    long_description=long_description,
    long_description_content_type=\"text/markdown\",
    packages=setuptools.find_packages(),
    classifiers=[
        \"Development Status :: 3 - Alpha\",
        \"Intended Audience :: Developers\",
        \"Topic :: Software Development :: Build Tools\",
        \"Programming Language :: Python :: 3\",
        \"License :: OSI Approved :: MIT License\",
        \"Operating System :: OS Independent\",
    ],
    keywords=\"sample package development\",
    project_urls={},
    py_modules=[],
    install_requires=[
        \"markdown\",
    ],
    python_requires=\">=3\",
    data_files=[],
    include_package_data=True,
    scripts=[],
    test_suite=\"nose.collector\",
    tests_require=[\"nose\"],
)
"

echo "$setup" > $1/setup.py

cfg="[metadata]
license_files = LICENSE
"

echo "$cfg" > $1/setup.cfg


## ----------------------
echo Creating Hello World
echo "from .hello_world import greeting" > "$1/$1/__init__.py"

rm -f $1/$1/hello_world.py
hello_world="def greeting():
    \"\"\"A simple function\"\"\"  
    print(\"Hello World!\")
"
echo "$hello_world" > $1/$1/hello_world.py


## -----------------------
echo Creating tests
mkdir -p $1/$1/tests
echo "" > $1/$1/tests/__init__.py

test="from unittest import TestCase

import $1

class SampleTest(TestCase):
    def test_is_none(self):
        self.assertIsNone($1.hello_world.greeting())
"

echo "$test" > $1/$1/tests/test_hello_world.py


