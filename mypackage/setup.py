import setuptools

with open("README.md", "r") as fh:
    long_description = fh.read()
     
setuptools.setup(name="mypackage",
    version="0.1",
    description="A Python package",
    url="http://github.com/mygit/mypackage",
    author="author",
    author_email="author@mypackage.com",
    license="MIT",
    zip_safe=False,
    long_description=long_description,
    long_description_content_type="text/markdown",
    packages=setuptools.find_packages(),
    classifiers=[
        "Development Status :: 3 - Alpha",
        "Intended Audience :: Developers",
        "Topic :: Software Development :: Build Tools",
        "Programming Language :: Python :: 3",
        "License :: OSI Approved :: MIT License",
        "Operating System :: OS Independent",
    ],
    keywords="sample package development",
    project_urls={},
    py_modules=[],
    install_requires=[
        "markdown",
    ],
    python_requires=">=3",
    data_files=[],
    include_package_data=True,
    scripts=[],
    test_suite="nose.collector",
    tests_require=["nose"],
)

