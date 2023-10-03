#!/bin/sh

real=-0.4601
imag=0.5703
zoom=10000.
iterations=256
sigma=0.5
transform='centralize_high'
width=750
height=1334
outdir='images'
outfile='iphone/background_05'
cmap='jet'
format='png'
bound=False

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format bound=$bound