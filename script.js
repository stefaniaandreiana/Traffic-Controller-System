function updateTrafficLights() {
    fetch('/getTrafficLights')
        .then(response => response.json())
        .then(data => {
            const trafficLightsTable = document.querySelector('table');
            trafficLightsTable.innerHTML = '<tr><th>Locație</th><th>Culoare</th></tr>';
            data.forEach(light => {
                trafficLightsTable.innerHTML += `<tr><td>${light.location}</td><td>${light.color}</td></tr>`;
            });
        });
}

setInterval(updateTrafficLights, 5000);
