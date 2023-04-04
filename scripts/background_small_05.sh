#!/bin/zsh

real=-0.4601222
imag=0.5702860
zoom=2100.
iterations=512
sigma=0.5
transform=None
width=2560
height=1664
outdir='images'
outfile='background_small_05'
cmap='RdPu_r'
format='png'
show=False
bound=False

poetry run python api/mandelbrot.py real=$real imag=$imag zoom=$zoom iterations=$iterations sigma=$sigma transform=$transform\
    width=$width height=$height outdir=$outdir outfile=$outfile cmap=$cmap format=$format show=$show bound_image=$bound