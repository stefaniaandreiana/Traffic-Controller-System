package project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/changeTrafficLight")
public class TrafficLightServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String location = request.getParameter("location");
        String color = request.getParameter("color");
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traffic_controller", "root", "")) {
            String sql = "UPDATE traffic_lights SET color = ?, last_updated = CURRENT_TIMESTAMP WHERE location = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, color);
            stmt.setString(2, location);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("trafficControl.jsp");
    }
}
