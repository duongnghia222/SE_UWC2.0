<?php 

class Truck {   
  
    private $conn;
    // private $table_name = "menu";

    // object properties
    public $truck_id;
    public $fuel;
    
 
    // constructor with $db as database connection
    public function __construct($con){
        $this->conn = $con;
    }

////////////////////////////////////////////////////////////////////

function readTruck() {
 
    // select all query
    $query = "SELECT * FROM truck";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

}

?>
