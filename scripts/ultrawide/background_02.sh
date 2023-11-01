#!/bin/sh

real=-0.600
imag=-0.429
zoom=1035
iterations=2000
transform='cube_root'
width=3440
height=1440
outfile='ultrawide/background_02'
cmap='hot'

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