#!/bin/zsh

real=-0.34852
imag=-0.60653
zoom=5000.
iterations=10000
sigma=0.5
transform='square_root'
width=1920
height=1080
outdir='images'
outfile='background_medium_04'
cmap='cubehelix'
format='png'
show=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format show=$show