document.getElementById("startCapture").addEventListener("click", () => {
    fetch("/api/start_capture", { method: "POST" })
        .then(response => response.json())
        .then(data => console.log(data))
        .catch(error => console.error("Error:", error));
});
