/*
This Database Creation is named MoffitBayLodge, in it there are three tables, 1)Guests,  2)Bookings, 3)RoomType In this table we have a table with the guests' information, and login information, we then have the booking table that uses the guestID as the 
foreign key for relation, and room type to get the price and the type of stay. We are also getting the check-in/check-out date, how many people, the price, reservation number. We are then using a room type table to hold the different types of room types
for the stays.

Joel Avery 
11/4/23
*/
-- Creating the database MoffitBayLodge
CREATE DATABASE MoffitBayLodge;

-- Using the MoffitBayLodge database
USE MoffitBayLodge;

-- Creating the table for Room Type
CREATE TABLE RoomType (
    RoomType VARCHAR(50) NOT NULL PRIMARY KEY, -- Type of room in VARCHAR, PRIMARY KEY
    RoomPrice DOUBLE NOT NULL -- Price per night for this type of room.
);

-- Creating the table for Guest Information
CREATE TABLE Guests (
    GuestID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- Unique Identifier.
    FirstName VARCHAR(50) NOT NULL, -- First name in VARCHAR
    LastName VARCHAR(50) NOT NULL, -- Last Name in VARCHAR
    Telephone VARCHAR(15) NOT NULL, -- Telephone Number (changed to VARCHAR)
    StreetAddress VARCHAR(50) NOT NULL, -- Street Address
    City VARCHAR(50) NOT NULL, -- City
    State VARCHAR(2) NOT NULL, -- State in Two-letter Abbreviation.
    Email VARCHAR(50) NOT NULL, -- email address in VARCHAR
    Password VARCHAR(255) NOT NULL, -- Password, will eventually have to hash this information.
    BookingID INT -- Relational to the Booking ID key.
);

-- Creating the table for Bookings
CREATE TABLE Bookings (
    BookingID INT NOT NULL AUTO_INCREMENT PRIMARY KEY, -- The Primary Key for the table is BookingID
    CheckInDate DATE NOT NULL, -- check-in date in date data type.
    CheckOutDate DATE NOT NULL, -- check-out date in date data type.
    NumOfGuests INT NOT NULL, -- Num of Guests for the hotel stay.
    Price DOUBLE NOT NULL, -- Price per the stay of the reservation.
    ReservationNumber VARCHAR(255) NOT NULL, -- Reservation confirmation number. Would like to auto-generate this if possible.
    RoomType VARCHAR(50) NOT NULL, -- Type of Room
    GuestID INT, -- Reference to the GuestID for this stay.
    FOREIGN KEY (GuestID) REFERENCES Guests(GuestID), -- Foreign key for the relation to the guest.
    FOREIGN KEY (RoomType) REFERENCES RoomType(RoomType) -- Foreign key for the type of room to relate to the room type table.
);
