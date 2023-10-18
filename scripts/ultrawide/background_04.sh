#!/bin/sh

real=-1.425
imag=0.
zoom=30.
iterations=256
transform='square_root'
width=3440
height=1440
outfile='ultrawide/background_04'
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