
const baseUrl = "http://localhost:8000"

function image() {

    // Definitions
    const xInput = document.getElementById("xInput").value;
    const yInput = document.getElementById("yInput").value;
    const sizeInput = document.getElementById("sizeInput").value;
    const depthInput = document.getElementById("depthInput").value;
    const url = baseUrl+"/image";
    const params = {
        method: "POST", // Unless this is present it will default to "GET"
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            real: xInput,
            imag: yInput,
            size: sizeInput,
            depth: depthInput,
        })
    };

    // Fetch
    fetch(url, params)
        .then((response) => response.blob())
        .then((blob) => {
            console.log("Response blob received");
            const objectURL = URL.createObjectURL(blob);
            document.getElementById("image").src = objectURL; // To set image within html
        })
        //.then(document.getElementById("buttonId").disabled = true) // TODO: Disable button to prevent multiple requests
        .then(console.log("Image displayed"))
        .catch((error) => {
            console.log('Error:', error)
            console.log("Failed to sample image");
        });
}