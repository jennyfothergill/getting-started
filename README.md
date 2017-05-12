# Welcome to the Jankowski Lab!#

This repository, and the associated [wiki](https://bitbucket.org/cmelab/getting-started/wiki/Home) is the one-stop shop for figuring out what to learn, where to go, and what to do when getting started in the [Computational Materials Engineering Laboratory](http://coen.boisestate.edu/cmelab/).

Research in this lab happens in a lot of places. You'll be using software on your computer,
computer clusters at Boise State, computer clusters at other schools, and managing projects
all over the place.

This document has a checklist for the very very first things you need to,
and then pointers for next steps.

In the beginning, you'll need to get a number of website accounts set up, get a number of computing accounts set up, get access to the lab, and make sure you get paid.


### Websites where you need accounts ###
* <https://bitbucket.org> - This website, where we manage all of our code.
* <https://www.mendeley.com/> - Where we manage references and reading assignments.
* <https://www.dropbox.com/> - File sharing for presentations, figures, reports, etc.
* <https://www.xsede.org/> - Gateway to National supercomputing resources

### Computer accounts ###
* [Request an account on Kestrel](https://secureforms.boisestate.edu/coen/kestrel-cpugpu-cluster-account-request-form/)


### Software  ###

VMD is used for visualizing the simulations:
<http://www.ks.uiuc.edu/Research/vmd/>

[Avogadro](http://avogadro.cc/) is a program that is useful to build molecules. It can be downloaded [here](https://sourceforge.net/projects/avogadro/files/latest/download).

### Getting paid ###

## The initial steps ##
* Figure out how to open a terminal command prompt on your machine.
* Get familiar with vim! The formatting below indicates a command to be run at that prompt:

    ```
    $ vimtutor
    ```

* Bash: http://swcarpentry.github.io/shell-novice/
* Git: http://swcarpentry.github.io/git-novice/ (This could be skipped and learned on the fly)
    * Use git to checkout this repository 
* Python: http://swcarpentry.github.io/python-novice-inflammation/

### Things I wish I knew when I started ###
* You learn by doing. 
* Always celebrate the small wins. 
* If you get stuck on a problem for more than an hour, don't be afraid to ask for help! 
* It's okay to not know what is going on. 


### What is this repository missing? ###

* How do I do ____?

#### Helpful Configuration Files ####
We utilize many different tools here, and we have found that the following configuration files are nice to get some of these tools to behave and look the way we want them to.
Having these configurations aren't mandatory, and if you like something else, feel free to change or not use them.

To install all of them, navigate into the config_files directory and simply type:

```
#!bash
$ make
```