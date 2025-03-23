<?php

require_once '../includes/DBOperations.php';
$response = array();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['username']) && isset($_POST['email']) && isset($_POST['password'])) {
        $db = new DbOperation();

        // Sanitize input
        $username = htmlspecialchars(strip_tags($_POST['username']));
        $email = htmlspecialchars(strip_tags($_POST['email']));
        $password = password_hash($_POST['password'], PASSWORD_BCRYPT); // Use bcrypt for hashing

        if ($db->createUser($username, $password, $email)) {
            $response['error'] = false;
            $response['message'] = "User registered successfully";
        } else {
            $response['error'] = true;
            $response['message'] = "Some error occurred, please try again";
        }
    } else {
        $response['error'] = true;
        $response['message'] = "Required fields are missing";
    }
} else {
    $response['error'] = true;
    $response['message'] = "Invalid request";
}

echo json_encode($response);

?>
