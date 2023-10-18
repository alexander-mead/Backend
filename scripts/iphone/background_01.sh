#!/bin/sh

real=-0.13
imag=1.
zoom=50.
iterations=32
transform=None
width=750
height=1334
outfile='iphone/background_01'
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