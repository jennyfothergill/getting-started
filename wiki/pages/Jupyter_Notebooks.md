# What is a Jupyter notebook?

A Jupyter notebook is an open-source browser based application which is a handy tool for writing code interactively. It lets you write code, view results and write up observations about the results all at the same place.

## How to install?

The easiest way to install Jupyter notebook is using a package manager for Python like conda. [Conda quickstart guide.](https://bitbucket.org/cmelab/getting-started/wiki/Getting%20Started%20With%20Conda)
You can use conda to install Jupyter notebook into your active environment by typing the following into your terminal:
```
conda install -c conda-forge notebook
```

Then you can start a Jupyter notebook by typing the following into your terminal:
```
jupyter notebook
```

## What can I do with Jupyter notebook?

* [Run python code](https://github.com/jupyter/jupyter/wiki/A-gallery-of-interesting-Jupyter-Notebooks)
* [Visualize plots using matplotlib](https://matplotlib.org/gallery/index.html)
* [Run HOOMD simulations](https://github.com/glotzerlab/hoomd-examples)

## How can I run a notebook on a cluster?

1. `ssh` onto cluster and `cd` to the location you want to run the notebook
1. Start the notebook with `jupyter notebook --no-browser --port=8899`
1. Look at the output closely! You may get this `The port 8899 is already in use, trying another port.` If this happens **use the port it chooses in the next step** instead of `8899` so for example, if your output looked like this

        [I 14:23:20.400 NotebookApp] The port 8899 is already in use, trying another port.
        [I 14:23:20.403 NotebookApp] Serving notebooks from local directory: /home/nealeellyson
        [I 14:23:20.403 NotebookApp] The Jupyter Notebook is running at:
        [I 14:23:20.403 NotebookApp] http://localhost:8900/?token=e22d53bbddb431551791de00fb457dcc281bd87145fc80d4

    notice in the output link the notebook is running on port 8900, so you would use port `8900` in the step below.

1. Open another terminal on your local computer and run `ssh -N -L localhost:8899:localhost:8899 user@host` for example: `ssh -N -L localhost:8899:localhost:8899 mikehenry@fry`
1. Copy and paste the link from the output of the `jupyter notebook` (if you get more than one link, use the one with `localhost` in it) you ran in step two into a web browser.

You are now running a notebook on the cluster!

(make this paragraph better) In the above example, the notebook is running on the head node. This is OK for quick visualizations, but generally if you are doing anything intensive, you'll want to request a node as in the following example.

## How can I run a notebook **on a node** on a cluster?

1. Like before, `ssh` onto cluster and `cd` to the location you want to run the notebook
1. Check out an interactive bash terminal on a node using `srun -N 1 --pty bash`. Your command prompt should change from something like `[user@cluster_name ~]$` to `[user@node_name ~]$`.
1. (only if necessary) To prevent jupyter from getting a permissions issue, you may want to unset the `XDG_runtime_dir` using this command: `export XDG_RUNTIME_DIR=""`
1. On the node, start up a jupyter notebook using `jupyter notebook --no-browser --port=1234`. You should get an output with something like this:


        [I 10:52:36.309 LabApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
        [C 10:52:36.314 LabApp] 
    
            To access the notebook, open this file in a browser:
                file:///run/user/1024/jupyter/nbserver-13849-open.html
            Or copy and paste one of these URLs:
                http://localhost:1234/?token=79bff5a197239f24ef91dd4a8dfbd1a7d796b1b4999e3da9
             or http://127.0.0.1:1234/?token=79bff5a197239f24ef91dd4a8dfbd1a7d796b1b4999e3da9

    Copy the web address from that last line, we'll need it for later.

1. Open another terminal on your local computer and run:

    `ssh -L 9999:localhost:9999 USER@CLUSTER ssh -L 9999:localhost:1234 -N USER@NODE`

    replacing `USER`, `CLUSTER`, and `NODE` with your username, the name of the cluster and node you're using. This is opening a tunnel from local to the cluster and from the cluster to the node. ([more explanation here](https://superuser.com/a/97007)) Note that the ports in this example, `9999` and `1234`, are completely arbitrary. It is important, however, that the `1234` port in this step be the same as the port used in step 4.

1. In your web browser, paste the web address you copied from the output of step 4, but change the port to the other port you used in step 5. In this example, we would copy

        http://127.0.0.1:1234/?token=79bff5a197239f24ef91dd4a8dfbd1a7d796b1b4999e3da9

    but change it to

        http://127.0.0.1:9999/?token=79bff5a197239f24ef91dd4a8dfbd1a7d796b1b4999e3da9
                         ^^^^

    in the browser. (`^^^^`'s are just to show where the port is in the address.)