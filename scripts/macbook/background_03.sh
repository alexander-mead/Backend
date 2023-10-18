#!/bin/sh

real=-0.7515
imag=-0.05
zoom=400.
iterations=256
transform=None
width=2560
height=1664
outfile='macbook/background_03'
cmap='flag_r'

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