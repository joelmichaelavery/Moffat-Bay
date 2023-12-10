<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--
Joel Avery
Andrew Danielson
Tabark Kambal
Gabriel Pedraza Torres
CSD 460 - Software Development CAPSTONE
-->

<html>
<head>
    <meta charset="UTF-8">
    <title>Reservation Summary</title>
    <!-- Link to an external stylesheet for styling -->
    <link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>

     <header class="Landing-Page-Banner">
       <div class="Logo-Container">
      <div class="Logo-Image-Left">
        <img src="https://cdn.discordapp.com/attachments/1156321354669379707/1179795154899578895/MoffatBayLogo.png?ex=657b14dc&is=65689fdc&hm=72905f0998b9a603ed913c58680cf9699de5a8afc4a250510f934b4ead4c2fd9&" alt="Left Image">
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

  <div class="Landing-Nav-Menu">
	  
	  <a id="Home link" href="../Landing Page/index.html" target="_self">
          <h2 id="Home Label">Home</h2>
        </a>
	  
    <a id="About Us Link" href="../AboutUs/AboutUs.html" target="_self">
      <h2 id="About Us Label">About Us</h2>
    </a>
    
    <a id="Your Reservation Link" href="../Registration/reservation.jsp" target="_self">
      <h2 id="Your Reservation Label">Reservations</h2>
    </a>

    <a id="Account Link" href="../Login/login.jsp" target="_self">
      <h2 id="Account">Account</h2>
    </a>
  </div>

    
   <h1>Your Reservation is successfully confirmed</h1>
<style>
	
	body {
      font-family: Arial, Garamond;
      background-color: #374d37;
      margin: 0;
      padding: 0;
      display: flex;
      flex-direction: column;
      min-height: 100vh;
      flex: 1;
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
      width: 60px;
      height: 60px;
      border-radius: 50%;
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
    .activity-container {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-around;
    }
    .activity {
      width: auto;
      margin: 10px;
      text-align: center;
      background-color: #fff; /* White activity cards */
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
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
      width: 150px;
      height: 150px;
      border-radius: 50%;
      margin-bottom: 5px;
    }

    .LogoName {
      border-top: 0px;
      font-size: 36px;
    }
    
    h1 {
    color: white; 
    text-align: center; 
    }
</style>
    <div style="text-align: center; margin-top:29%;">
    <a href="../Landing Page/index.html" style="text-decoration: none;">
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
        <h3><a href="../Registration/reservation.jsp">Reservations</a></h3>
        <ul>
          <li><a href="../Registration/reservation.jsp">Book Now</a></li>
          <li><a href="../Reservation Lookup/ReservationLookUp.html">Reservation Look up</a></li>
        </ul>
      </div>

      <div class="footer-section">
        <h3><a href="../Login/login.jsp">Account</a></h3>
        <ul>
          <li><a href="../Login/login.jsp">Login</a></li>
          <li><a href="../Registration/includes/signupregistration.html">Create an Account</a></li>
        </ul>
      </div>
    </div>

    <div class="footer-bottom">
      <p>&copy; 2023 Moffat Bay Resort | <a href="../AboutUs/AboutUs.html">About Us</a> | <a href="terms.html">Terms of Use</a> | <a href="privacy.html">Privacy Policy.</p>
    </div>
  </footer>
</body>
</html>
