# Standard imports
import io

# Third-part imports
import numpy as np
from scipy.ndimage import gaussian_filter
import matplotlib.pyplot as plt
import hydra
from omegaconf import DictConfig

# Project imports
from Fortran import mandelbrot


def sample_area(real_start, real_end, imag_start, imag_end, max_iters, width, height, smooth=False):
    """
    Loops over an area and assigns points to the Mandelbrot set
    Thanks chatGPT for this vectorized version (although it was wrong to begin with)
    """
    x, y = np.meshgrid(np.linspace(real_start, real_end, width),
                       np.linspace(imag_end, imag_start, height))
    mandelbrot_set = np.zeros((height, width))
    c = x + y * 1j        # Map x, y to their complex values
    z = np.zeros_like(c)  # Initialise the value of 'z' at each location
    for i in range(max_iters):
        z = z**2 + c               # Iterate
        mask = np.abs(z) > 2.      # Select points that are diverging
        if smooth:  # Fractional iteration count
            mandelbrot_set[mask] = i + 1. - \
                np.log(np.log(np.abs(z[mask])))/np.log(2.)
        else:  # Set is number of iterations for divergence
            mandelbrot_set[mask] = i
        z[mask], c[mask] = 0., 0.  # Reset the diverging point so that it will not diverge in future
    return mandelbrot_set


def transform_image(array, transform):
    """
    Apply a transform to the image
    """
    if transform is None:
        pass
    elif transform == "log":
        array = np.log(1.+array)/np.log(2.)
    elif transform == "square_root":
        array = np.sqrt(array)
    elif transform == "cube_root":
        array = np.cbrt(array)
    elif type(transform) is float:
        array = array**transform
    else:
        raise ValueError("Transform not recognised")
    return array


def create_image(real_start, real_end, imag_start, imag_end, max_iters, width, height,
                 sigma=0.5, transform=None,
                 cmap="cubehelix", dpi=224, format="png",
                 smooth=False, bound=False, Fortran=False):
    """
    Create a png and return it as a binary
    """

    if Fortran:
        array = mandelbrot.sample_area(real_start, real_end, imag_start,
                                       imag_end, max_iters, width, height, smooth)
        array = array.T / (max_iters-1)
    else:
        array = sample_area(real_start, real_end, imag_start,
                            imag_end, max_iters, width, height, smooth=smooth)
        array /= max_iters-1
    if sigma != 0.:
        array = gaussian_filter(array, sigma=sigma)
    array = transform_image(array, transform)
    figsize = width/dpi, height/dpi
    plt.subplots(figsize=figsize, dpi=dpi, frameon=False)
    vmin, vmax = (0., 1.) if bound else (None, None)
    plt.imshow(array, cmap=cmap, vmin=vmin, vmax=vmax)
    plt.xticks([])
    plt.yticks([])
    plt.tight_layout()
    buffer = io.BytesIO()
    plt.savefig(buffer, bbox_inches='tight', format=format,
                pad_inches=0)  # Place the image as a binary in memory
    buffer = buffer.getvalue()
    return buffer   # Return the image binary (avoids saving to disk)


@hydra.main(version_base=None, config_path="../.", config_name="config")
def run(cfg: DictConfig):

    # Parameters for part of set to display
    iterations = cfg["iterations"]
    width, height = cfg["width"], cfg["height"]
    outdir, outfile = cfg["outdir"], cfg["outfile"]
    format = cfg["format"]
    rmin = cfg["real"]-(1./cfg["zoom"])*cfg["width"]/cfg["height"]
    rmax = cfg["real"]+(1./cfg["zoom"])*cfg["width"]/cfg["height"]
    imin, imax = cfg["imag"]-(1./cfg["zoom"]), cfg["imag"]+(1./cfg["zoom"])
    sigma = cfg["sigma"]
    show = cfg["show"]
    transform = None if cfg["transform"] == "None" else cfg["transform"]

    # Write to screen
    if cfg["verbose"]:
        print()
        print("Mandelbrot set parameters:")
        print("Minimum and maximum real values:", rmin, rmax)
        print("Minimum and maximum imaginary values:", imin, imax)
        print("Image centre (real, imaginary):", cfg["real"], cfg["imag"])
        print("Image extent (real, imaginary):", rmax-rmin, imax-imin)
        print("Maximum number of iterations:", iterations)
        print("Sigma for Gaussian smoothing [pixels]:", sigma)
        print("Transform:", transform)
        print(f"Width and height of image: {width}, {height}")
        print("Output directory:", outdir)
        print("Output file:", outfile+"."+format)
        print("Printing to screen:", show)
        print("Smooth image", cfg['smooth_image'])
        print("Bound image:", cfg["bound_image"])
        print("Use Fortran:", cfg["use_Fortran"])
        print()

    # Display an image on screen and simulatanouesly save it
    data = create_image(rmin, rmax, imin, imax, iterations, width, height,
                        sigma=sigma, transform=transform,
                        dpi=224, cmap=cfg["cmap"], format=format,
                        smooth=cfg['smooth_image'], bound=cfg["bound_image"],
                        Fortran=cfg["use_Fortran"])
    outfile = outdir+"/"+outfile+"."+format
    with open(outfile, "wb") as f:
        f.write(data)
    if show:
        plt.show()
        plt.close()


if __name__ == "__main__":
    run()
