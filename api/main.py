# Standard imports
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse, Response
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel

# Project imports
from . import mandelbrot
from . import settings

# Generating an instance of the FastAPI class
app = FastAPI()

# Allows website to see static directory (containing resources)
app.mount("/static", StaticFiles(directory="static"), name="static")

# Middleware (authentication)
origins = ["*"]
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

### Routes ###

# Home page


@app.get("/", response_class=HTMLResponse)
async def index(request: Request):
    return settings.TEMPLATES.TemplateResponse("index.html", {"request": request})


# Class for input to Mandelbrot sample
# This is the correct place to set default values
class ImageInput(BaseModel):
    real: float
    imag: float
    zoom: float
    depth: str
    width: int = 2000
    height: int = 2000


# Mandelbrot image
@app.post("/image")
async def image(input: ImageInput):
    rmin, rmax = input.real-(1./input.zoom), input.real+(1./input.zoom)
    imin, imax = input.imag-(1./input.zoom), input.imag+(1./input.zoom)
    if input.depth == "low":
        max_iters = 64
    elif input.depth == "medium":
        max_iters = 128
    elif input.depth == "high":
        max_iters = 256
    else:
        raise ValueError("Invalid image depth")
    width, height = input.width, input.height
    print("Creating image")
    binary_png = mandelbrot.create_image(
        rmin, rmax, imin, imax, max_iters, width, height, smooth_sigma=0.5)
    # Necessary to tell that a png is being sent
    headers = {"Content-Disposition": 'inline; filename="mandelbrot.png"'}
    print("Sending image")
    # Necessary to tell that a png is being sent
    return Response(binary_png, headers=headers, media_type="image/png")

### ###
