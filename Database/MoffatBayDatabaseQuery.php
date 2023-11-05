<!DOCTYPE html>
<html>
<head>
    <title>Query Page</title>
    <style>
        .is-active {
            background-color: green;
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
        .is-inactive {
            background-color: red;
            color: white;
            padding: 5px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <h1>Query Page</h1>

    <h2>Select a Table</h2>
    <form method="post" action="">
        <select name="table_name">
            <option value="Bookings">Bookings</option>
            <option value="Guests">Guests</option>
            <option value="RoomType">Room Type</option>
            <!-- Add more options for other tables in your database -->
        </select>
        <input type="submit" name="display" value="Display Table">
    </form>

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

    if (isset($_POST['display'])) {
        $table = $_POST['table_name'];

        // Modify the query to select all records from the selected table
        $sql = "SELECT * FROM $table";

        $result = $mysqli->query($sql);

        // Generate table headers dynamically based on column names
        if ($result) {
            echo '<table border="1">';
            echo '<tr>';
            while ($fieldInfo = $result->fetch_field()) {
                echo '<th>' . $fieldInfo->name . '</th>';
            }
            echo '</tr>';

            while ($row = $result->fetch_assoc()) {
                echo '<tr>';
                foreach ($row as $value) {
                    echo '<td>' . $value . '</td>';
                }
                echo '</tr>';
            }

            echo '</table>';
        } else {
            echo 'Error executing query: ' . $mysqli->error;
        }
    }

    $mysqli->close();
    ?>
</body>
</html>
