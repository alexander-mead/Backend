#!/bin/sh

real=-0.746
imag=0.1
zoom=500.
iterations=256
transform=None
width=3440
height=1440
outfile='ultrawide/background_05'
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