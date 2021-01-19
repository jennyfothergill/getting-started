The chromebooks are super cool, and great for going through our Getting Started guides in this wiki.
However, after you've run a few larger MD simulations (~1000 particles or more), you'll begin to notice that they aren't the fastest!
You need more power, and here in the CMELab, we have access to power in absolute spadefuls.
The following guide will help you get set up on our main supercomputers, and allow you to hit insane TPSes that will make you feel like nothing short of a molecular dynamics deity.


If you are unsure what 'TPS' stands for and why we want so many of them, you should have a look at the HOOMD tutorials in [[MD Tutorials]] first before looking at this guide.


Also, you'll need accounts on our supercomputing clusters - take a look at [[Accounts for computer clusters]] to get set up on Fry and Kestrel.


# What is a job scheduler and which one am I using? #


When we run simulations on clusters, we generally spend most of our time interacting with the job scheduler.
This is a very clever program that:

* Allocates the resources that we ask for for each job
* Creates a 'queue' that allows everyone to run jobs in a way that limits the average time we have to wait for a job to run, and is as fair as possible to all users
* Controls the execution, canceling, and completion of our jobs
* Allows us to get important information from the cluster, such as what nodes are available, and how busy the queue is.

When we log onto our cluster we are dropped into a terminal session on the 'head node'.
You shouldn't run jobs on the 'head node' as this can make it respond slowly when other people are trying to get on and will frequently make the system administrators grumpy.
Instead, we ask the job scheduler to run our code on the 'compute nodes', where our code can run without disrupting anyone else's work.
The job scheduler is ordinarily the only thing to interact with the compute nodes on the cluster.


There are many types of job schedulers available, and it is completely up to the system administrator as to which one is installed on the cluster that you are using.
For our purposes, at the time of writing, the scheduler on Kestrel and Fry is called 'SLURM', and the scheduler on R2 is called 'PBS'.
Functionally, these both do the same thing, although the syntaxes are subtly different for both.


## SLURM ##


### Quick Look ###
* To get the node topology, type `sinfo`
* To get the queue information, type `squeue`
* An example SLURM submission script is shown below, or is available as a file to copy for your project on `fry:/home/erjank_project/submit_template.sh` 

### Submission Script Anatomy ###


Here is a sample submission script for SLURM jobs. The file is saved as a bash shell script `submit.sh`.

```
#!bash

#!/bin/bash -l
#SBATCH -p batch
#SBATCH -J <JOB_NAME>
#SBATCH -o <LOG_OUTPUT_NAME>.log
#SBATCH -N 1
#SBATCH -n 1
#SBATCH --mail-user=<YOUR_EMAIL_ADDRESS>
#SBATCH --mail-type=All
#SBATCH -t 48:00:00
#SBATCH --gres=gpu:1

<SET UP ENVIRONMENT>
python <MY_SCRIPT.py>
```

We now go through the script line-by-line.
Note that each line that begins with `#SBATCH` is a direct command to SLURM.
Also, anything that has the angle brackets (<>) are placeholders that you should change to suit your project's needs.
The rest of the script will be specific to how you invoke your project, but generally it ends up looking pretty similar to what you would have to type to run your job locally.


