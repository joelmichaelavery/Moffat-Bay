<?php
$hostname = 'localhost';
$username = 'student1';
$password = 'pass';
$database = 'MoffatBayLodge';

// Create a database connection
$connection = mysqli_connect($hostname, $username, $password, $database);

// Check the connection
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = mysqli_real_escape_string($connection, $_POST['username']);
    $email = mysqli_real_escape_string($connection, $_POST['email']);
    $password = mysqli_real_escape_string($connection, $_POST['password']);

    // Hash the password
    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

    // Insert data into the Guests table
    $sql = "INSERT INTO Guests (FirstName, Email, Password) VALUES ('$username', '$email', '$hashedPassword')";

    if (mysqli_query($connection, $sql)) {
        // Registration successful
        $message = "Registration successful!";
    } else {
        // Registration failed
        $message = "Error: " . $sql . "<br>" . mysqli_error($connection);
    }

    // Redirect back to the registration page with the message
    header("Location: index.html?message=" . urlencode($message));
}

// Close the database connection
mysqli_close($connection);
?>
