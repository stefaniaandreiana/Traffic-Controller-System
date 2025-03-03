package project;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/addRoute")
public class RouteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String startLocation = request.getParameter("start_location");
        String endLocation = request.getParameter("end_location");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/traffic_controller", "root", "")) {
            String sql = "INSERT INTO routes (start_location, end_location) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, startLocation);
            stmt.setString(2, endLocation);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("routeManagement.jsp");
    }
}


