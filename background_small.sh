#!/bin/zsh

real=-1.45994
imag=0.00002
zoom=10000.
iterations=52
sigma=0.75
width=2560
height=1664
outdir='images'
outfile='background_small'
cmap='cubehelix'
show=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma \
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap show=$show