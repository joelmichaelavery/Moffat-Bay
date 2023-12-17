<!---
Joel Avery
Andrew Danielson
Tabark Kambal
Gabriel Pedraza Torres
CSD 460 - Software Development CAPSTONE
--->

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="home_css.css">
<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Raleway&display=swap" rel="stylesheet">
<title>About Moffat Bay Lodge</title>
<style>
    body {
        font-family: Arial, Garamond;
        background-color: #374d37;
        /* Primary color of the page */
        margin: 0;
        padding: 0;
    }

    header {
        background-color: #0f3f0f;
        /* Dark green, reminiscent of forests */
        color: #fff;
        text-align: center;
        padding: 20px;
    }

    h1 {
        font-size: 55px;
        text-align: center;

    }

    h2 {
        font-size: 36px;
        text-align: center;

    }

    .container {
        max-width: 800px;
        margin: 20px auto;
        padding: 20px;
        text-align: center;
        background-color: #ffe4b5;
        /* Light tan reminiscent of sand and wood */
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
    }

    p {
        font-size: 16px;
        line-height: 1.6;
    }

    footer {
        background-color: #001F3F;
        /* Dark Blue background color- represents the dark waters of the sound */
        color: white;
        padding: 30px 0;
        margin-top: auto;
        text-align: center;
    }

    .footer-content {
        max-width: 1200px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        gap: 40px;
        /* Increase the gap for more spacing */
    }

    .footer-section-info {
        /* Adjust the width to create spacing */
        box-sizing: border-box;
        text-align: center;
        width: 40%;
        /* Adjust the width as needed */
    }

    .footer-section {
        /* Adjust the width to create spacing */
        box-sizing: border-box;
        text-align: center;
        width: 60%;
        /* Adjust the width as needed */
    }

    .footer-section h3 {
        font-size: 18px;
        margin-bottom: 10px;
    }

    .footer-section p {
        font-size: 14px;
        margin-bottom: 10px;
    }

    .footer-section ul {
        list-style: none;
        padding: 0;
    }

    .footer-section ul li {
        margin-bottom: 15px;
        /* Increase the margin for more spacing */
        text-align: center;
        /* Center the text */
    }

    .footer-section ul li a {
        color: white;
        text-decoration: none;
    }

    .footer-bottom {
        text-align: center;
        margin-top: 20px;
        padding-top: 10px;
        border-top: 1px solid #555;
    }

    .footer-bottom p {
        font-size: 12px;
    }
</style>
</head>

<body class="submission-container">
    <header>
        <h1>WE WILL BE IN TOUCH SOON</h1>
    </header>
    <div class="container">
        <?php
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $name = $_POST['name'];
            $email = $_POST['email'];
            $tel_no = $_POST['tel_no'];
            $message = $_POST['message'];

            // Displaying the submitted data
            echo "<h2>Contact Form Submission</h2>";
            echo "<p>Name: $name</p>";
            echo "<p>Email: $email</p>";
            echo "<p>Phone Number: $tel_no</p>";
            echo "<p>Message: $message</p>";

            // Sending an email
            $to = "joelmichaelavery@gmail.com"; // Replace this with your email
            $subject = "New Contact Form Submission";
            $email_body = "Name: $name\nEmail: $email\nPhone Number: $tel_no\n\nMessage:\n$message";

            $headers = "From: $email";

            if (mail($to, $subject, $email_body, $headers)) {
                echo "<p>,<h1>Thank you!</h1>Email sent successfully!</p>";
            } else {
                echo "<p>Failed to send email. Please try again later.</p>";
            }
        } else {
            echo "<h2>No form submission detected.</h2>";
        }
        ?>
        <a href="http://localhost:8080/MoffatBay2/AboutUs/AboutUs.html">Return To Previous Page</a>
    </div>

</body>

</html>