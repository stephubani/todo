<?php
require_once 'Db.php';

class Task extends Db{
    public $dbconn ;

    public function __construct()
    {
        $this->dbconn = $this->connect();
    }

    public function insert_task($name){
        try{
            $date_format = date('Y-m-d h:i:s');
            $sql = 'INSERT INTO todo(name, created_at) VALUES(?,?)';
            $statement = $this->dbconn->prepare($sql);
            $response =   $statement->execute([$name, $date_format]);
            if($response){
                return true;
            }else{
                return false;
            }
        }catch(PDOException $e){
            $e->getMessage();
        }
      

    }

    
}


?>