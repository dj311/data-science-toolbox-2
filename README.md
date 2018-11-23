# Data Science Toolbox: Assignment 2

## Assessment

Our main report is inside the file `./project/report.ipynb` with individual data models linked within.


## Dependencies
When installing a new dependency or library, make sure to record it in:
  - [./install.R](./install.R) for R libraries
  - [./requirements.txt](requirements.txt) for Python libraries

This will ensure that the Binder button above can pull in the correct libraries, and run correctly.


## R Setup
R dependencies can be installed by running the `install.R` file in this repositories root directory.


## Python Setup
Requires a working Python 3 installation (tested with 3.6.5). Given that, the following steps will setup a virtual environment with all the right bits:
  1. Create a new virtual env: `python3 -m venv python-env` (use `./python-env` since it's included in `.gitignore`).
  2. Activate it in your current shell: `source ./python-env/bin/activate`.
  3. Install the dependencies: `python3 -m pip install -r requirements.txt`.
