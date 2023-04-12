#!/bin/sh

real=-0.600
imag=-0.429
zoom=1035
iterations=2000
sigma=0.5
transform='cube_root'
width=3440
height=1440
outdir='images'
outfile='background_large_02'
cmap='hot'
format='png'
show=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format show=$show