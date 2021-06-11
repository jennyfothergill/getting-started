# I just took the Chromebook out of the Box!

Congratulations! Isn't it beautiful?

This guide is intended to help the reader set up a brand new Chromebook to the lab's specifications so that everyone can use it.

In this guide, we will activate developer mode on the machine, remove the write protection from the boot loader, and install a Linux operating system (GalliumOS) onto the machine.

If you already have GalliumOS on your Chromebook - you're in the wrong place! Check [Creating a New Chromebook User Profile](Creating_a_New_Chromebook_User_Profile.md) to find out how to set up your account and the programs you need to work in the cme-lab.

## Check the Chromebook Works Correctly

1. Initially, the battery may be uncharged. Plug it in, boot it up and check that everything powers up correctly. You do not need to set up wifi or create an account here - if everything looks like it's working, then simply power down and move on to the next stage.

## Activate Developer Mode

1. Firstly, reboot into Recovery mode by holding down the `Esc` and `Refresh` keys (where `F3` normally is), then quickly pressing the `power` button.

1. Once on the Recovery screen press `Ctrl`+`D`.

1. At the screen saying "To turn OS Verification OFF, press ENTER" press `Enter`.

1. When you see the "OS verification is OFF" screen, press `Ctrl`+`D` (This will need to be done every time the computer is restarted). If you leave the machine on this screen for too long it will beep very loud. Don't worry, you haven't broken anything.

1. You should now be able to log back in.

If these instructions are insufficient, a more in-depth guide on how to enable developer mode can be found at: <https://www.howtogeek.com/210817/how-to-enable-developer-mode-on-your-chromebook/>

## Check Developer Mode Works

EDITOR'S NOTE: In this section, you will use a command that effectively downloads a random script from somewhere online and runs it as a superuser. While the command in this guide is safe to run, be EXTREMELY careful and never run random scripts as a superuser without thoroughly checking what it does first. Malicious code can easily brick your device or completely compromise your security - both of these are very bad.

