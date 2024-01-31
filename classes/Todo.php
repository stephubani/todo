<?php
require_once 'Db.php';

class Todo extends Db{
    public $dbconn ;

    public function __construct()
    {
        $this->dbconn = $this->connect();
    }

    public function insert_todo($name){
        try{
            $date_format = date('Y-m-d h:i:s');
            $sql = 'INSERT INTO todo(name, created_at) VALUES(?,?)';
            $statement = $this->dbconn->prepare($sql);
            $response =   $statement->execute([$name, $date_format]);
            if($response){
                return $this->dbconn->lastInsertId();
            }else{
                return false;
            }
        }catch(PDOException $e){
            $e->getMessage();
        }
      

    }

    public function fetch_todo(){
        $sql = 'SELECT * FROM todo';
        $statement = $this->dbconn->prepare($sql);
        $statement->execute();
        $to_do =$statement->fetchAll(PDO:: FETCH_ASSOC);
        if($to_do){
            return $to_do;

        }else{
            return false;
        }

    }

    public function fetch_todo_byId($id){
        $sql = 'SELECT * FROM todo WHERE id = ?';
        $statement = $this->dbconn->prepare($sql);
        $statement->execute([$id]);
        $todo = $statement->fetch( PDO :: FETCH_ASSOC);
        if($todo){
            return $todo;
        }


    }
    public function update_todo($id , $name){
        $sql = "UPDATE todo SET name=? WHERE id=?";
        $statement = $this->dbconn->prepare($sql);
        $updated = $statement->execute([$name , $id]);
        if($updated){
            return true;
        }else{
            return false;
        }


    }

    public function update_toCompleted($id){
        $date_completed = date('Y-m-d h:i:s');
        $sql = "UPDATE todo SET completed_at WHERE id=?";
        $statement = $this->dbconn->prepare($sql);
        $updated = $statement->execute([$date_completed, $id]);
        if($updated){
            return true;
        }else{
            return false;
        }
    }

    

    
}


?>