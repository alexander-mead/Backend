import io
import numpy as np
import matplotlib.pyplot as plt

def sample(c, max_iters):
    """
    Figures out if a given complex number 'c' is part of the set or not
    """
    z = 0.; n = 0
    while abs(z) <= 2. and n < max_iters:
        z = z**2+c
        n += 1
    return n if n != max_iters else 0


def sample_area(real_start, real_end, imag_start, image_end, max_iters, width, height):
    """
    Loops over an area and assigns points to the Mandelbrot set
    """
    x = np.linspace(real_start, real_end, width)
    y = np.linspace(imag_start, image_end, height)
    mandelbrot_set = np.empty((height, width))
    for i in range(height):
        for j in range(width):
            mandelbrot_set[i, j] = sample(x[j] + y[i] * 1j, max_iters)
    return mandelbrot_set


def create_image(real_start, real_end, imag_start, image_end, max_iters, width, height):
    """
    Create a png and return the binary
    """
    array = sample_area(real_start, real_end, imag_start, image_end, max_iters, width, height)
    plt.subplots(figsize=(8, 8))
    plt.imshow(array, cmap="cubehelix")
    plt.xticks([]); plt.yticks([])
    plt.tight_layout()
    buffer = io.BytesIO()
    plt.savefig(buffer, format="png") # Place the png as a binary in memory
    return buffer.getvalue() # Return the png binary (avoids saving to disk)


if __name__ == "__main__":

    # Parameters for part of set
    rmin, rmax = -1., 1.
    imin, imax = -1., 1.
    max_iters = 50
    width, height = 1000, 1000
    file_name = "mandelbrot.png"

    # Display an image on screen and simulatanouesly save it
    image = sample_area(rmin, rmax, imin, imax, max_iters, width, height)
    plt.subplots(figsize=(8, 8))
    plt.imshow(image, cmap="cubehelix")
    plt.xticks([]); plt.yticks([])
    plt.tight_layout()
    plt.savefig("images/"+file_name)
    plt.show()
    plt.close()