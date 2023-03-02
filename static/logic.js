function showText() {
    document.getElementById("hiddenText").style.display = "block";
    document.getElementById("clickButton").style.display = "none";
}

function sayHello() {
    const name = document.getElementById("nameInput").value;
    alert("Hello, " + name + "!");
    console.log("Hey ho!");
}

function sample() {
    const realInput = document.getElementById("realInput").value;
    const imagInput = document.getElementById("imagInput").value;
    // const maxIters = document.getElementById("maxIters").value;
    const maxIters = 50;

    const url = "http://localhost:8000/sample"
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
    fetch(url, params)
        .then((response) => response.json())
        //.then((data) => console.log(data))
        .then((data) => document.getElementById("result").innerText = data)
        .catch((error) => {
            console.log("There has been a catastrophe!");
        })
    ;
}