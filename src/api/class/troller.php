<?php 

class Troller {   
  
    private $conn;
    // private $table_name = "menu";

    // object properties
    public $troller_id;
    public $area;
    
 
    // constructor with $db as database connection
    public function __construct($con){
        $this->conn = $con;
    }

////////////////////////////////////////////////////////////////////

function readTroller() {
 
    // select all query
    $query = "SELECT * FROM troller";
 
    // prepare query statement
    $stmt = $this->conn->prepare($query);

 
    // execute query
    $stmt->execute();
 
    return $stmt;
}

}

?>
