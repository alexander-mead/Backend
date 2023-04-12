#!/bin/sh

real=-1.373
imag=-0.0123
zoom=600.
iterations=256
sigma=0.5
transform='log'
width=2560
height=1664
outdir='images'
outfile='background_small_04'
cmap='twilight_shifted'
cmap='bone'
format='png'
show=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format show=$show