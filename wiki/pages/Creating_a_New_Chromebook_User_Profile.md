# This machine already has GalliumOS on it, but I don't have an account!

This guide explains how to make an account on the Chromebook you would like to use.

In order to complete this guide, the GalliumOS Linux distribution must already be installed on your device (you should see a GalliumOS splash screen on boot). If you do not see this screen, or there is any other indication that your Chromebook is running ChromeOS instead, please follow the steps at [Brand New Chromebook from the Box](Brand_New_Chromebook_from_the_Box.md) in order to install Linux.

If another cme-lab user has already used your Chromebook, the main, frequently-used programs should be available to you on your account, however if you are the first user of the device, or find some of those programs missing, please check out the guide at [Installing the Frequently-Used Programs for CME-Lab](Installing_the_Frequently-Used_Programs_for_CME-Lab.md) to get set up!

## Getting your user account set up

This guide will detail the steps required to take a Chromebook with a fresh installation of GalliumOS and turn it into science-doing device!

1. First, log into the cme-lab account:

    ```
    username: cme-lab
    ```

    ```
    password: planetexpress
    ```

1. Then hit `Ctrl` + `Alt` + `T` to open a new terminal.

1. To create the new user, type the following:
    ```
    sudo adduser <username>
    ```
    Replacing ```<username>``` with the username you wish to use. We recommend something like the first letter of your first name followed by your last name. 

1. You will then be asked for the ```[sudo] password for cme-lab```, which is "planetexpress".

1. At the ```Enter new UNIX password``` prompt, create a password for your new account. You may leave the information fields blank, as in the example image below:

    ![New User Example](http://i.imgur.com/bXRYtgj.png)  

1. In order to install software and make other changes to your machine, we will need to add the new user to the ```sudo``` group (super user do).

    ```
    sudo usermod -aG sudo <username>
    ```

1. Now you can log out of the cme-lab account and log back in with our new username and password. To logout, click in the lower left (looks like the aperture science logo) and then the power button in the upper right of the menu. 

1. Now that you are logged in as your new user, it is important to connect to the wifi! It is recommended that you use eduroam whenever you are on campus. If your home institution supports it, you can log in using your university username and password (if you are a Boise State student, your my.boisestate.edu username and password should work). Set the security settings as in the below image:

    ![Wifi Settings](http://i.imgur.com/81xDgWU.png)

Your user account has now been created! If Cisco Anyconnect, the lab "dot config files", VMD, or Conda are not installed on your device, then please see the guide at [Installing the Frequently-Used Programs for CME-Lab](Installing_the_Frequently-Used_Programs_for_CME-Lab.md) to set them up.
