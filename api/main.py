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


# Mandelbrot image
@app.post("/image")
async def image(): # TODO: Allow for the user to choose parameters
    rmin, rmax = -1., 1.
    imin, imax = -1., 1.
    max_iters = 50
    width, height = 10, 10
    print("Creating image")
    binary_png = mandelbrot.create_image(rmin, rmax, imin, imax, max_iters, width, height)
    headers = {"Content-Disposition": 'inline; filename="test.png"'}     # Necessary to tell that a png is being sent
    return Response(binary_png, headers=headers, media_type="image/png") # Necessary to tell that a png is being sent

### ###