
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<!--
Joel Avery
Andrew Danielson
Tabark Kambal
Gabriel Pedraza Torres
CSD 460 - Software Development CAPSTONE
-->
	 
	 
<!-- 
This page is designed for the user to book a reservation, put their dates in, number of guests, select the type of room
and then it calculates the total price. They can press reserve and be transfered to the reservation summary page. 

FIXME####Still need to work on what happens when the reserve button gets pressed###FIXME
FIXME###It needs to be verified that the user is logged in before they can reserve a room###FIXME
FIXME###Needs to save to the database ###FIXME
 -->

<html>
<head>
    <meta charset="UTF-8">
    <title>Book A Reservation</title>
    <!-- Link to an external stylesheet for styling -->
    <link href="style.css" type="text/css" rel="stylesheet" />
</head>
<body>

    <header class="Landing-Page-Banner">
        <h1 class="Logo-Name">Moffat Bay Lodge & Marina</h1>
    </header>
    
    <div class="Landing-Nav-Menu" style="width: 600px;">
		
	<a id= "Home Link" href="../Landing Page/index.html" target="_self">
    <h2 id="Home Label">Home</h2></a>

    <a id= "About Us Link" href="../AboutUs/AboutUs.html" target="_self">
    <h2 id="About Us Label">About Us</h2></a>
    
    <a id="Activities Link" href="../Activities/Activities.html" target="_self">
	<h2 id="Activities Label">Activities</h2></a>
	
	<!-- Added the Create Account Link  -->
	<a id="Create Account Link" href="../Login/login.jsp" target="_self">
	<h2 id="Create Account Label">Account</h2></a>

</div>
    
    
	<style>
body {
            font-family: Arial, Garamond;
            background-color: #374d37; /* Primary color of the page */ 
            margin: 0;
            padding: 0;
        }
        .Logo-Name {
            font-family: 'Lora', serif;
            color: tan;
            text-align: center;    
        }
        .Landing.Page.Banner {
            background-color: #41240d; /* To compliment the primary color */
            color: #fff;
            text-align: left;
            padding: 20px;
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
            background-color: rgba(103, 170, 182, 0.5); /* RGBA color with 70% opacity */
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
        .Landing-Nav-Menu h2 a { /*PLEASE REVIEW WHEN LINK IS AVAILABLE */
            text-decoration: none; /* Remove default underline on anchor */
            color: #e9b45a; /* Set anchor text color */
        }
        
        .Landing-Nav-Menu h2 a:hover { /*PLEASE REVIEW WHEN LINK IS AVAILABLE */
            text-decoration: underline; /* Add underline on hover */
            color: #FF5733; /* Change color on hover */
        }
        #Landing-Intro {
            color: rgb(168, 255, 248);
            text-align: center;
            font-family: 'Lora', serif;
            font-size: 20px;
            padding: 10px;
          }

    
        
        .Logo-Name {
          font-family: 'Lora', serif;
          color: tan;
          text-align: center;
        }
        
	    #Landing-Intro {
	      color: tan;
	      text-align: center;
	      font-family: 'Lora', serif;
	    }
	    
		
        body {
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            font-family: Arial, Garamond;
            background-color: #374d37; /* Primary color of the page */ 
        }

        .Landing-Page-Banner {
            background-color: #41240d; /* To compliment the primary color */
            color: #fff;
            text-align: center;
            padding: 10px;
            width:100%; 
            height: 100px; 
        }

        .Logo-Name {
            font-family: 'Lora', serif;
            color: tan;
            text-align: center;    
        }
        
        .information {
        	margin-right: 17%;  
        }

