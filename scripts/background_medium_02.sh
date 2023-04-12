#!/bin/sh

real=-0.5
imag=0.
zoom=1.
iterations=16
sigma=0.5
transform=None
width=1920
height=1080
outdir='images'
outfile='background_medium_02'
cmap='bone'
format='png'
show=False

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format show=$show