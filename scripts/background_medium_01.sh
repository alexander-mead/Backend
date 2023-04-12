#!/bin/sh

real=-0.12
imag=1.
zoom=50.
iterations=32
sigma=0.5
transform=None
width=1920
height=1080
outdir='images'
outfile='background_medium_01'
cmap='bone'
format='png'

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format