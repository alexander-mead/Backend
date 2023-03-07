# Standard imports
from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse
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

# Hello user (path-parameter route)
@app.get("/{name}")
async def hello(name: str):
    return f"Hello {name}"


class SampleInput(BaseModel):
    real: float
    imag: float
    max_iters: int = 50


# Mandelbrot
@app.post("/sample")
#async def sample(real_number: float, imaginary_number: float):
async def sample(input: SampleInput):
    #c = real_number + imaginary_number * 1.j
    c = input.real + input.imag * 1.j
    print("Complex number:", c)
    return mandelbrot.sample(c, input.max_iters)

### ###