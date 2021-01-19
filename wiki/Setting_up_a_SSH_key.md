Creating an SSH key is a convenient and secure way to log onto computers remotely. SSH stands for "secure shell" and is the portal we use to connect to computing resources. We also use SSH keys to push and pull code from our bit bucket repositories. [Bitbucket](https://confluence.atlassian.com/bitbucket/set-up-ssh-for-git-728138079.html) has a guide that explains how to generate an SSH key and then add that SSH key to your account. You don't need to provide a passphrase when generating an SSH key.

Now that you've created an SSH key we can use it to log onto a remote cluster.

1. First make sure that you can log onto the cluster with your username and password
```ssh username@fry```

1. If you sucessfully logged in, log out and run this command (locally) on your computer:

**LINUX**

```ssh-copy-id username@fry```

**OSX**

```cat ~/.ssh/id_rsa.pub | ssh username@fry "umask 077; mkdir -p .ssh ; cat >> .ssh/authorized_keys"```


Now you should be able to ```ssh username@fry``` without having to provide a password!