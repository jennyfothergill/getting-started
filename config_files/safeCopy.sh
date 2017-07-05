#!/usr/bin/env bash

mkdir -p ${HOME}/.vim/colors
cp -i ir_black.vim ${HOME}/.vim/colors/.
cp -i vmdrc ${HOME}/.vmdrc
cp -i vimrc ${HOME}/.vimrc
# http://stackoverflow.com/a/17072017
if [ "$(uname)" == "Darwin" ]; then
    mkdir ${HOME}/.matplotlib
    cp -i matplotlibrc ${HOME}/.matplotlib/
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    #Let's use sed to remove the backend line, total hack -mmh
    sed '1d' matplotlibrc > tmpfile
    mv tmpfile matplotlibrc
    mkdir -p ${HOME}/.config/matplotlib/
    cp -i matplotlibrc ${HOME}/.config/matplotlib/matplotlibrc
fi
