#!/bin/sh

real=-0.5
imag=0.
zoom=1.1
iterations=512
transform='cube_root'
width=750
height=1334
outfile='iphone/background_03'
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