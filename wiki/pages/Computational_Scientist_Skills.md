This page provides an aggregation of computational skills for roughly three reasons:

1. To enumerate the wild and wacky things you can do, built on years of shouting at awful error messages
1. To centralize the skills we expect of growing computational scientists (so you can see what you *should* know!)
1. To provide a place to roughly measure your growth as a computational scientist over time

When adding skills here, let's aim to focus on *common* skills or *commonly encountered* tasks. If we hit 10 skills in one category, make the case in your commit message why your replacement is more common than the one you've taken out.

## BASH: Beginner ##
1. Change the ```PS1``` environmental variable to be more useful
1. Create a new directory
1. Move a file
1. Copy a file
1. Use a glob to move multiple files at once 
1. Use ```ssh``` to get a shell on another computer
1. Can check a file's permissions
1. Can recall <Ctrl-C> and <Ctrl-D> and can occasionally use them correctly to "get a command prompt back."
1. Can follow directions for setting up ssh keys on another server or bitbucket
1. Can use ```ls``` and ```cd``` to explore the directory structure of a machine

## BASH: Intermediate ##
1. Write a loop in a bash script to do _something_ on multiple folders/files
1. Write a bash script using conditionals
1. Write a bash script using tests  
1. Pipes ```history``` to ```grep``` to find that one recent command that they can't remember
1. Knows to amend their ```PATH```, ```LD_LIBRARY_PATH```, and other environment variables with commands in the appropriate dotfile to make sure the expected executables and libraries are found at runtime
1. Can use ```which```, ```echo```, and verbose output from an executable to debug unexpected versions of a program running
1. Can explain the permissions associated with a file and knows how to look up how to change them.
1. Can recall and use ```cd -``` to hop back and forth between two directories when doing something that depends on both of them

## BASH: Expert ##
1. Can remember, and frequently uses, bang-commands (!), to execute commands with arguments from previous commands
1. Can remember, and frequently uses, string chopping  (%, #) to help with things like renaming files 
1. Can recall numerical permissions associated with chmod and recursively apply them to a directory tree

## MD: Beginner ##
1. Be able to answer: What are periodic boundary conditions and why are they useful?
1. Draw the Lennard-Jones (LJ) potential


## MD: Intermediate ##
1. Be able to quantify structure of your simulation using a radial distribution function (rdf) or structure factor.
1. Be able to quantify dynamics of your simulation using a measured diffusivity or some other property that quantifies how much particles move in your system (as a function of temperature).
1. Recall the physical meanings of the two Lennard-Jones parameters, and what the nearest-neighbor distance should be for a particular instance of the LJ potential.
1. Can explain dimensionless units and perform conversions from time and pressure into "real" units.


## MD: Expert ##
1. Explain, with numbers, which snapshots from a simulation trajectory are representative of the equilibrium distribution and how long one must wait between decorrelated snapshots. 
1. Perform thermodynamic integration with a bias potential
1. Create a C++ plugin for HOOMD

## python: Beginner ##
1. Write a loop
1. Write a function
1. Make a plot using matplotlib
1. Explain the difference between assignment and checking whether two things are the "same"
1. Explain the difference between running a python interpreter, interactive notebook, and executing a python script


## python: Intermediate ##
1. Frequently uses the help() command to look up documentation on functions
1. Can explain differences between integer and floating point encoding of numbers
1. Can explain *what* went wrong and where it went wrong, based on an error message (but does not necessarily need to know how to fix)
1. Can install "local" python packages and import them in scripts with the appropriate ```PATH``` updates. 
1. Can check for consistent indentation throughout a file and convert tabs to (preferably 4) spaces.
 

## python: Expert ##
1. Can explain, and utilize differences between, references to and copies of memory in appropriate scenarios
1. Frequently profiles and tests code to understand bottlenecks and ensures correctness
1. Can call C, C++, fortran, or other code to operate on data structures defined in python


## Stat Mech: Beginner ##
1. Be able to explain what microstates and macrostates are
1. Be able to explain what an ensemble of microstates is


## Stat Mech: Intermediate ##
1. Explain what "equilibrium" is and how to check whether a system is at equilibrium or not.
1. Explain what "entropy" is
1. Can write down the partition functions for all ensembles
1. Can look at a radial distribution function and explain what state of matter or what kinds of configurations it could have been calculated from

## Stat Mech: Expert ##
1. Modify the acceptance criteria in a Monte Carlo simulation to enable biased trial moves to be attempted
1. Can recall Maxwell's relations and use them to derive all thermodynamic properties of a system with a specified partition function
1. 

## Reading papers: Beginner ##
1. Use google scholar and web of science to search for papers on a topic
1. Use doi or citation information to look up reference from a paper
1. Articulate the steps you are going through when reading a paper


## Reading papers: Intermediate ##
1. Articulate what the figures in a paper are trying to say


## Reading papers: Expert ##
1. Be able to articulate what a paper is about based on the abstract and figures, explaining how these inform the methods and measurements you'd expect to see in the paper.

## Presenting: Beginner ##
1. Effectively use entire slide

## Presenting: Intermediate ##
1. Use slide titles to summarize main point/objective of slide

## Presenting: Expert ##
1. Leverage slide layout to enforce content 

## Writing: Beginner ##
1. Don't break the chain (write a bit everyday)!

## Writing: Intermediate ##
1. Can understand and appropriately respond to the concerns from reviewers during a paper's evaluation with a journal (including construction of the easy-to-read reviewer response letter)
1. Can recall a dozen papers that are fundamental, must-cite papers for a current project

## Writing Expert ##
1. Can craft the letter to the editor that accompanies the submission of a paper with an argument of why this paper is the right fit for this journal, and explaining why the six included people are appropriate referees to recommend