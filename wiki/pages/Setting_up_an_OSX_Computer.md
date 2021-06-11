### **Welcome!!!**

1. First things first, let's install [Homebrew](https://brew.sh), the missing package for macOS! This will make our lives a lot easier when trying to install other things later. Run the below command

      ```/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```

      If you are having issues with Homebrew or something isn't downloading correctly, `brew doctor` is a great command to check and see what is going on. You may also need to do `brew upgrade` if things still aren't working.

1. Now install some much needed packages!

   ```brew install git make build-essential rlwrap wget```

1. Since git is installed now, clone [**cmeutils**](https://github.com/cmelab/cmeutils) and [**getting-started**](https://github.com/cmelab/getting-started) from GitHub since they have important settings that we use to run our simulations and code.

   This part is more optional than required but our [**getting_started config_files**](https://github.com/cmelab/getting-started/tree/master/config_files) folder has some defaults already set up for your bash_profile, vmdrc (which you will download in a moment), and vimrc and you can follow the below commands to copy them into your own files. 
    ```
    cd getting-started/config_files/
    make
    ```

1. Install [VMD](https://www.ks.uiuc.edu/Research/vmd/)! (If you're running OSX Catalina, use this [VMD](https://www.ks.uiuc.edu/Research/vmd/mailing_list/vmd-l/31208.html).) Then install the [gsd-vmd plugin](https://github.com/mphoward/gsd-vmd) which allows you to visualize the gsd files we make when running simulations:
    ```
    git clone https://github.com/mphoward/gsd-vmd
    cd gsd-vmd
    ```
    
    **Catalina users only** change line 18 in the file `CMakeLists.txt` from 
    
    `set(CMAKE_OSX_ARCHITECTURES "i386;x86_64" CACHE STRING "Build architectures for OSX" FORCE)` to 
    
    `set(CMAKE_OSX_ARCHITECTURES "x86_64" CACHE STRING "Build architectures for OSX")`
    
    ```
    mkdir build && cd build
    cmake ..
    make install
    ```

1. Download Miniconda! For more extensive instructions, visit the [**Installing the Frequently-Used Programs for CME-Lab**](Installing_the_Frequently-Used_Programs_for_CME-Lab.md) tab in the getting-started wiki. 
    ```
    cd Downloads/
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    bash Miniconda3-latest-MacOSX-x86_64.sh
    ```

   Now we can install programs with conda! 

   #### **RECOMMENDED:** Create conda environments to reflect what you want each of them to do.
   `conda create --name <new environment name>` --> creates a new environment  
   `conda activate <environment name>` --> puts you in your environment  
   `conda deactivate` --> takes you out of your environment  
   `conda env remove -n <environment name>` --> removes an environment  
   `conda create --name <new environment name> --clone <the one you are cloning>` --> copies one environment into another

#### **NOTE:** If you haven't used vim before as an editor, you can do a tutorial with the command `vimtutor` which will help you understand how to type in files!
