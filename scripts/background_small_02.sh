#!/bin/sh

real=-1.405
imag=0.0
zoom=95.
iterations=512
sigma=0.5
transform='log'
width=2560
height=1664
outdir='images'
outfile='background_small_02'
cmap='cubehelix'
format='png'

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format