* `#!/bin/bash -l` - This line (sometimes known as the shebang) tells the operating system to execute this file as a bash script, instead of something else.
* `#SBATCH -p batch` - The `-p` here stands for 'partition', which tells SLURM which nodes you want to run on.
The partition is just the name allocated by the system administrator to a specific group of nodes.
On clusters with different hardware configurations, it's sometimes useful to have several partitions.
In the case of Fry and Kestrel, however, we usually use the `batch` queue (not to be confused with `SBATCH`, which just means we're talking directly to SLURM and nobody else.)
* `#SBATCH -J <JOB_NAME>` - The `-J` here stands for 'job name'. This can be anything you like, but it's a good idea to use sensible job names so that you can quickly see which jobs are running and which ones aren't when you next type in squeue.
* `#SBATCH -o <LOG_OUTPUT_NAME>.log` - This is a very important line that tells the compute node where to output (that's what the `-o` is) the standard out (STDOUT) to.
You are probably used to having STDOUT directed to your terminal window, which is why you see a bunch of text appear when you run HOOMD jobs locally (telling you important things like how fast your simulation is running and how much longer it has to go).
Since we don't interact with the compute node directly, we would never see this output, unless we ask SLURM to redirect it to this file.
This command tells SLURM where we want that file to be.
Note that by default, if the file already exists, it will be deleted when your job first starts running, so usually it's a good idea to provide a unique output name for each job you are running.
* `#SBATCH -N 1` - The upper-case `-N` stands for the number of nodes to use for your job.
Keep this as 1, unless you really know what you're doing and have a good reason for running your code on multiple nodes.
* `#SBATCH -n 1` - The lower-case `-n` stands for the number of processing cores to use for your job.
This number depends a lot on the cluster's topology.
Fry and Kestrel have two CPUs on each node, each of which has 8 cores.
If you're running molecular dynamics simulations, the heavy computation is performed by the GPU, so you only need one CPU core to control it (any more would be a waste of resources).
Depending on how the code you are running is parallelized, it might make sense to change this number to be higher.
As before, unless you have a good reason, probably don't change it.
* `#SBATCH --mail-user=<YOUR_EMAIL_ADDRESS>` - You can put your e-mail address here if you like, and then SLURM will e-mail you when your job status changes (for instance when it is queued, when it starts to run, and if it gets canceled, fails, or succeeds).
If you don't want any e-mail notifications, you can safely delete this line.
* `#SBATCH --mail-type=All` - You can change this to modify what notification e-mails you get from SLURM.
If you don't want any e-mails, delete this line too.
* `#SBATCH -t 48:00:00` - The `-t` stands for time limit, and you can use this to set a maximum time for your job, using the syntax `D-HH:MM:SS`.
The maximum value this can take is displayed for each partition when you do `sinfo`.
When your job has been running for this time, it will terminate (and not cleanly!).
That means if you set a time limit of 48 hours for your job that takes 49 hours and only creates an output at the end of the job (why did you do that to yourself??), you'll never see that output and the entire runtime will be wasted.
**Always have a rolling output like a HOOMD energy `log` file, or a `gsd` trajectory to avoid disappointment if your job dies, the cluster goes down, or you set the wrong time limit!**
On Kestrel, there is no maximum value that `-t` can take, but it's still worth putting in an estimate of how long your job will take.
This is because SLURM uses this value to work out the priorities (a short job takes precedence over a long job, so it will try to slot in a couple of short jobs first before it starts blocking out resources for the long job).
* `#SBATCH --gres=gpu:1` - This command asks SLURM for additional resources - namely a single GPU.
You will want to use this for any molecular dynamics simulation containing more than about 1,000 particles (ballpark figure).
Below this size, you might find that you get a higher TPS running HOOMD on the CPU (you should experiment to find out!), but as you get to large systems, GPUs are nearly always faster.
You can also ask for multiple GPUs here by increasing the 1 in this line.
While it might seem like your job will run twice as quickly, in reality you only get a 30% speedup for a second GPU because of the increased communication time across the board.
Adding more will require an additional node, and that will massively penalize your TPS, as now communication has to be between nodes, which is much slower than when everything is on the same silicon.
An exception to this is Fry's `nvlink` partition, which consists of a single node with 4 GPUs attached to it.
This is unbelievably awesome and we're very lucky to have it.
* `<SET UP ENVIRONMENT>` and `python <MY_SCRIPT.py>` - This collection of lines will be used to set up the environment on the compute node.
Everything after the `#SBATCH` lines is executed by the compute node after the resources have been allocated by SLURM.
We have to set up the compute node to be ready to execute our code, otherwise it might crash!
The lines of code here will be very project specific, but a good general rule is that all the code that you need to run your script locally will also be needed here.
For instance, you may have to change directory to a specific place to run your code.
Additionally, any conda environments you are using will need to be activated using `source activate <ENV NAME>`, or `conda activate <ENV NAME>` depending on your version of conda.
You may also need to activate `modules` based on what you are doing.
`modules` are pretty ubiquitously found on all clusters to sort out various path variables, namespaces, and allow multiple versions of the same program to be installed on the cluster simultaneously.
You can have a look at what modules are available by typing `module available` or `module av` (or equivalent based on the cluster), which will list the programs installed on the cluster.
If you are using HOOMD, then you will almost certainly need to activate the HOOMD module (if multiple HOOMD modules are installed, you may have to specify a version. If you have completed the HOOMD tutorials in [[MD Tutorials]], you are probably familiar with HOOMD v2.X or later).


Your job can now be submitted to SLURM and run on the cluster by typing `sbatch submit.sh` from the containing directory.
After submission you should see your job either running or in the queue when you type `squeue`!
If not, check the log file you set with the `-o` command to see what went wrong, and don't be afraid to ask for help if you can't work out why it didn't work!


## PBS ##


Coming soon™!


# Copying files from the cluster #


After running our jobs, we generally need to analyse the results!
Sometimes it is appropriate to first copy the output files (for instance, the .gsd files, the signac-flow workspace, or the MorphCT output directory) to your local machine to perform the analysis.
There's no hard and fast rule for when to do this.
If your analysis takes a long time to run and is computationally intensive, then you might be best setting up a submission script as described above and using the cluster's compute nodes to do the analysis.
Otherwise, if you want to generate and look at figures, explore your morphology in VMD, or use iPython notebooks to visualize your data, then it's probably better to copy the files to your local machine first and do the analysis there.
(Tech note: If you do choose to run your analysis on the cluster, you can still plot graphs on the cluster using matplotlib; just make sure that you use a non-interactive backend for plotting, which looks something like `import matplotlib; matplotlib.use("Agg"); import matplotlib.pyplot as plt`)


There are two linux programs that we can use to copy files: `scp` and `rsync`.
Additionally, if we are using a national cluster through XSEDE or somesuch (for example: comet, bridges), then globus might be a better option (setting up a globus endpoint will be covered below).
For most intents and purposes, `rsync` is functionally and syntactically the same as `scp`, but it is way more powerful, so that's the one we will focus on here.

## Using rsync ##

### The Basics ###

Rsync (and scp) both have the following syntax that you can use to copy a file or directory from one place (the "source") to another place (the "destination"):

`rsync <source> <destination>`

When copying to and from clusters, it's generally preferred to execute the command on your local machine (i.e. not SSHed into the cluster).
That way, we can use absolute and relative paths that we are used to (for instance `~/Projects/` on our local machine) as the source/destination, without having to know the IP address of our local machine, and we also know the hostnames of the cluster we are trying to connect to because we use the exact same syntax to SSH.

This is perhaps best demonstrated by an example.
Let's say Jo Bloggs is trying to copy the file `work.txt` from Fry to the current directory their local machine, and then copy the file `code.py` from their local machine to Fry.
The commands Jo would use look like this:

`rsync jobloggs@fry.boisestate.edu:~/work.txt ./work.txt`
`rsync ./code.py jobloggs@fry.boisestate.edu:/scratch/jobloggs/code/`

Hopefully you can see that it would be a lot harder to copy those files if we ran the rsync command from on Fry.
A cool thing to note is that because we used the `user@hostname:` syntax, rsync knows what the home directory is when it sees the tilde, `~`.

For copying directories, don't forget to use the `-r` (for recursive) flag:

`rsync -r jobloggs@fry.boisestate.edu:/scratch/jobloggs/code /home/jobloggs/Projects/`


### Useful flags ###

On its own without any flags, rsync is not super informative, so it can be useful to create an alias for rsync that includes some cool extra features.

`alias rsync="rsync --update --stats --progress"`

The `--progress` flag provides terminal output as each file is copied to see how things are progressing.
`--stats` provides additional information about how fast the files are being transferred.
`--update` is a really cool flag that first checks the destination to see if the file already exists.
If it does, then rsync skips that file and doesn't download it.
This can be super useful, but sometimes we want to make sure that all files are replaced, so it might be worth leaving this one out of your alias, depending on your use case.

Another cool feature of rsync is the ability to apply filters to your copying.
For instance, `--include` or `--exclude` can be specified to only copy files that match or do not match a particular pattern.
As an example, if Jo wanted to transfer the `output_files` directory, while making sure to skip all gsd files, they could use:

`rsync -r --exclude="*.gsd" jobloggs@fry.boisestate.edu:/scratch/jobloggs/outputs ./outputs_from_fry`

When transfering a large number of files, it can sometimes be useful to use the `--dry-run` option.
This performs a trial run that enumerates and calculates all of the files to be transferred (outputting their names to the terminal), without actually copying anything.
Use this to check that your `--include` and `--exclude` filters are picking up the files that you want, before you actually trigger the transfer.

That's all for the basics of rsync - be sure to check out `rsync -h` or the man pages for more functionality and in-depth information.

## Using Globus ##

Globus is a really cool way of triggering copy jobs from one machine to another that then run in the background while you do other stuff.
This is especially useful when transferring a large amount of data (many GBs), or if you want to pause and resume the transfer for whatever reason.
Additionally, some clusters do not allow direct connections through ssh, so scp or rsync do not work for transferring files to your local machine.
Unfortunately, using Globus requires some additional setting up for your local machine.

1. Log in to [globus.org](https://www.globus.org/) by selecting Boise State University as the institution and then logging in using your normal BSU credentials.
1. You will be met with the file manager - this is how all transfers will be triggered.
    ![File Manager](https://imgur.com/GZbtLtS.png)
1. Select the "Endpoints" option from the sidebar. Globus Endpoints are the computers we transfer the data between.
1. You can create a new Endpoint by selecting "Create new endpoint" in the top right of the page.
    ![Endpoints](https://imgur.com/1yKW0yg.png)
1. Select "Globus Connect Personal Endpoint" from the options, and follow the on-screen instructions.
    ![Create Endpoint](https://imgur.com/e97J11x.png)
1. After your endpoint has been created, and Globus Connect Personal is running on your local machine, you are ready to start file transfers! Simply click the button in the top right that opens up a second panel in the file manager, and select the endpoints and directories that you want to copy between. Note that most clusters will require additional authentication - just follow the onscreen instructions to log into the cluster as you would if sshing for the first time.
    ![Select Endpoints](https://i.imgur.com/SfMFPxK.png)
1. You can then select the files you want to transfer and the directories to transfer to in the File Manager as shown below. You can set additional transfer options by selecting the "Transfer & Sync Options" button along the bottom (pro tip: the "sync" checkbox acts the same as rsync's `--update` flag), and then hit start whenever you are ready. The transfer job will begin and you can check its progress by selecting "Activity" in the sidebar.
    ![Begin Transfer](https://i.imgur.com/2T1QkJt.png)
