#!/bin/sh

real=-1.373
imag=-0.0123
zoom=600.
iterations=256
transform='log'
width=2560
height=1664
outfile='macbook/background_04'
# cmap='twilight_shifted'
cmap='bone'

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