## VIM

In the examples below, a keystroke or series of keystrokes is followed by a 
description after a dash ('-').  Keys with multiple letters (like 'tab' and 
'esc') will be wrapped with '<' and '>'. 

*   <esc> - Puts vim in 'NORMAL' mode, or cancels a command that you have 
        begun entering.
*   i - When in 'NORMAL' mode, this puts vim into 'INSERT' mode so you may 
        type normally. 
*   : - When in 'NORMAL' mode, this opens a command prompt to enter commands.
*   v - When in 'NORMAL' mode, this puts vim into 'VISUAL' mode for selecting 
        text.
*   :w<enter> - Writes your file to disk (saves it) from 'NORMAL' mode.
*   :wq<enter> - Writes your file and then quits vim.
*   :q - Quits vim, but only if you have not changed the file, or have saved 
        it.
*   :q! - Quits vim even if you have not saved your recent changes.
*   u - When in 'NORMAL' mode, undoes anything typed when in 'INSERT' mode.
*   / - Allows for searching through text file.
*   :e file.example - Will open file.example as a buffer
*   :bn - Allows to quickly switching buffers

## BASH
*   pwd - prints out the current working directory
*   ls - lists the files and directories in the current working directory
*   ls -l - lists the files and directories, but in 'long' format
*   cd - changes the current working directory to your home directory
*   cd XYZ - changes into the XYZ directory, which must exist in the current
        working directory
*   mkdir - creates a new directory in the current working directory
*   rm XYZ - deletes file XYZ
*   rm -r XYZ - deletes directory XYZ
*   cd ..  Moves up one directory
*   There is a file in your home directory called `.bashrc` that is run each 
    time you log on.  Adding code to this file will help you set up your
    computing environment.


## Python
*   To invoke python from the command line, simply type 'python'
*   To run a python program from the command line, type 'python program.py'
*   Python lists start with index 0.  If a = [1,2,3,4], then 1 is stored in 
        a[0] and 4 is stored in a[3].
*   Code 'scope' in python is defined by tabs.  For example, in the code below
        The lines 'print(x)' and 'print(y)' will only be run if a==0.  They are 
        said to be in the scope of the if statement.  You may notice that 
        lines ending with a ':' are the ones that have blocks of code under
        their scope.

```
#!python
if a == 0:
    print(x)
    print(y)
print(z)
```

*   To install a new python package in your account only (in this example, the package is openpyxl):

```
#!bash
$ cd
$ mkdir software
$ pip install --install-option="--prefix=${HOME}/software" openpyxl
```

*   If the following line is not already in your '.bashrc' file you will have to add it:
    `PYTHONPATH=${PYTHONPATH}:${HOME}/software/lib/python2.7/site-packages`

*   To install a python package from source code that has `setup.py` created:

```
#!bash
$ cd /path/to/package #Note: you should cd to the actual path of the code you downloaded
$ python setup.py install --prefix=${HOME}/software
```

## GIT

*   git clone XYZ - Tells git to grab the repository at XYZ, copy it to 
        your machine, and start keeping track of it.
*   git pull - When run while in a git repository, this will tell git to
        fetch the most recent commits from the remote repository and then
        merge them into your local repository.
*   git push - pushes our local, most recent commit to our remote repository  
*   git add XYZ - Tells git to *stage* the file XYZ for a commit.  Only 
        files that are staged will be committed with a `git commit' 
*   git commit - Commits the staged changes to your repository, creating a
        new commit object.  This will open vim, where you will enter some
        comments describing your commit.  If you decide you don't want to 
        make the commit after all, leave the commit message empty.
*   git status - Gives information about the current project status  
*   git branch XYZ - takes our head and makes a new branch with that name XYZ
	that is pointing to where our head is pointing to.
*   git log --pretty=format:"%an" | sort | uniq -c | sort -g -r
	This command will print out the number of commits everyone has made 
	on the current branch you are on.  If you are wondering how many 
	commits you have made, you can use this to check!
*   git stash - Creates a stash object for when you want to make a git pull but 
		not want to commit any changes you have made.
*   git rm - Can be used to clean up directories and remove any unwanted code
*   git checkout - gives detailed information on where you are before doing a 
	commit. Tells what is ready to be commited and what needs to be fixed.
