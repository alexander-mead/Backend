#!/bin/sh

real=-0.34852
imag=-0.60653
zoom=5000.
iterations=10000
transform='square_root'
width=750
height=1334
outfile='iphone/background_04'
cmap='cubehelix'
resample=10

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