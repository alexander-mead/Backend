#!/bin/sh

real=-1.405
imag=0.0
zoom=95.
iterations=512
transform='log'
width=2560
height=1664
outfile='macbook/background_02'
cmap='cubehelix'

poetry run python api/image.py \
    real=$real \
    imag=$imag \
    zoom=$zoom \
    iterations=$iterations \
    transform=$transform \
    width=$width \
    height=$height \
    outfile=$outfile \
    cmap=$cmap