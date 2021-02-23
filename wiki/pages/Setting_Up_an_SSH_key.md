Creating an SSH key is a convenient and secure way to log onto computers remotely. SSH stands for "secure shell" and is the portal we use to connect to computing resources. We also use SSH keys to push and pull code from our repositories. [Github](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) has a guide that explains how to generate an SSH key and then add that SSH key to your account. You don't need to provide a passphrase when generating an SSH key.

You can check if you already have an SSH public/private key pair by running 
```bash
ls ~/.ssh
```
If you see `id_rsa` and `id_rsa.pub` then *do not* generate a new key.
 Use the command $ cat id_rsa.pub 
 This will spit out your key. Copy and paste that into your account's ssh key that is located in your account settings on github.
 * just as a side note name you ssh key something that is related to the computer you are connecting to. Example "CMELAB Chrome Book"

You can generate a new SSH key using:
```bash
$ ssh-keygen -t rsa -b 4096 -C "user_name@email.com"
```

1. If you're not on campus, you'll need to connect to the Boise State network through [vpn](https://www.boisestate.edu/oit-network/vpn-services/) before you can connect to BSU clusters.

1. Make sure that you can log onto the cluster with your username and password
```
ssh username@fry
```

1. If you sucessfully logged in, log out and run this command (locally) on your computer:

**LINUX**

```ssh-copy-id username@fry```

**OSX**

```cat ~/.ssh/id_rsa.pub | ssh username@fry "umask 077; mkdir -p .ssh ; cat >> .ssh/authorized_keys"```

Now you should be able to ```ssh username@fry``` without having to provide a password!
