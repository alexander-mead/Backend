#!/bin/sh

real=0.26599
imag=0.00400
zoom=8000.
iterations=350
transform=None
width=750
height=1334
outfile='iphone/background_06'
cmap='nipy_spectral'

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