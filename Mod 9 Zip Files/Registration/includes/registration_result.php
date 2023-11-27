<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Result</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <div class="navbar">
        <h1 class="logo">Moffat bay Lodge & Marina </h1>
        <div class="links"></div>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="#">About</a></li>
            <li><a href="#">Contact</a></li>
            <li><a href="#">Your Reservation</a></li>
        </ul>
    </div>
    <div class="Registeration_results" style="    
        height: 100%;
        width: 100%;
        background-color: #374d37;
        background-position: center;
        background-size: cover;
        position: absolute;">
        <div class="form-box" style="
        width: 780px; 
        height: 480px;     
        display: block;
        justify-content: center;
        margin: 6% auto; 
        background: #fff; 
        padding: 5px; 
        border-radius: 30px; 
        box-shadow: 2px 2px 20px black;">
            <h2 style="text-align: center; padding: 100px;">Registration Result</h2>
            <?php
            // Retrieve the message from the URL query parameter
            $message = $_GET['message'];
            echo "<p style='text-align: center; padding: 20px;'>$message</p>";
            ?>
            <a href="signupregistration.html" style="    width: 300px;
                padding: 10px 30px;
                cursor: pointer;
                display: block;
                margin: 4% auto;
                text-align: center;
                background: linear-gradient(to right, #ff105f, #ffad06);
                border: 0;
                outline: none;
                border-radius: 30px;
                color: white;">Go Back to Registration</a>
            <a href="../MoffatBay/views/login.html" style="    width: 200px;
                padding: 10px 30px;
                cursor: pointer;
                display: block;
                margin: 4% auto;
                text-align: center;
                background: linear-gradient(to right, #ff105f, #ffad06);
                border: 0;

                outline: none;
                border-radius: 30px;
                color: white;">Sign in</a>
        </div>
    </div>
</body>

</html>