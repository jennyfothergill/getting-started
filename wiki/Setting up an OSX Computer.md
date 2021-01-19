### **Welcome!!!**

For any questions, programs, or accounts that aren't addressed here, look at the other tabs in the Wiki of the [**getting_started**](https://bitbucket.org/cmelab/getting-started/wiki/Home) repository. 

* First things first, let's get Python downloaded! To download Python, go to the [Python Website](https://www.python.org/downloads/) and download the newest version for Mac OS X. Follow the instructions on your computer to download it and make sure it exists by either running
    * `python --version` OR
    * `python` (to exit use `exit()`)

* Next, let's install [Homebrew](https://brew.sh), the missing package for macOS! This will make our lives a lot easier when trying to install other things later. Run the below command

      `/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

      If you are having issues with Homebrew or something isn't downloading correctly, `brew doctor` is a great command to check and see what is going on. You may also need to do `brew upgrade` if things still aren't working.

* Now install some much needed packages!
    * `brew install git`
    * `brew install make`
    * `brew install build-essential`
    * `brew install rlwrap`
    * `brew install wget`

* Since git is installed now, clone [**cme_utils**](https://bitbucket.org/cmelab/cme_utils/src/master/) and [**getting_started**](https://bitbucket.org/cmelab/getting-started/src/master/) from Bitbucket since they have important settings that we use to run our simulations and code.

* This part is more optional than required but our [**getting_started config_files**](https://bitbucket.org/cmelab/getting-started/src/master/config_files/) folder has some defaults already set up for your bash_profile, vmdrc (which you will download in a moment), and vimrc and you can follow the below commands to copy them into your own files. 
    * `cd getting-started/config_files/`
    * `cp bash_profile ~/.bash_profile`
    * `source .bash_profile`
    * `cp vmdrc ~/.vmdrc`
    * `cp vimrc ~/.vimrc`

* Install [VMD](https://www.ks.uiuc.edu/Research/vmd/)! (If you're running OSX Catalina, use this [VMD](https://www.ks.uiuc.edu/Research/vmd/mailing_list/vmd-l/31208.html)) This allows you to visualize the gsd files we make when running simulations. You will have to make an account to do this. Then, run the following things:
    * `git clone https://github.com/mphoward/gsd-vmd` ([github link](https://github.com/mphoward/gsd-vmd))
    * `cd gsd-vmd`
    * **Catalina users only** change line 18 in CMakeLists.txt from `set(CMAKE_OSX_ARCHITECTURES "i386;x86_64" CACHE STRING "Build architectures for OSX" FORCE)` to `set(CMAKE_OSX_ARCHITECTURES "x86_64" CACHE STRING "Build architectures for OSX")`
    * `mkdir build && cd build`
    * `cmake ..`
    * `make install`

* Download Miniconda! For more extensive instructions, visit the **Installing the Frequently-Used Programs for CME-Lab** tab in the wiki of the [**getting_started**](https://bitbucket.org/cmelab/getting-started/src/master/) repository. 
    * `cd Downloads/`
    * `wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh`
    * `bash Miniconda3-latest-MacOSX-x86_64.sh`
    * `conda source`

* Now we can install programs with conda! Some of these might be repeats so remove any of them that you don't want to install again.
    * `conda install -c mosdef -c omnia mbuild foyer --only-deps`
    * `conda install -c conda-forge -c mosdef -c omnia hoomd jupyter numpy matplotlib freud gsd`
    * `conda install -c conda-forge signac signac-flow`

#### **RECOMMENDED:** If you don't want to install all these things for all projects you will be working on, you can create conda environments to reflect what you want each of them to do.
`conda create --name <new environment name>` --> creates a new environment  
`conda activate <environment name>` --> puts you in your environment  
`conda deactivate` --> takes you out of your environment  
`conda env remove -n <environment name>` --> removes an environment  
`conda create --name <new environment name> --clone <the one you are cloning>` --> copies one environment into another

#### **NOTE:** If you haven't used vim before as an editor, you can do a tutorial with the command `vimtutor` which will help you understand how to type in files!