#!/bin/sh

real=-1.4
imag=0.05
zoom=5.
iterations=256
sigma=0.5
transform=cube_root
width=750
height=1334
outdir='images'
outfile='iphone/background_02'
cmap='copper'
format='png'

poetry run python api/image.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format