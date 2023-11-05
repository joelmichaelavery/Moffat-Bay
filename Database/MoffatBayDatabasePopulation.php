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


// SQL statements for inserting data into tables
$sqlRoomType = "INSERT INTO RoomType (RoomType, RoomPrice) VALUES
   ('Single', 100.00),
   ('Double', 150.00),
   ('Suite', 250.00),
   ('Twin', 120.00),
   ('King', 180.00)";

$sqlGuests = "INSERT INTO Guests (FirstName, LastName, Telephone, StreetAddress, City, State, Email, Password, BookingID) VALUES
   ('John', 'Doe', '555-123-4567', '123 Main St', 'New York', 'NY', 'john@example.com', 'password123', 1),
   ('Jane', 'Smith', '555-987-6543', '456 Elm St', 'Los Angeles', 'CA', 'jane@example.com', 'password456',2),
   ('Mike', 'Johnson', '555-222-3333', '789 Oak St', 'Chicago', 'IL', 'mike@example.com', 'password789', 3),
   ('Alice', 'Williams', '555-777-8888', '101 Pine St', 'San Francisco', 'CA', 'alice@example.com', 'passwordabc', 4),
   ('Bob', 'Brown', '555-555-5555', '222 Cedar St', 'Miami', 'FL', 'bob@example.com', 'passwordxyz', 5)";

$sqlBookings = "INSERT INTO Bookings (CheckInDate, CheckOutDate, NumOfGuests, Price, ReservationNumber, RoomType, GuestID) VALUES
   ('2023-11-15', '2023-11-20', 2, 300.00, 'RES12345', 'Single', 1),
   ('2023-11-17', '2023-11-22', 2, 300.00, 'RES54321', 'Single', 2),
   ('2023-11-20', '2023-11-25', 2, 300.00, 'RES67890', 'Single', 3),
   ('2023-11-22', '2023-11-27', 2, 300.00, 'RES98765', 'Double', 4),
   ('2023-11-25', '2023-11-30', 2, 300.00, 'RES13579', 'Double', 5)";

// Execute SQL statements
if ($mysqli->query($sqlRoomType) === TRUE) {
    echo "RoomType data inserted successfully. ";
} else {
    echo "Error: " . $sqlRoomType . "<br>" . $mysqli->error;
}

if ($mysqli->query($sqlGuests) === TRUE) {
    echo "Guests data inserted successfully. ";
} else {
    echo "Error: " . $sqlGuests . "<br>" . $mysqli->error;
}

if ($mysqli->query($sqlBookings) === TRUE) {
    echo "Bookings data inserted successfully. ";
} else {
    echo "Error: " . $sqlBookings . "<br>" . $mysqli->error;
}

// Close the database connection
$mysqli->close();
?>
