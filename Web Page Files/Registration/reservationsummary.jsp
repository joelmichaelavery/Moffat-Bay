<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, javax.servlet.http.HttpSession" %>
<%@ page import="java.util.Random" %>
<%@ page import="java.sql.*" %>

<!--
Joel Avery
Andrew Danielson
Tabark Kambal
Gabriel Pedraza Torres
CSD 460 - Software Development CAPSTONE
-->

<!DOCTYPE html>
<style>	

body {
    font-family: Arial, Garamond;
    background-color: #374d37; /* Primary color of the page */ 
    margin: 0;
    padding: 0;
  }
 header {
    background-color: #0f3f0f; /* Dark green, reminiscent of forests */
    color: #fff;
    text-align: center;
    padding: 20px;
  }
  h1 {
  font-size: 2.75rem;
    text-align: center;
    margin: 0;
  }
  
  .Landing-Page-Images-Container {
    display: flex;
    justify-content: space-evenly;
    flex-wrap: wrap;
    margin-bottom: 50px;
  }
  
  .Logo-Name {
    font-family: 'Lora', serif;
    color: tan;
    text-align: center;    
  }
  
  .Landing-Page-Banner {
    background-color: #41240d;
    color: #fff;
    text-align: center;
    padding: 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
  }
  
  .Logo-Image-Left img {
    width: 225px;
    height: 225px;
    margin-bottom: 10px;
  }
  
  .LogoName {
    border-top: 0px;
    font-size: 36px;
  }
  
  .Landing-Nav-Menu {
    text-align: center;
    width: 600px;
    height: 50px;
    margin: 20px auto;
    background-color: rgba(103, 170, 182, 0.5);
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    align-items: center;
  }
  
  .Landing-Nav-Menu h2 {
    display:inline-block;
    text-align: center;
    margin-right: 20px;
    padding: 0px;
    margin-top: 10px;
    color: #e9b45a;
    text-decoration: underline;
  }
  
  .Landing-Nav-Menu h2 a {
    text-decoration: none;
    color: #e9b45a;
  }
  
  .Landing-Nav-Menu h2 a:hover {
    text-decoration: underline;
    color: #FF5733;
  }
  
  #Landing-Intro {
    color: #e9b45a;
    text-align: center;
    font-family: 'Lora', serif;
    font-size: 20px;
    padding: 10px;
  }
  
  /* New styles for login form */
  .login-form {
    position: absolute;
    top: 20px;
    right: 20px;
    background-color: clear;
    padding: 20px;
    border-radius: 10px;
  }
  
  .login-input {
    margin-bottom: 10px;
    padding: 5px;
    border: 1px solid #e9b45a;
    border-radius: 5px;
    width: 100px;
  }
  
  .login-button {
    background-color: rgba(103, 170, 182, 0.5);
    color: white;
    padding: 8px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }

/* Style for Confirm Reservation button */
    .button-container form input[type="submit"] {
        border-radius: 25px;
        cursor: pointer;
        margin-bottom: 10px; /* Reduce vertical margin */
        background-color: #e9b45a;
	    border: 1pt solid black;
	    box-shadow: -3px 3px;
	    width: 10%;
	    height: 50px;
	    border-radius: 25px;
	    margin-top: 5%;
	    font-size: 16pt;
    }

    /* Style for Cancel Reservation button */
    .cancel form input[type="submit"] {
        border-radius: 25px;
        cursor: pointer;
        margin-bottom: 10px; /* Reduce vertical margin */
        background-color:red;
	    border: 1pt solid black;
	    box-shadow: -3px 3px;
	    width: 10%;
	    height: 50px;
	    border-radius: 25px;
	    margin-top: 4%;
	    font-size: 16pt;
    }
.submit-btn :hover{
    text-transform: uppercase;
    text-shadow: 2px 2px 2px black;
    color: gold;
}

