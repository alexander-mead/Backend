#!/bin/sh

real=0.2613577
imag=-0.002018128
zoom=3000.
iterations=256
transform=None
width=3440
height=1440
outfile='ultrawide/background_03'
cmap='twilight_shifted'

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