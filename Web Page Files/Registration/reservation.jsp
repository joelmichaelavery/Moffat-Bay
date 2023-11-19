<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <!-- Link to an external stylesheet for styling -->
    <link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <!-- Header section containing the hotel name and navigation links -->
    <div class="header">
        <div class="hotel-name">MOFFAT BAY LODGE & MARINA</div>
        <nav>
            <ul>
                <!-- Navigation links to various pages -->
                <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                <li class="nav-item"><a class="nav-link" href="ReservationLookUp.html">Your Reservation</a></li>
                <li class="create-account"><a class="nav-link" href="signupregistration.html">Create Account</a></li>
                    
            </ul>
        </nav>
    </div>
    <hr />
    
    
    <div class="border-box">
        <div class="sub-box sub-box1">
            <img src="cabin1.webp" alt="Moffat Bay Lodge">
        </div>
        <div class="sub-container-right">
            <div class="sub-box sub-box2">
                <img src="cabin2.webp" alt="Cabin2">
            </div>
            <div class="sub-box sub-box3">
                <img src="cabin3.webp" alt="Cabin3">
            </div>
            <div class="sub-box sub-box4">
                <img src="cabin4.webp" alt="Cabin4">
            </div>
            <div class="sub-box sub-box5">
                <img src="cabin5.webp" alt="Cabin5">
            </div>
        </div>
    </div>
    
    <div class="dropdown-container">
        <form action="" method="post">
            <label for="room-type">Select Room Type:</label>
            <select id="room-type" name="room-type" onchange="this.form.submit()">
                <option value="">Select a Room</option>
                <option value="Double">Double Full Beds</option>
                <option value="Single">Queen Beds</option>
                <option value="Suite">Double Queens</option>
                <option value="King">King Bed Room</option>
            </select>
        </form>
    </div>
    
    <div class="booking-container">
    <div class="calendar">
        <!-- Your calendar content here -->
        <!-- For example: -->
        <input type="date" id="checkin" name="checkin">
        <input type="date" id="checkout" name="checkout">
    </div>
    <div class="booking-form">
        <form id="bookingForm">
            <label for="roomType">Room Type:</label>
            <select id="roomType" name="roomType">
                <!-- Options loaded from the database -->
                <option value="standard">Standard Room</option>
                <option value="deluxe">Deluxe Room</option>
                <!-- Add other room types -->
            </select>
            <label for="guests">Number of Guests:</label>
            <input type="number" id="guests" name="guests" min="1">
            <label for="totalPrice">Total Price:</label>
            <input type="text" id="totalPrice" name="totalPrice" readonly>
            <input type="submit" value="Calculate">
        </form>
    </div>
</div>
    
    
    <%-- Java code to retrieve price --%>
    <%!
        // Helper function to map dropdown value to database value
        String getRoomTypeName(String roomType) {
            switch(roomType) {
                case "Double":
                    return "Double";
                case "Single":
                    return "Single";
                case "Suite":
                    return "Suite";
                case "King":
                    return "King";
                default:
                    return "";
            }
        }
    %>
    
    <%-- Java code to fetch price --%>
    <%
        String roomType = request.getParameter("room-type");
        String price = "";

        if (roomType != null && !roomType.isEmpty()) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/MoffatBayLodge", "student1", "pass");

                String query = "SELECT RoomPrice FROM RoomType WHERE RoomType = ?";
                PreparedStatement pstmt = conn.prepareStatement(query);
                pstmt.setString(1, getRoomTypeName(roomType));

                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    price = rs.getString("RoomPrice");
                } else {
                    price = "Price not available";
                }

                rs.close();
                pstmt.close();
                conn.close();
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
    %>

  	<!-- Assuming you have fetched the room type and price -->
	<% if (roomType != null && !roomType.isEmpty() && price != null && !price.isEmpty()) { %>
    	<div class="price" style="color: white; font-size: 32pt; text-align: left;">
        	The price for <%= roomType %> is: <%= price %>
    	</div>
	<% } %>


    
</body>
</html>
