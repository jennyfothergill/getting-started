Going to try Lubuntu with 2gb of ram and 10gb hdd

aiche
gobroncos

Hi guys, I need some help!

For the Hands-On workshop at AIChE, I'm trying to put together a virtual machine for all of our learners so they'll have the same environment and we won't have to worry about anything not working on anyone's machines. But I've also got some looming deadlines and not enough bandwidth to solve this problem that needs a little parallel processing (you!). Your mission, should you choose to accept it, will result in a trip to AIChE to enjoy the spoils of your efforts.

The VirtualBox VM should run some lightweight flavor of linux, and needs the following stuff working:

* vim, emacs, git, g++, gfortran, grace, cmake, mpi-default-dev (easy with apt)
* hoomd/signac/freud (easy with miniconda)
* pysimm (https://github.com/polysimtools/pysimm) - has an installer for LAMMPS, which is handy
* lammps (pysimm installer should be is fine)
* gromacs (http://www.gromacs.org/)
* cassandra (https://www3.nd.edu/~ed/research/cassandra.html) 
* Avogadro (https://avogadro.cc/)
* VMD (http://www.ks.uiuc.edu/Research/vmd/)

Some observations so far:
- The VM will likely need 20+ GB of space, but this will depend somewhat on which distro works or works best.

- I found 2048 MB RAM a decent amount for playing around

- I was having display issues with 64-bit lubuntu, couldn't finish installing in VirtualBox

- 32-bit lubuntu was small and snappy, but requires compiling VMD from source (a big lift if you've not done this prior) since all the pre-compiled versions are 64-bit.

- 64-xubuntu seems like the most promising candidate so far, but the binary linux install of VMD I tried were segfaulting at runtime, didn't have time to push this one further. 

- For none of the cases was I able to test a small gromacs or lammps example, but if we get everything built we can put that responsibility on our speakers

- Ubuntu was big, fine, default desktop settings a bit resource hungry, but definitely a viable option

- Debian, arch, and RHEL all gave viable starts, but my initial tests with 10GB drives ran out of space during GROMACS compilations. 

- You've all been grinding with these problems more recently than I have, I realized in the shower this morning you may already have an answer to a lot of this :)

Let's see what the most viable options you have at the end of today and tomorrow are and then figure out next steps.
Thanks!