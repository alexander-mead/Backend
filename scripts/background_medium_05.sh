#!/bin/sh

real=-0.4601222
imag=0.5702860
zoom=10000.
iterations=1024
sigma=0.5
transform=1.2
width=1920
height=1080
outdir='images'
outfile='background_medium_05'
cmap='rainbow'
format='png'
bound=False

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format bound_image=$bound