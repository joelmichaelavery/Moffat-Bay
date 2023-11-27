<%-- Author: Joel Avery
     Date: November 11, 2023
     Class: CSD 460

     This JSP page is used to display a welcome message to a logged-in user. 
     It retrieves the username from the session and greets the user with a personalized message.
--%>

<%
    // Retrieve the username from the session
    String username = (String) session.getAttribute("username");
%>

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

    <!-- Container to display the welcome message -->
    <div class="welcome-container">
        <h1><%= username %>, you are logged in successfully! <br><hr /> Welcome to our site.  </h1>
    </div>
</body>
</html>
