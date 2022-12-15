<?php 

class Employee {   
  
    private $conn;
    // private $table_name = "menu";

    // object properties
    public $username;
    public $role;
    public $status;
    
 
    // constructor with $db as database connection
    public function __construct($con){
        $this->conn = $con;
    }

////////////////////////////////////////////////////////////////////

function readEmployee() {
 
    // select all query
    $query = "SELECT username, role, status FROM employee";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

}

?>
