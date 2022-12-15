<?php 

class Task {   
  
    private $conn;
    // private $table_name = "menu";

    // object properties
    public $id;
    public $description;
    public $time;
    public $endtime;
    
 
    // constructor with $db as database connection
    public function __construct($con){
        $this->conn = $con;
    }

////////////////////////////////////////////////////////////////////

function createTask() {
 
    $this->conn->begin_transaction();

    try {
    
    // Insert booking info into reservations table
    // query to insert record
    $query = "INSERT INTO task_collector-info (id, description, time, endtime)
                VALUES (?, ?, ?, ?)";

    // prepare query
    $stmt = $this->conn->prepare($query);

    // sanitize
    $this->id=htmlspecialchars(strip_tags($this->id));
    $this->description=htmlspecialchars(strip_tags($this->description));
    $this->time=htmlspecialchars(strip_tags($this->time));
    $this->endtime=htmlspecialchars(strip_tags($this->endtime));


    // bind values
    $stmt->bind_param('isss', $this->user_id, $this->description, $this->time, $this->endtime);

    // execute query
    $stmt->execute();

   

    $this->conn->commit();
    return true;

    } catch (mysqli_sql_exception $exception) {

        return false;
    }
}



}

?>
