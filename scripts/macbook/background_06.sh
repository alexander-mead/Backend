#!/bin/sh

real=-0.7497
imag=0.03
zoom=8192
iterations=512
transform=0.25
width=2560
height=1664
outfile='macbook/background_06'
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