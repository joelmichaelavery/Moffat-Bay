<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $name = $_POST['name'];
    $email = $_POST['email'];
    $tel_no = $_POST['tel_no'];
    $message = $_POST['message'];

    echo "<h2>Contact Form Submission Details</h2>";
    echo "<p>Name: $name</p>";
    echo "<p>Email: $email</p>";
    echo "<p>Phone Number: $tel_no</p>";
    echo "<p>Message: $message</p>";
}