footer {
    background-color: #001F3F;
    color: white;
    padding: 5px 0;
    text-align: center;
    width: 100%;
  }
  
  .footer-content {
    max-width: 1200px;
    margin: 0 auto;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
  }
  
  .footer-section-info,
  .footer-section {
    box-sizing: border-box;
    text-align: center;
    width: 100%;
    max-width: 20%;
    margin-bottom: 20px;
  }
  
  .footer-section h3 {
    font-size: 16px;
    margin-bottom: 10px;
    text-decoration: underline;
    color: #87CEEB;
  }
  
  .footer-section p {
    font-size: 12px;
    margin-bottom: 10px;
    text-align: left;
    color: white;
  }
  
  .footer-section ul li {
    margin-bottom: 10px;
    text-align: left;
    color: white;
  }
  
  .footer-section ul li a {
    color: white;
    text-align: left;
    text-decoration: none;
  }
  
  .footer-section a {
    text-decoration: underline;
    color: #87CEEB;
  }
  
  .footer-bottom {
    width: 100%;
    text-align: center;
    margin-top: 10px;
    padding-top: 10px;
    border-top: 1px solid #555;
  }
  
  .footer-bottom p {
    font-size: 10px;
    color: white;
  }
  
  .reservation-summary {
	  color: white; 
	  text-align: center;
	  margin-top: 3%;
  }
		
	</style>
	
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Reservation Summary</title>
    <link href="style.css" rel="stylesheet">
    <!-- Include any necessary scripts or CSS -->
</head>
<body>

<header class="Landing-Page-Banner">
        <div class="Logo-Container">
        <div class="Logo-Image-Left">
            <img src="../Media/Images/MoffatBayLogo.png" alt="Left Image">
        </div>
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700" rel="stylesheet">
        <h1 class="Logo-Name">Moffat Bay Lodge & Marina</h1>
        </div>

        
        <div class="login-form">
    	<form action="http://localhost:8080/MoffatBay2/login" method="post">
        <input type="email" name="username" class="login-input" placeholder="Email">
        <input type="password" name="password" class="login-input" placeholder="Password">
        <button type="submit" class="login-button"><strong>Log In</strong></button>
    	</form>
	</div>
    </header>

  <div class="Landing-Nav-Menu" style="width: 800px;">
		
	<a id= "Home Link" href="../Landing Page/index.html" target="_self">
    <h2 id="Home Label">Home</h2></a>

    <a id= "About Us Link" href="../AboutUs/AboutUs.html" target="_self">
    <h2 id="About Us Label">About Us</h2></a>
    
    <a id="Activities Link" href="../Activities/Activities.html" target="_self">
	<h2 id="Activities Label">Activities</h2></a>
    
    <a id="Reservations Link" href="../Registration/reservation.jsp" target="_self">
	<h2 id="Reservation Label">Reservations</h2></a>

</div>

<%
	//Get the current session
	HttpSession loginSession = request.getSession(false); 

	//Check if the user is logged in
	if (loginSession == null || loginSession.getAttribute("username") == null) {
		//Redirect the user to the login page if not loffed in
		System.out.println("user not logged in redirecting"); 
		response.sendRedirect("http://localhost:8080/MoffatBay2/login");
	}
	else {
%>


<div class="reservation-summary">
    <h2>Reservation Summary</h2>
    <!-- Display reservation details -->
    
	<p>Check-in Date: <%= request.getParameter("checkin") %></p>
    <p>Check-out Date: <%= request.getParameter("checkout") %></p>
    <p>Number of Guests: <%= request.getParameter("guests") %></p>
    <p>Room Type: <%= request.getParameter("roomType") %></p>
    <p>Total Price: <%= request.getParameter("totalPrice") %></p>
    <%// Generate a random confirmation number in Java
    Random random = new Random();
    int confirmationNumber = 10000000 + random.nextInt(90000000);
    
 // Store the confirmation number in the session
    loginSession = request.getSession();
    session.setAttribute("confirmationNumber", confirmationNumber);
 %> <p>Reservation Number: <%= confirmationNumber %>
	
	
	



    <!-- Buttons for confirming or canceling -->
    <div class="button-container">
        <form action="confirm_reservation.jsp" method="post">
            <input type="submit" value="Confirm Reservation">
        </form>
    </div>
    
    <div class="cancel">
        <form action="reservation.jsp" method="post">
            <input type="submit" value="Cancel Reservation">
        </form>
    </div>
    <!-- Form submission with confirmation number -->
    <form action="confirm_reservation.jsp" method="post">
        <input type="hidden" name="confirmationNumber" value="<%= confirmationNumber %>">
        <input type="hidden" name="checkin" value="<%= request.getParameter("checkin") %>">
        <input type="submit" value="Confirm Reservation">
    </form>
</div>
<%
	}
