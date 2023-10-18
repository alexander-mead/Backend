#!/bin/sh

real=-1.4
imag=0.05
zoom=5.
iterations=256
transform=cube_root
width=750
height=1334
outfile='iphone/background_02'
cmap='copper'

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