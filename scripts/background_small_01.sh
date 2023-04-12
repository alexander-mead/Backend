#!/bin/sh

real=-1.44
imag=0.0015
zoom=102.
iterations=28
sigma=0.5
transform=0.8
width=2560
height=1664
outdir='images'
outfile='background_small_01'
cmap='cubehelix'
format='png'

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format