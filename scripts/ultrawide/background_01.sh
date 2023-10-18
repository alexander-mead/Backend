#!/bin/sh

real=-0.3485
imag=-0.6062
zoom=3000.
iterations=512
transform=None
width=3440
height=1440
outfile='ultrawide/background_01'
cmap='afmhot'

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