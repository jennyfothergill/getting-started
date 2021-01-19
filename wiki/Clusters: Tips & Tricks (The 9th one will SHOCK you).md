# Overview #

Let's record the gotchas and tricks to working with these clusters + some quick references like link to official documentation, queue names, software we know works, ect.

# "Our" Clusters #

## Kestrel ##

## Fry ##

# BSU Clusters #

## R2 ##

# XSEDE Clusters #

## XSTREAM  <- He's dead, Jim. ##

```
#!bash

$ singularity --version
2.3.1-dist
```
? update singularity?

## [Comet](https://portal.xsede.org/sdsc-comet) ##

Supports direct SSH login ie 
```
#!bash

ssh mhenry@comet.sdsc.xsede.org
```
You can setup a ssh key!

To show projects/accounts
`show_accounts -gpu`

comet didn't like building the image in the home dir, use this:

`SINGULARITY_TMPDIR=/oasis/scratch/comet/$USER/temp_project singularity pull docker://cmelab/planckton:test`



## Bridges ##

Supports ssh via DUO xsede auth

`ssh -p 2222 mhenry@bridges.psc.xsede.org`