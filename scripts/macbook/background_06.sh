#!/bin/sh

real=-0.7497
imag=0.03
zoom=8192
iterations=512
sigma=0.5
transform=0.25
width=2560
height=1664
outdir='images'
outfile='macbook/background_06'
cmap='cubehelix'
format='png'
bound=True

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format bound=$bound