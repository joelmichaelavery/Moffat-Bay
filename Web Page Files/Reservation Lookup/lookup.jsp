<!---
Joel Avery
Andrew Danielson
Tabark Kambal
Gabriel Pedraza Torres
CSD 460 - Software Development CAPSTONE
--->
<?php

<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page language="java" %>
<%@ page errorPage="" %>

<!DOCTYPE html>
<html lang="en">
<head> 
    <link rel="stylesheet" href="Lookup.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Moffat Bay - Your Reservation</title>
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700" rel="stylesheet">
</head>
<body>
    <header class="Landing-Page-Banner">
        <h1 class="Logo-Name">Moffat Bay Lodge & Marina</h1>
    </header>
    
    <div class="Landing-Nav-Menu" style="width: 800px;">
        <a id="Home Link" href="index.html" target="_self">
            <h2 id="Home Label">Home</h2>
        </a>

        <a id="About Us Link" href="AboutUs.html" target="_self">
            <h2 id="About Us Label">About Us</h2>
        </a>
    
        <a id="Activities Link" href="Activities.html" target="_self">
            <h2 id="Activities Label">Activities</h2>
        </a>
    
        <!-- Reservations Link  -->
        <a id="Reservations Link" href="reservation.jsp" target="_self">
            <h2 id="Reservations Label">Reservations</h2>
        </a>
        
        <a id="Account Link" href="login.jsp" target="_self">
            <h2 id="Account Label">Account</h2>
        </a>
    </div>

    <div class="output">
        <%
        // Database connection details
        String url = "jdbc:mysql://localhost:3306/MoffatBayLodge";
        String username = "student1";
        String password = "pass";

        // Initialize connection and statement
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, password);

            // Retrieve form data
            String reservation_number = request.getParameter("reservation_number");
            String email = request.getParameter("email");

            // Check if at least one field has been filled
            if (reservation_number != null || email != null) {
                // Query to check if the email or the reservation number matches
                String sql = "";
                if (reservation_number != null && !reservation_number.isEmpty()) {
                    sql = "SELECT b.*, g.FirstName, g.LastName, g.Email FROM Bookings b JOIN Guests g ON b.GuestID = g.GuestID WHERE b.ReservationNumber = ?";
                } else if (email != null && !email.isEmpty()) {
                    sql = "SELECT b.*, g.FirstName, g.LastName, g.Email FROM Bookings b JOIN Guests g ON b.GuestID = g.GuestID WHERE g.Email = ?";
                }

                stmt = conn.prepareStatement(sql);

                if (reservation_number != null && !reservation_number.isEmpty()) {
                    stmt.setString(1, reservation_number);
                } else if (email != null && !email.isEmpty()) {
                    stmt.setString(1, email);
                }

                ResultSet rs = stmt.executeQuery();
                

                // Outputting the retrieved information
                if (rs.next()) {
        %>
                    <!-- Display reservation or booking information -->
                    <div style="color: white; font-size: large;">
                        <p>Reservation Number: <%= rs.getString("ReservationNumber") %></p>
                        <p>Room Booked: <%= rs.getString("RoomType") %></p>
                        <p>Number of Guests: <%= rs.getInt("NumOfGuests") %></p>
                        <p>Check In Date: <%= rs.getString("CheckInDate") %></p>
                        <p>Check Out Date: <%= rs.getString("CheckOutDate") %></p>

                        <!-- Guest information -->
                        <p>Guest Name: <%= rs.getString("FirstName") + " " + rs.getString("LastName") %></p>
                        <p>Guest Email: <%= rs.getString("Email") %></p>
                    </div>
        <%
                } else {
                	%>
                	<div style="color:white; font-size:large;">
                    	<p>No bookings found for the provided reservation number or email address</p>
                    </div>
                    <%
                }

                rs.close();
            } else {
                out.println("Please enter either a reservation number or an email address.");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                out.println("Error closing database connection: " + e.getMessage());
            }
        }
        %>
    </div>
    
    <div style="text-align: center; position: absolute; bottom: 16%;">
    <a href="index.html" style="text-decoration: none;">
        <button style="padding: 10px 20px; font-size: 16px; background-color: #032e4f; color: #fff; border: none; cursor: pointer;">Back to Home Page</button>
    </a>
</div>
<footer> 
    <div class="footer-content">
        <div class="footer-section-info">
            <p>88 Moffat Loop,
                Joviedsa Island,
                WA 98250</p>
            <p>info@moffatbay.com</p>
            <p>223-867-5309</p>
        </div>

        <div class="footer-section">

            <h3><a href="../AboutUs/AboutUs.html">About Us</a></h3>
            <ul>
                <li>Discover the beauty of Moffat Bay, where nature meets luxury.</li>
            </ul>


        </div>
        <div class="footer-section">
            <h3><a href="../Activities/Activities.html">Activities</a></h3>
            <ul>
                <li>Check Out What We have to Offer!</li>

            </ul>
        </div>
        <div class="footer-section">
            <h3>Reservations</h3>
            <ul>
                <li><a href="../RoomReservation/">Book Now</a></li>
                <li><a href="../Reservation lookup/Moffat Bay Reservation Look-up.html">Reservation Look up</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Account</h3>
            <ul>
                <li><a href="../LoginPage/LoginServlet.java">Login</a></li>
                <li><a href="signupregistration.html">Create an Account</a></li>
            </ul>
        </div>

    </div>
    <div class="footer-bottom">
        <p>&copy; 2023 Moffat Bay Resort | <a href="../AboutUs/AboutUs.html">About Us</a> | <a href="terms.html">Terms of Use</a> | <a href="privacy.html">Privacy Policy.</p>
    </div>
</footer>
</body>
</html>
