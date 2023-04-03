from __future__ import print_function, absolute_import, division
import _mandelbrot
import f90wrap.runtime
import logging
import numpy

class Mandelbrot(f90wrap.runtime.FortranModule):
    """
    Module mandelbrot
    
    
    Defined at mandelbrot.f90 lines 1-58
    
    """
    @staticmethod
    def sample_area(real_start, real_end, imag_start, imag_end, max_iters, width, \
        height):
        """
        set = sample_area(real_start, real_end, imag_start, imag_end, max_iters, width, \
            height)
        
        
        Defined at mandelbrot.f90 lines 8-31
        
        Parameters
        ----------
        real_start : float
        real_end : float
        imag_start : float
        imag_end : float
        max_iters : int
        width : int
        height : int
        
        Returns
        -------
        set : int array
        
        """
        set = _mandelbrot.f90wrap_sample_area(real_start=real_start, real_end=real_end, \
            imag_start=imag_start, imag_end=imag_end, max_iters=max_iters, width=width, \
            height=height)
        return set
    
    _dt_array_initialisers = []
    

mandelbrot = Mandelbrot()

