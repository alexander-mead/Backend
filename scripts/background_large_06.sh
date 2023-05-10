#!/bin/sh

real=0.26
imag=0.0017
zoom=4000.
iterations=256
sigma=0.5
transform=None
width=3440
height=1440
outdir='images'
outfile='background_large_06'
cmap='CMRmap'
format='png'

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format