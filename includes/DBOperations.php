<?php

class DbOperation {
    private $conn;

    function __construct() {
        require_once '../includes/DBConnect.php';
        $db = new DbConnect();
        $this->conn = $db->connect();
    }

    public function createUser($username, $password, $email) {
        $stmt = $this->conn->prepare("INSERT INTO users (username, password, email) VALUES (?, ?, ?)");
        if ($stmt === false) {
            die('Prepare failed: ' . htmlspecialchars($this->conn->error));
        }

        $bind = $stmt->bind_param("sss", $username, $password, $email);
        if ($bind === false) {
            die('Bind param failed: ' . htmlspecialchars($stmt->error));
        }

        $execute = $stmt->execute();
        if ($execute === false) {
            die('Execute failed: ' . htmlspecialchars($stmt->error));
        }

        $stmt->close();
        return $execute;
    }
}

?>
