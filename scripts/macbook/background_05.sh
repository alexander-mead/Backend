#!/bin/sh

real=-0.4601222
imag=0.5702860
zoom=2100.
iterations=512
transform='centralize_high'
width=2560
height=1664
outfile='macbook/background_05'
cmap='RdPu_r'
resample=5 # Takes ages!
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
    resample=$resample \
    bound=$bound