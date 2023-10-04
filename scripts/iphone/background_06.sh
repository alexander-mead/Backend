#!/bin/sh

real=0.26599
imag=0.00400
zoom=8000.
iterations=350
sigma=0.5
transform=None
width=750
height=1334
outdir='images'
outfile='iphone/background_06'
cmap='nipy_spectral'
format='png'
bound=True

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format bound=$bound