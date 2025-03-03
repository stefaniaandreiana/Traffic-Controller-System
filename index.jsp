<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Controlul Traficului</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Controlul Traficului</h1>
    <form action="changeTrafficLight" method="post">
        <label for="location">Locația semaforului:</label>
        <input type="text" id="location" name="location" required><br><br>
        
        <label for="color">Culoarea semaforului:</label>
        <select id="color" name="color">
            <option value="RED">Roșu</option>
            <option value="YELLOW">Galben</option>
            <option value="GREEN">Verde</option>
        </select><br><br>

        <button type="submit">Schimbă Culoarea</button>
    </form>

    <h2>Starea Semaforului</h2>
    <table border="1">
        <tr>
            <th>Locație</th>
            <th>Culoare</th>
        </tr>
        <c:forEach var="light" items="${trafficLights}">
            <tr>
                <td>${light.location}</td>
                <td>${light.color}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
