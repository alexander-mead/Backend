#!/bin/sh

real=-0.746
imag=0.1
zoom=500.
iterations=256
sigma=0.5
transform=None
width=3440
height=1440
outdir='images'
outfile='background_large_05'
cmap='afmhot'
format='png'
show=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format show=$show