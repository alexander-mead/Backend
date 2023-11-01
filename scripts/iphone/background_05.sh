#!/bin/sh

real=-0.46006
imag=0.57030
zoom=10000.
iterations=1024
transform='centralize_high'
width=750
height=1334
outfile='iphone/background_05'
cmap='jet'
bound=False

poetry run python api/image.py \
    real=$real \
    imag=$imag \
    zoom=$zoom \
    iterations=$iterations \
    transform=$transform \
    width=$width \
    height=$height \
    outfile=$outfile \
    cmap=$cmap \
    bound=$bound