1. You will now need to create your account. Set up the wifi using Eduroam using your credentials from your home institution (i.e. Username and Password are the ones you use to access your University account).
    Set up the access settings in the image below (note that different operating systems vary in layout, but it is important to explicitly indicate that no CA certificate is required, and leave the anonymous identity field blank):
    
    ![Wifi Settings](http://i.imgur.com/81xDgWU.png)

1. From the ChromeOS desktop, press Ctrl-Alt-T to open a terminal. This will not work if developer mode has not been activated on the device.

1. From the terminal, type `shell` and hit `enter`.

1. We will now download and install the ChromeOS Firmware Utility Script, which will be used to complete the rest of the set up. The command to download and install the script to be typed into the terminal is `cd; curl -LO https://mrchromebox.tech/firmware-util.sh && sudo bash firmware-util.sh` ([Source](https://mrchromebox.tech/static/fwscript.html)).

    ![fwwpOn](http://i.imgur.com/5q3yDd8.png)

1. The above command will download and run the firmware utility script. Check that the Fw WP line (firmware write protection) is set to ENABLED (red) as in the image below.

    ![fwwpOn](http://i.imgur.com/rp6vf8z.png)

1. In order to install the Linux distribution, we need to disable the firmware write protection, which requires the removal of two screws from the motherboard. Before reaching for your screwdriver (a 2mm Phillips screwdriver should be perfect),  make sure everything is powered down and unplugged. Typing `Shift-P`, `Enter` from the firmware utility script should power down the Chromebook.

## Remove Write Protect Screws

1. Turn the Chromebook over and remove the 10 back-plate screws highlighted in the following image, putting them safely to one side. The two at the top (highlighted in blue) are longer than the other 8 (highlighted in red), which are identical.

    ![screws1](http://i.imgur.com/JJho8HN.png)

1. Carefully remove the backplate, which is now held down by a pair of plastic tabs along the side. They are pretty resilient, but be careful not to pull too hard and snap them. Starting at the top and sliding a fingernail along the side, gently prying upwards should be sufficient to remove the backplate.

1. Carefully remove the two silver write protect screws (highlighted in the following image in red) from the motherboard. These can be pretty tight, and it is recommended to brace the PCB using your other hand if you need to press down hard on the motherboard to prevent the screwdriver slipping. The write protect screws are no longer required, so store them with the rest of the lab's screw collection.

    ![screws2](http://i.imgur.com/rYh0tnU.png)

1. Replace the backplate and carefully tighten the screws in an alternating star pattern to ensure even pressure on the Chromebook's body. In true Haynes Manual style: reassembly is the opposite of disassembly! (That might just be a British thing...). Note that all screws should be perfectly flush with the backplate. If they are not - double check that the backplate is fully clipped down along all edges! Otherwise, the bottom of the Chromebook will become unstable and rock around as you type.

1. Plug in and turn on the Chromebook, and use the firmware utility script as before to check that the Fw WP is now set to Disabled (white).

    ![fwwpOff](http://i.imgur.com/PMBw0n5.png)

## Install New Firmware

We will now install the new Firmware that permits an alternative operating system to be installed on the Chromebook.

1. Using the ChromeOS Firmware Utility Script (see above if you've forgotten how to access it), type `1`, `Enter`, `Shift-N`, `Enter` to default boot from the internal storage.

    ![firmware1](http://i.imgur.com/BOetEpf.png)

1. After it has completed, press `Enter` again to return to the main menu.

1. Hit `6`, `y`, and `Enter` to remove the ChromeOS bitmaps that show on boot.

    ![firmware2](http://i.imgur.com/79rQAzW.png)

1. After it has completed, press `Enter` again to return to the main menu.

1. Finally, hit `4`, `Enter`, `1`, `Enter` to set the boot options to short boot delay.

  ![firmware3](http://i.imgur.com/NWzMsVA.png)

## Create Bootable GalliumOS USB

It is extremely likely that we will have the bootable USB flash drive that you need kicking around the lab somewhere, so ask first!

In the event that nobody has one, download the ISO from [https://galliumos.org/releases/2.1/TORRENTS/galliumos-braswell-2.1.iso.torrent](https://galliumos.org/releases/2.1/TORRENTS/galliumos-braswell-2.1.iso.torrent), and use the excellent guide on the Gallium wiki at [https://wiki.galliumos.org/Installing/Creating_Bootable_USB](https://wiki.galliumos.org/Installing/Creating_Bootable_USB) to create the boot disk.

## Installing GalliumOS

1. Plug in the GalliumOS bootable USB drive and reboot the Chromebook (If you still have the utility script open, you can do this by typing `Shift-R`, `Enter`).

1. You will be prompted to hit `Esc` to open the boot menu - do this when prompted, and select the USB device from the menu that appears (in the following image, the bootable USB was option 2).
    
    ![bootMenu](http://i.imgur.com/5RsoXOY.png)  

1. The first option on the resulting menu will take you to the live Linux environment to install the operating system. Select it, or wait for the menu to timeout.

    ![grub](http://i.imgur.com/IeRmKBC.png)  

1. After booting into the Gallium live environment, set up the wifi (using the same eduroam settings as before) by selecting the network icon in the bottom right of the screen. This will allow updates to be downloaded and installed.

    ![wifiSetupGalium](http://i.imgur.com/qt7gxr1.png)  

1. When the internet connection has been set up, double click the "Install Gallium" icon in the top left of the desktop environment.

1. Select English as the install language and check both boxes on the next page to ensure that updates will be downloaded and third-party software can be installed.

    ![install1](http://i.imgur.com/7SDstd6.png)

1. Erase the disk and install Gallium (default), and select "Install Now".

    ![install2](http://i.imgur.com/ZIw5Ofh.png)

1. Check that the disk is correct (i.e. not the bootable USB) by comparing it to the following image, and then hit "Continue".

    ![install3](http://i.imgur.com/iMLAZri.png)

1. Select the right timezone (see if you can hit Boise without zooming in for extra points), and the English US keyboard layout.

1. You will now be prompted to create a GalliumOS account. On the "Who are you?" screen, type in the following, using the following image as a template (for the computer name, please ask Mike to assign your machine a name - he is the custodian of our Futurama namespace!). The password for the cme-lab account should be set to "planetexpress":

    ![install4](http://i.imgur.com/QDWI7eu.png)

1. Make sure the "Require my password to log in" is checked, but not "log in automatically" or "encrypt my home folder".
Then press "Continue".

1. The installation will now take place. It will take a few minutes, so feel free to grab a coffee or something. When it is done, press "Restart Now". During the GalliumOS splash screen, you will be asked to "Remove the installation medium and press Enter".

1. After boot, you will be faced with the GalliumOS user log-on screen. 

Congratulations! Your Chromebook is now ready to use. Continue to the next section to set up your own account to fully get set up.
