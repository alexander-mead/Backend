#!/bin/zsh

real=-1.401
imag=0.0
zoom=100.
iterations=150
sigma=0.5
transform='log'
width=2560
height=1664
outdir='images'
outfile='background_small_02'
cmap='cubehelix'
format='png'
show=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format show=$show