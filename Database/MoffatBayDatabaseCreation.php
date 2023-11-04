<?php
$hostname = 'localhost';
$username = 'student1';
$password = 'pass';
$database = 'MoffatBayLodge'; // Database name

// Create a database connection
$connection = mysqli_connect($hostname, $username, $password);

// Check the connection
if (!$connection) {
    die("Connection failed: " . mysqli_connect_error());
}

// Create the database MoffatBayLodge
$sql = "CREATE DATABASE IF NOT EXISTS $database";
if (mysqli_query($connection, $sql)) {
    echo "Database created successfully.";
} else {
    echo "Error creating database: " . mysqli_error($connection);
}

// Select the MoffatBayLodge database
mysqli_select_db($connection, $database);

// Create the table for Room Type
$sql = "CREATE TABLE RoomType (
    RoomType VARCHAR(50) NOT NULL PRIMARY KEY,
    RoomPrice DOUBLE NOT NULL
)";

if (mysqli_query($connection, $sql)) {
    echo "RoomType table created successfully.";
} else {
    echo "Error creating RoomType table: " . mysqli_error($connection);
}

// Create the table for Guest Information
$sql = "CREATE TABLE Guests (
    GuestID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Telephone VARCHAR(15) NOT NULL,
    StreetAddress VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    State VARCHAR(2) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    BookingID INT
)";

if (mysqli_query($connection, $sql)) {
    echo "Guests table created successfully.";
} else {
    echo "Error creating Guests table: " . mysqli_error($connection);
}

// Create the table for Bookings
$sql = "CREATE TABLE Bookings (
    BookingID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    CheckInDate DATE NOT NULL,
    CheckOutDate DATE NOT NULL,
    NumOfGuests INT NOT NULL,
    Price DOUBLE NOT NULL,
    ReservationNumber VARCHAR(255) NOT NULL,
    RoomType VARCHAR(50) NOT NULL,
    GuestID INT,
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID),
    FOREIGN KEY (RoomType) REFERENCES RoomType(RoomType)
)";

if (mysqli_query($connection, $sql)) {
    echo "Bookings table created successfully.";
} else {
    echo "Error creating Bookings table: " . mysqli_error($connection);
}

// Close the database connection
mysqli_close($connection);
?>
