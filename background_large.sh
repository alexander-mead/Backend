#!/bin/zsh

real=-0.3485
imag=-0.6062
zoom=3000.
iterations=512
sigma=0.75
width=3440
height=1440
outdir='images'
outfile='background_large'
cmap='afmhot'
show=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma \
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap show=$show