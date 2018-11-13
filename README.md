# Data Science Toolbox: Assignment 2

[![Binder](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/dj311/data-science-toolbox-2/master)


## Dependencies
When installing a new dependency or library, make sure to record it in:
  - [./install.R](./install.R) for R libraries
  - [./requirements.txt](requirements.txt) for Python libraries

This will ensure that the Binder button above can pull in the correct libraries, and run correctly.


## R Setup
R dependencies can be installed by running `R --file=install.R` in this repositories root directory.

*How does this work?* The [./.Rprofile](./.Rprofile) file in the project root instructs the R interpretor to look for and install libraries into the project-local folder `./rlibs`. RStudio will follow this convention similarly, and pick up these locally installed libraries.


## Python Setup
Requires a working Python 3 installation (tested with 3.6.5). Given that, the following steps will setup a virtual environment with all the right bits:
  1. Create a new virtual env: `python3 -m venv python-env` (use `./python-env` since it's included in `.gitignore`).
  2. Activate it in your current shell: `source ./python-env/bin/activate`.
  3. Install the dependencies: `python3 -m pip install -r requirements.txt`.
  4. Activate `nbstripout` to automatically strip output from jupyter notebooks when committing: `nbstripout --install`.
