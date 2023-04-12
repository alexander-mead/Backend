#!/bin/sh

real=-1.425
imag=0.
zoom=30.
iterations=256
sigma=0.5
transform='square_root'
width=3440
height=1440
outdir='images'
outfile='background_large_04'
cmap='cubehelix'
format='png'
show=False

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format show=$show