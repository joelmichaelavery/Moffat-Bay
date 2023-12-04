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
                <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                <li class="nav-item"><a class="nav-link" href="reservation.html">Your Reservation</a></li>
            </ul>
        </nav>
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
    </div>
</body>
</html>