footer {
      background-color: #001F3F;
      color: white;
      padding: 5px 0;
      text-align: center;
      width: 100%;
      position: fixed;
      bottom: 0;
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
    
    .footer-bottom a {
		color:  #87CEEB;
	}
	
	

	
        .grid-container {
            display: flex;
            gap: 20px; /* Adjust spacing between sections */
            margin-left: -20%; /* Adjust margin for alignment */
            max-width: 1100px; /* Adjust maximum width */
        }

        .image-container {
            width: calc(50% - 10px); /* 50% width for the main image container */
            max-height: 800px; /* Set the same max-height as the first image */
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 0%; 
        }

        .image-container img {
            max-width: 100%; /* Ensure image takes full width of its container */
            max-height: 100%; /* Ensure image takes full height of its container */
            object-fit: cover; /* Maintain aspect ratio and fill container */
            border-radius: 15px; 
            box-shadow: 0 0 20px black;
        }

        .image-container-right {
            width: calc(60% - 10px); /* 50% width for the grid of images */
            display: grid;
            grid-template-columns: 1fr 1fr; /* 2 columns */
            gap: 125px; /* Adjust spacing between images */
            align-items: start;/* Align images to the top of the container */
            margin-left: 35%; 
            margin-top: 25px; 
    
        }

        .image-container-right .sub-box {
            height: 200px; /* Adjust height of each image container */
            width: 300px; 
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .image-container-right img {
            max-width: 125%; /* Ensure images take full width of their containers */
            max-height: 125%; /* Ensure images take full height of their containers */
            object-fit: cover; /* Maintain aspect ratio and fill container */
            border-radius: 15px; 
            box-shadow: 0 0 20px black;
        }
        
		/* Styles for the booking container */
		.booking-container {
		    position: fixed;
		    z-index: 50; 
		    bottom: 20px;
		    right: 20px;
		    width: 500px; /* Adjusted width */
		    height: 475px; /* Adjusted height */
		    border: 2px solid #41240d; /* Color adjusted to match the theme */
		    border-radius: 10px;
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		    padding: 20px;
		    box-sizing: border-box;
		    overflow: hidden; /* Ensure content doesn't overflow */
		    background-color: #f1f1f1; /* Lighter background */
		    color: #41240d; /* Darker text color */
		    font-family: 'Arial', sans-serif; /* Adjust font if needed */
		    box-shadow: inset 0 0 20px black; 
		}
		
		/* Existing styles for form elements */
		.booking-form label,
		.booking-form select,
		.booking-form input[type="number"],
		.booking-form input[type="text"],
		.booking-form input[type="submit"] {
		    width: calc(100% - 20px); /* Full width minus padding */
		    padding: 8px; /* Adjust padding as needed */
		    border-radius: 5px;
		    border: 1px solid #ccc; /* Light border */
		    margin-bottom: 2px; /* Current margin */
		}
		
		/* Updated styles to reduce the vertical margin */
		.booking-form label,
		.booking-form select,
		.booking-form input[type="number"],
		.booking-form input[type="text"],
		.booking-form input[type="submit"] {
		    margin-bottom: 2px; /* Adjusted margin */
		}

		
		/* Title for the booking container */
		.booking-container-title {
		    font-size: 20px;
		    font-weight: bold;
		    text-align: center;
		    margin-bottom: 20px; /* Space below the title */
		}
		
		/* Styles for the calendar section */
		.calendar {
		    margin-bottom: 20px; 
		}
		
		/* Styles for the form */
		.booking-form {
		    display: flex;
		    flex-direction: column;
		    gap: 10px;
		    flex-grow: 1; /* Allows the form to expand within the container */
		}
		
		
		
		.booking-form input[type="submit"] {
		    background-color: #41240d; /* Darker background for submit button */
		    color: white; /* Text color for submit button */
		    cursor: pointer; /* Cursor style */
		    transition: background-color 0.3s ease; /* Smooth transition */
		}
		
		.booking-form input[type="submit"]:hover {
		    background-color: #001F3F; /* Darker background on hover */
		}

        
        .Look-Up {
			text-align: center;
			font-size: 32pt;
			margin-top: 20px; 
		}
        
        .Look-Up a:visited {
        	color:  #e9b45a; 
        }
        
        .Look-up a {
        	color:  #e9b45a; 
        }
        .Landing-Page-Banner {
            background-color: #41240d; /* To compliment the primary color */
            color: #fff;
            text-align: center;
            padding: 10px;
            width:100%; 
            height: 100px; 
        }
        
    </style>


   <div class="grid-container">
        <div class="image-container">
            <div class="sub-box1">
                <img src="hotel.jpg" style="max-width: 900px; max-height: 800px;" alt="Cabin Image">
            </div>
        </div>
        <div class="image-container-right">
            <div class="sub-box">
                <img src="kingRoom.jpg" alt="Image 2">
            </div>
            <div class="sub-box">
                <img src="doubleQueen.jpg" alt="Image 3">
            </div>
            <div class="sub-box">
                <img src="bathroom.jpg" alt="Image 4">
            </div>
            <div class="sub-box">
                <img src="suite.jpg" alt="Image 5">
            </div>
        </div>
    </div>
    
    <div class="information"> 
    		<h2>Welcome Moffat Bay Lodge & Marina</h2>
    		<p>
        		We offer a variety of rooms to suit your needs, from cozy Double Full Beds to spacious King Bed suites. Enjoy our comfortable and well-appointed accommodations  <br /> 
        		during your stay. Our rooms include options like Double Full Beds, Single Queen Beds, Double Queen Beds, and luxurious King Bed suites, ensuring a comfortable <br />rest for every guest.
				Beyond your stay, indulge in our range of outdoor activities, perfect for nature and adventurers alike. Whether it's hiking, water sports, or simply <br />relaxing by the 
        		scenic views, there's something for everyone. Come, experience a serene escape and a memorable stay with us.
    		</p>    		
		</div>
    	
    </div>
    
    
    <!-- Add hidden input fields to store selected dates -->
	<input type="hidden" id="checkinDate" name="checkinDate">
	<input type="hidden" id="checkoutDate" name="checkoutDate">
    
     <div class="booking-container">
    <div class="booking-container-title">
        Reserve Now!
    </div>
    <form id="bookingForm" action="reservationsummary.jsp" method="post">
        <div class="calendar">
            <label for="checkin">Check-in Date:</label>
            <input type="date" id="checkin" name="checkin">
            <label for="checkout">Check-out Date:</label>
            <input type="date" id="checkout" name="checkout">
        </div>
        <div class="booking-form">
            <label for="guests">Number of Guests:</label>
            <input type="number" id="guests" name="guests" min="1">
            <label for="roomType">Room Type:</label>
            <select id="roomType" name="roomType">
                <!-- Options loaded from the database -->
                <option value="Double">Double Full Beds</option>
                <option value="Single">Single Queen Bed</option>
                <option value="Suite">Double Queen Beds</option>
                <option value="King">King Bed</option>
            </select>
            <label for="totalPrice">Total Price:</label>
            <input type="text" id="totalPrice" name="totalPrice" readonly>
            <input type="hidden" id="checkinDate" name="checkinDate">
            <input type="hidden" id="checkoutDate" name="checkoutDate">
            <input type="submit" value="Reserve">
        </div>
    </form>
</div>
            
            <!-- JavaScript for calculating total price -->
<script>
    // Function to fetch the price and calculate total
    function calculateTotal() {
        var roomType = document.getElementById("roomType").value;
        var pricePerNight = fetchPrice(roomType);
        var checkin = new Date(document.getElementById("checkin").value);
        var checkout = new Date(document.getElementById("checkout").value);
        var numberOfNights = (checkout - checkin) / (1000 * 3600 * 24);
        
        // Set selected dates to hidden input fields
        document.getElementById("checkinDate").value = checkin;        
        document.getElementById("checkoutDate").value = checkout;

        // Calculating the total price
        var totalPrice = pricePerNight * numberOfNights;

        // Displaying the total price
        document.getElementById("totalPrice").value = totalPrice.toFixed(2);
    }
    
	 // Adding event listeners for form submission and price calculation
	    document.getElementById("bookingForm").addEventListener("submit", function(event) {
	        event.preventDefault();
	        calculateTotal();
	        // Submitting the form to reservationsummary.jsp
	        this.submit();
	    });
	
	    document.getElementById("roomType").addEventListener("change", function() {
	        calculateTotal();
	    });
</script>
        </div>
    
<!-- JavaScript for calculating total price -->
    <script>
    // Function to fetch the price
    function fetchPrice(roomType) {
        // Simulating fetch call to get price data
        // Replace this with your actual fetch call to fetchPrice.jsp
        var priceData = {
            "Double": 120.75, // Example price for Double Full Beds
            "Single": 131.25, // Example price for Single Queen Bed
            "Suite": 141.75,  // Example price for Double Queen Beds
            "King": 157.50    // Example price for King Bed
        };
        return priceData[roomType];
    }
	
    function checkLoggedIn(callback) {
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '/checkSession', true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var response = JSON.parse(xhr.responseText);
                if(response.loggedIn) {
                    callback(true);
                } else {
                    alert("Please log in first to reserve a room.");
                    callback(false);
                }
            }
        };
        xhr.send();
    }

    // Usage:
    document.getElementById("bookingForm").addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent default form submission

        checkLoggedIn(function(isLoggedIn) {
            if(isLoggedIn) {
                calculateTotal(); // Calculate total price
                document.getElementById("bookingForm").submit(); // Submit the form
            }
        });
    });


    
    // Function to calculate the total price and set selected dates
    function calculateTotal() {
        var roomType = document.getElementById("roomType").value;
        var pricePerNight = fetchPrice(roomType);
        var checkin = new Date(document.getElementById("checkin").value);
        var checkout = new Date(document.getElementById("checkout").value);
        var numberOfNights = (checkout - checkin) / (1000 * 3600 * 24);

        // Set selected dates to hidden input fields (in ISO format)
        document.getElementById("checkinDate").value = checkin.toISOString();        
        document.getElementById("checkoutDate").value = checkout.toISOString();

        // Calculating the total price
        var totalPrice = pricePerNight * numberOfNights;

        // Displaying the total price
        document.getElementById("totalPrice").value = totalPrice.toFixed(2);
    }

    // Adding event listeners for form submission and price calculation
    document.getElementById("bookingForm").addEventListener("submit", function(event) {
        event.preventDefault();
        calculateTotal();
        // Submitting the form to reservationsummary.jsp
        this.submit();
    });

    document.getElementById("roomType").addEventListener("change", function() {
        calculateTotal();
    });
</script>



   
<div style="text-align: center; position: absolute; bottom: 16%;">
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
