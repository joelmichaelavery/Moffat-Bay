<?php
$dsn = "mysql:host=localhost;port=3306;dbname=MoffitBayLodge";
$dbusername = "student1";
$dbpassword = "pass";

try {
    $pdo = new PDO($dsn, $dbusername, $dbpassword);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "connection failed: " . $e->getMessage();
}