%>


<%
//Retrieve the confirmation number from the session
	loginSession = request.getSession(false);
	int confirmationNumber = (int) session.getAttribute("confirmationNumber");
	
		
    // Retrieve reservation details from request parameters
    String checkinDate = request.getParameter("checkin");
    String checkoutDate = request.getParameter("checkout");
    int guests = Integer.parseInt(request.getParameter("guests"));
    String roomType = request.getParameter("roomType");
    double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
    
    
    // Database connection details
    String jdbcURL = "jdbc:mysql://localhost:3306/MoffatBayLodge";
    String dbUser = "student1";
    String dbPassword = "pass";

    try {
        // Establish a connection to the database
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

        // Prepare the SQL query to retrieve GuestID based on the logged-in user's username
        String guestIdQuery = "SELECT GuestID FROM Guests WHERE Email = ?";
        PreparedStatement guestIdStatement = connection.prepareStatement(guestIdQuery);
        guestIdStatement.setString(1, (String) session.getAttribute("username")); // Assuming the username is stored in the session
        ResultSet resultSet = guestIdStatement.executeQuery();

        int guestId = 0; // Initialize guestId
        if (resultSet.next()) {
            guestId = resultSet.getInt("GuestID"); // Get the GuestID from the result set
        }

        // Prepare the SQL query to insert into Bookings table
        String sql = "INSERT INTO Bookings (CheckInDate, CheckOutDate, NumOfGuests, Price, ReservationNumber, RoomType, GuestID) VALUES (?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = connection.prepareStatement(sql);

        // Set parameters for the query
        statement.setString(1, checkinDate);
        statement.setString(2, checkoutDate);
        statement.setInt(3, guests);
        statement.setDouble(4, totalPrice);
        statement.setInt(5, confirmationNumber);
        statement.setString(6, roomType);
        statement.setInt(7, guestId); // Set the GuestID retrieved from the Guests table

        // Execute the query
        int rowsInserted = statement.executeUpdate();

        if (rowsInserted > 0) {
            out.println("Booking details inserted successfully!");
            // You can redirect to a success page or display a success message here
        }

        // Close resources
        resultSet.close();
        guestIdStatement.close();
        statement.close();
        connection.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>


<div style="text-align: center; margin-top: 20px;">
    <a href="../../Landing Page/index.html" style="text-decoration: none;">
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

            <h3><a href="../../AboutUs/AboutUs.html">About Us</a></h3>
            <ul>
                <li>Discover the beauty of Moffat Bay, where nature meets luxury.</li>
            </ul>


        </div>
        <div class="footer-section">
            <h3><a href="../../Activities/Activities.html">Activities</a></h3>
            <ul>
                <li>Check Out What We have to Offer!</li>

            </ul>
        </div>
        <div class="footer-section">
            <h3><a href="../../Registration/reservation.jsp">Reservations</a></h3>
            <ul>
                <li><a href="../../Registration/reservation.jsp">Book Now</a></li>
                <li><a href="../../Reservation Lookup/ReservationLookUp.html">Reservation Look up</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3><a href="../../Login/login.jsp">Account</a></h3>
        <ul>
          	<li><a href="../../Login/login.jsp">Login</a></li>
          	<li><a href="../../Registration/includes/signupregistration.html">Create an Account</a></li>
        </ul>
        </div>

    </div>
    <div class="footer-bottom">
        <p>&copy; 2023 Moffat Bay Resort | <a href="../AboutUs/AboutUs.html">About Us</a> | <a href="terms.html">Terms of Use</a> | <a href="privacy.html">Privacy Policy.</p>
    </div>
</footer>

</body>
</html>
