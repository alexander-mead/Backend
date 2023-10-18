#!/bin/sh

real=0.26
imag=0.0017
zoom=4000.
iterations=256
transform=None
width=3440
height=1440
outfile='ultrawide/background_06'
cmap='CMRmap'

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