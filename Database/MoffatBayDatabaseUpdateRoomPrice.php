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

// SQL statement for updating RoomPrice in RoomType table by 5%
$updateRoomPrice = "UPDATE RoomType SET RoomPrice = RoomPrice * 1.05";

// Execute the SQL statement
if ($mysqli->query($updateRoomPrice) === TRUE) {
    echo "RoomPrice updated successfully. ";
} else {
    echo "Error updating RoomPrice: " . $mysqli->error;
}

// Close the database connection
$mysqli->close();
?>
