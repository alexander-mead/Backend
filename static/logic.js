function showText() {
    document.getElementById("hiddenText").style.display = "block";
    document.getElementById("sampleButton").style.display = "none";
}


function sayHello() {
    const name = document.getElementById("nameInput").value;
    alert("Hello, " + name + "!");
    console.log("Hey ho!");
}


function sample() {

    // Definitions
    const realInput = document.getElementById("realInput").value;
    const imagInput = document.getElementById("imagInput").value;
    const maxIters = 50; // TODO: This is hard coded and could be user set?
    const url = "http://localhost:8000/sample" // TODO: Port 8000 hardcoded here
    const params = {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            real: realInput,
            imag: imagInput,
            max_iters: maxIters,
        })
    };

    // Fetch
    fetch(url, params)
        .then((response) => response.json())
        //.then((data) => console.log(data))
        .then((data) => document.getElementById("result").innerText = data)
        .catch((error) => {
            console.log("Failed to sample point");
        });
}


function image() {

    // Definitions
    const xInput = document.getElementById("xInput").value;
    const yInput = document.getElementById("yInput").value;
    const sizeInput = document.getElementById("sizeInput").value;
    const url = "http://localhost:8000/image"; // TODO: Port 8000 hardcoded here
    const params = {
        method: "POST", // Unless this is present it will default to "GET"
        headers: {
            "Content-Type": "application/json",
        },
    };

    // Fetch
    fetch(url, params)
        .then((response) => response.blob())
        .then((blob) => {
            console.log("Response blob received");
            const objectURL = URL.createObjectURL(blob);
            document.getElementById("image").src = objectURL;
            //document.body.style.backgroundImage = `url(${objectURL})`;
        })
        .catch((error) => {
            console.log("Failed to sample image");
        });
}