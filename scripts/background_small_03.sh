#!/bin/zsh

real=-0.7515
imag=-0.05
zoom=400.
iterations=256
sigma=0.5
transform=None
width=2560
height=1664
outdir='images'
outfile='background_small_03'
cmap='flag_r'
format='png'
show=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format show=$show