# Conda

Conda is an OS agnostic package manger that makes it easy to install python packages that have non-pure python dependencies. For example, a python package that might make use of some FORTRAN package. Without conda, you would have to install the FORTRAN package separately and ensure that the python package can find the FORTRAN code.

Conda also makes it easy to seamlessly switch between Python2 and Python3, as well have multiple versions of the same package installed. For example, you may have some project or code that expects matplotlib v1.3, and another project that expects matplotlib v2. Using a conda virtual environment will allow you to switch between the two, without having to modify your $PATH manually.

The miniconda flavor (recommended) of Conda can be downloaded [here](https://docs.conda.io/en/latest/miniconda.html). And the install instructions are [here](https://conda.io/projects/conda/en/latest/user-guide/install/index.html#regular-installation). 

During the installation process you will be asked "Do you wish the installer to initialize miniconda by running conda init?" We recommend selecting yes. Next when you restart your terminal your prompt will change from something like:
```
me@mymachine $
```
to 
```
(base) me@mymachine $
```
This tells you that your `base` conda environment is active.

In general, it is a good idea to create an environment for each project and not install packages into your base environment. 
Create an environment (replace MY_ENV_NAME with whatever name you like):
```
conda create -n MY_ENV_NAME
```
Activate an environment:
```
conda activate MY_ENV_NAME
```
Your terminal prompt will update to let you know that your active environment has changed.
Install packages into your active environment:
```
conda install -c conda-forge -c mosdef mbuild 'python=3.7'
```
In the above example the `-c` flag tells conda to use additional channels (conda-forge and mosdef) and we can tell conda to install a specific version of a package by including it in quotes with an equality (e.g. =,>=,<, etc).

Creating environments can be tricky and it's hard to remember what packages you installed. It can be useful to keep track using an [environment.yml file](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html?highlight=yml#creating-an-environment-file-manually). Then you can create your environment simply using the command:
```
conda env create -f environment.yml
``` 
  
[More on conda environments.](https://conda.io/projects/conda/en/latest/user-guide/getting-started.html#managing-envs)