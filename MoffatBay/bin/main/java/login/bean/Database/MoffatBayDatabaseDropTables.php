<?php
// Database connection parameters
$hostname = 'localhost';
$username = 'student1';
$password = 'pass';
$database = 'MoffatBayLodge';

// Create a new connection
$mysqli = new mysqli($hostname, $username, $password, $database);

// Check for connection errors
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

// SQL query to drop the table
$sql = "DROP DATABASE MoffatBayLodge";

if ($mysqli->query($sql) === TRUE) {
    echo "Table dropped successfully";
} else {
    echo "Error dropping table: " . $mysqli->error;
}

// Close the connection
$mysqli->close();
?>
