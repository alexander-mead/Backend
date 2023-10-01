#!/bin/sh

real=-0.5
imag=0.
zoom=1.1
iterations=512
sigma=0.5
transform='cube_root'
width=750
height=1334
outdir='images'
outfile='iphone/background_03'
cmap='afmhot'
format='png'

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format