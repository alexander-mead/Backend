#!/bin/sh

real=-1.44
imag=0.0015
zoom=102.
iterations=28
transform=0.8
width=2560
height=1664
outfile='macbook/background_01'
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