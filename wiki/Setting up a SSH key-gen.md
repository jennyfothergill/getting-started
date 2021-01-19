To save you from having to type in your password every time you connect to a cluster, you can create an SSH key:

* Generate a SSH key:
While in the bash terminal, type:
```
#!bash
$ ssh-keygen -t rsa -b 4096 -C "user_name@email.com"
```
then follow the terminal prompts to create the ssh key.
More information can be found at: <https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/#platform-linux>

Once the key has been created, enter your ssh folder:
```
#!bash
$ cd ~/.ssh/
```
Copy your public ssh key to the clipboard:
```
#!bash
$ cat id_rsa.pub
```
to print the contents of the file. You can then use Ctrl+Shift+C to copy the information to the clipboard.

Next, ssh to the cluster and enter the cluster's ssh folder (same way as above):
```
#!bash
$ cd ~/.ssh/
```

Now open the authorized_keys file, or create if none present and then open:
```
#!bash
$ mkdir authorized_keys
$ vim authorized_keys
```
Once the file is open, copy the rsa key into the folder with Ctrl+Shift+V, then save and exit.
Now when you connect to the cluster, it should no longer ask for your password.