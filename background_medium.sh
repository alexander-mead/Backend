#!/bin/zsh

real=-0.12
imag=1.
zoom=50.
iterations=32
sigma=0.75
width=1920
height=1080
outdir='images'
outfile='background_medium'
cmap='bone'
show=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma \
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap show=$show