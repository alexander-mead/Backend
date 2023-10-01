#!/bin/sh

real=0.2613577
imag=-0.002018128
zoom=3000.
iterations=256
sigma=0.5
transform=None
width=3440
height=1440
outdir='images'
outfile='ultrawide/background_03'
cmap='twilight_shifted'
format='png'

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format