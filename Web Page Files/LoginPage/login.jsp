<%-- Author: Joel Avery
     Date: November 11, 2023
     Course: CSD 460
     This is a JSP page for user login --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
    <!-- Link to an external stylesheet for styling -->
    <link href="login.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <!-- Header section containing the hotel name and navigation links -->
    <header class="Landing-Page-Banner">
    	<link href="https://fonts.googleapis.com/css?family=Lora:400,700" rel="stylesheet">
    	<h1 class="Logo-Name">Moffat Bay Lodge & Marina</h1>
    </header>
    
    <div class="Landing-Nav-Menu" style="width: 800px;">
		
	<a id= "Home Link" href="index.html" target="_self">
    <h2 id="Home Label">Home</h2></a>

    <a id= "About Us Link" href="AboutUs.html" target="_self">
    <h2 id="About Us Label">About Us</h2></a>
    
    <a id="Activities Link" href="Activities.html" target="_self">
	<h2 id="Activities Label">Activities</h2></a>
    
    <a id="Reservations Link" href="reservation.jsp" target="_self">
	<h2 id="Reservations Label">Reservations</h2></a>
    
	
	<!-- Added the Create Account Link  -->
	<a id="Account Link" href="login.jsp" target="_self">
	<h2 id="Account Label">Account</h2></a>

</div>

    <!-- Login container section -->
    <div class="login-container">
        <h1>Login to Account</h1>
        <form action="<%=request.getContextPath()%>/login" method="post">
            <!-- Input fields for username and password -->
            <label for="username"></label>
            <input type="text" name="username" id="username" required placeholder="Email-Address"><br><br><br>
    
            <label for="password"></label>
            <input type="password" name="password" id="password" required placeholder="Password"><br><br>
            
            <!-- Submit button to submit the form -->
            <input type="submit" value="Submit">
       
        </form>
       
        
        <c:if test="${not empty requestScope.error}">
            <!-- Display an error message if the "error" attribute in the request scope is not empty -->
            <p class="error">${requestScope.error}</p>
        </c:if>
        <div class="create-account">
    		<a href="signupregistration.html">Sign Up Today!</a>
		</div>

    </div>
    
<div style="text-align: center; position: absolute; bottom: 16.5%;">
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
