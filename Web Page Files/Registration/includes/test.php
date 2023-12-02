<!---
Joel Avery
Andrew Danielson
Tabark Kambal
Gabriel Pedraza Torres
CSD 460 - Software Development CAPSTONE
--->

<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Retrieve form data
    $firstName = test_input($_POST["FirstName"]);
    $lastName = test_input($_POST["LastName"]);
    $email = test_input($_POST["email"]);
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);
    $telephone = test_input($_POST["Telephone"]);
    $streetAddress = test_input($_POST["StreetAddress"]);
    $city = test_input($_POST["City"]);
    $state = test_input($_POST["State"]);

    try {
        require_once "dbh.inc.php";

        // Check if the user with the same email already exists
        $checkQuery = "SELECT * FROM Guests WHERE Email = ?";
        $checkStmt = $pdo->prepare($checkQuery);
        $checkStmt->execute([$email]);

        if ($checkStmt->rowCount() > 0) {
            // User already exists, redirect with a message
            $message = "User with the email '$email' already exists. Please choose a different email.";
            header("Location: registration_result.php?message=$message");
            exit(); // Ensure no further code execution after the redirect
        } else {
            // User does not exist, proceed with insertion
            $insertQuery = "INSERT INTO Guests (FirstName, LastName, Email, Password, Telephone, StreetAddress, City, State) 
                            VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            $insertStmt = $pdo->prepare($insertQuery);
            $insertStmt->execute([$firstName, $lastName, $email, $password, $telephone, $streetAddress, $city, $state]);

            // Redirect to the registration result page with a success message
            $message = "Registration successful for $firstName $lastName.";
            header("Location: registration_result.php?message=$message");
            exit();
        }
    } catch (PDOException $e) {
        die("Query failed: " . $e->getMessage());
    }
} else {
    header("Location: signupregistration.html");
    exit();
}

// Echo form data (Note: This section will not be executed because of the redirect)
echo "First Name: " . $firstName . "<br>";
echo "Last Name: " . $lastName . "<br>";
echo "Email: " . $email . "<br>";
echo "Telephone: " . $telephone . "<br>";
echo "Street Address: " . $streetAddress . "<br>";
echo "City: " . $city . "<br>";
echo "State: " . $state . "<br>";

function test_input($data)
{
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
}
