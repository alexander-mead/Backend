# Standard imports
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse, Response#, StreamingResponse # TODO: Remove
from fastapi.staticfiles import StaticFiles
from pydantic import BaseModel

# Project imports
from . import mandelbrot
from . import settings

# Generating an instance of the FastAPI class
app = FastAPI()

# Allows website to see static directory (containing resources)
app.mount("/static", StaticFiles(directory="static"), name="static")

# Middleware
# TODO: What does this do exactly?
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


# Hello user (example path-parameter route)
@app.get("/hello/{name}")
async def hello(name: str):
    return f"Hello {name}"


# Class for input to Mandelbrot sample
# TODO: Is this the right place to set default values?
class SampleInput(BaseModel):
    real: float
    imag: float
    max_iters: int = 50


# Mandelbrot sample
@app.post("/sample")
#async def sample(real_number: float, imaginary_number: float): # Inputs are floats here
async def sample(input: SampleInput): # Input is a class here
    c = input.real + input.imag * 1.j
    print("Sampling complex number:", c)
    return mandelbrot.sample(c, input.max_iters)


# Class for input to Mandelbrot sample
# TODO: Is this the right place to set default values?
class ImageInput(BaseModel):
    real: float
    imag: float
    size: float
    max_iters: int = 50
    width: int = 2000
    height: int = 2000


# Mandelbrot image
@app.post("/image")
async def image(input: ImageInput):
    rmin, rmax = input.real-input.size/2., input.real+input.size/2.
    imin, imax = input.imag-input.size/2., input.imag+input.size/2.
    max_iters = input.max_iters
    width, height = input.width, input.height
    print("Creating image")
    binary_png = mandelbrot.create_image(rmin, rmax, imin, imax, max_iters, width, height)
    headers = {"Content-Disposition": 'inline; filename="mandelbrot.png"'} # Necessary to tell that a png is being sent
    return Response(binary_png, headers=headers, media_type="image/png")   # Necessary to tell that a png is being sent
    #return StreamingResponse(binary_png, media_type="image/png") # TODO: Is StreamingResponse better?

### ###