<?php
require_once 'Db.php';

class Todo extends Db{
    public $dbconn ;

    public function __construct()
    {
        $this->dbconn = $this->connect();
    }

    public function create($name){
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

    public function find_All(){
        $sql = 'SELECT * FROM todo ORDER BY created_at DESC';
        $statement = $this->dbconn->prepare($sql);
        $statement->execute();
        $all_todo =$statement->fetchAll(PDO:: FETCH_ASSOC);
        if($all_todo){
            return $all_todo;

        }else{
            return false;
        }

    }

    public function find_byId($id){
        $sql = 'SELECT * FROM todo WHERE id = ?';
        $statement = $this->dbconn->prepare($sql);
        $statement->execute([$id]);
        $todo = $statement->fetch( PDO :: FETCH_ASSOC);
        if($todo){
            return $todo;
        }


    }
    public function update($id , $name ){
        $sql = "UPDATE todo SET name=? WHERE id=?";
        $statement = $this->dbconn->prepare($sql);
        $updated = $statement->execute([$name , $id]);
        if($updated){
            return true;
        }else{
            return false;
        }


    }

    public function completed($id){
        $date_completed = date('Y-m-d h:i:s');
        $sql = "UPDATE todo SET completed_at=? WHERE id=?";
        $statement = $this->dbconn->prepare($sql);
        $updated = $statement->execute([$date_completed, $id]);
        if($updated){
            $sql = 'UPDATE todo set is_completed= 1 WHERE id=?';
            $statement = $this->dbconn->prepare($sql);
            $response  =  $statement->execute([$id]);
            if($response){
                return true ;

            }else{
                return false;
            }

        }else{
            return false;
        }
    }

    

    
}


?>