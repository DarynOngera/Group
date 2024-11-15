<?php
// Database Connection
$servername = " 135.232.112.212"; // Replace with your VM's public IP
$username = "ServerAdmin";        // Replace with your database username
$password = "ServerAdmin123";    // Replace with your database password
$dbname = "drugdb";           // Replace with your database name

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Include Patient Controller
require_once("./includes/patientController.php");

$get_email = isset($_GET['email']) ? $_GET['email'] : null;

if (count($_POST) > 0) {
    // Sanitize inputs
    $fname = $conn->real_escape_string($_POST['first-name']);
    $lname = $conn->real_escape_string($_POST['last-name']);
    $ssn = $conn->real_escape_string($_POST['ssn']);
    $email = $conn->real_escape_string($_POST['email']);
    $password = password_hash($_POST['password'], PASSWORD_BCRYPT); // Encrypt password
    $phone = $conn->real_escape_string($_POST['phone']);
    $address = $conn->real_escape_string($_POST['address']);
    $weight = (float)$_POST['weight'];
    $height = (float)$_POST['height'];
    $age = (int)$_POST['age'];
    $blood_group = $conn->real_escape_string($_POST['blood-group']);
    $profile_image = null;

    // Handle file upload
    if (isset($_FILES['profile-image']) && $_FILES['profile-image']['error'] == 0) {
        $target_dir = "./uploads/";
        $target_file = $target_dir . basename($_FILES['profile-image']['name']);
        if (move_uploaded_file($_FILES['profile-image']['tmp_name'], $target_file)) {
            $profile_image = $target_file;
        } else {
            echo '<script>alert("Failed to upload profile image")</script>';
        }
    }

    // Validate required fields
    if (!$fname || !$lname || !$ssn || !$email || !$password || !$phone || !$address || !$weight || !$height || !$age || !$blood_group) {
        echo '<script>alert("Kindly ensure that all required fields are filled")</script>';
    } else {
        // Insert into database
        $stmt = $conn->prepare("INSERT INTO patients (first_name, last_name, ssn, email, password, phone, address, weight, height, age, blood_group, profile_image) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("ssssssssisss", $fname, $lname, $ssn, $email, $password, $phone, $address, $weight, $height, $age, $blood_group, $profile_image);

        if ($stmt->execute()) {
            echo '<script>alert("Your account has been created successfully")</script>';
            echo '<script type="text/javascript">document.location="./login.php?email=' . urlencode($email) . '&type=patient&from=signup"</script>';
        } else {
            echo '<script>alert("Something went wrong. Try again")</script>';
            echo '<script type="text/javascript">document.location="./signup.php"</script>';
        }

        $stmt->close();
    }
}
$conn->close();
?>
