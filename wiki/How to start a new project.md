This is a high level overview on how to start a new project in the CME lab.

### 1. Make a new folder ###

To keep things organized, I like to make a new folder for each project in a `Projects` folder in my home, so if you wanted to name your project something like `dna_cg` for a coarse-grain DNA project, you would use this command: `mkdir ~/Projects/dna_cg`

### 2. Initialize a git repository ###

It is never to early to start using git, even if you haven't written any code yet. `cd` into your project and create a git repository. Using the same example from above:

```
#!bash

cd ~/Projects/dna_cg
git init
```

### 3. Create and commit your first file ###

A good first file to create is a "README" file which describes your project.
In the early stages of a project I like to use the README to keep track of ideas and outline what I want to do.
Fire up your favorite text editor and create the README file, `vim README.md`
Now that we've made our README file, lets add it to our git repo.

```
#!bash

git add README.md
git commit -m "added README file"
```

### 4. Add project to CME lab Bitbucket team ###

1. Go to https://bitbucket.org/ and click on the `+` then select Create -> Repository
1. Set the owner to cmelab, project LabStuff (this can be changed later), give the repo a name, keep the private box checked (people in the lab will still have access to the repo) make sure to not include a README and that Git is the version control system, see screenshot below:
![new repo settings](https://i.imgur.com/oDEFOGy.png)

1. Bitbucket will then tell you the commands to run to push the repository to bitbucket, they will look something like this

```
#!bash

cd ~/Projects/dna_cg
git remote add origin git@bitbucket.org:cmelab/dna_cg.git
git push -u origin master
```

### 5. Set up a conda environment (if project is python based) ###

I like to have a conda environment per project to prevent version conflicts between different software dependencies.

```
#!bash
conda create -n dna_cg
conda activate dna_cg # "source activate dna_cg" on older conda versions
pip install matplotlib # use pip for pip install-able things
conda install -c conda-forge hoomd 
```