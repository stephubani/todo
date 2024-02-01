<?php
require_once 'Db.php';

class Todo extends Db{
    public $name;
    public $is_completed;
    public $created_at;
    public $updated_at;
    public $completed_at;
    public $dbconn ;

    public function __construct()
    {
        $this->dbconn = $this->connect();
    }

    public function create($name){
        try{
            $sql = 'SELECT * FROM todo WHERE name=?';
            $statement = $this->dbconn->prepare($sql);
            $statement->execute([$name]);
            $response =$statement->fetchAll(PDO:: FETCH_ASSOC);

            if($response== true){
                header('location:../create.php');
                $_SESSION['error_message'] = 'Please a todo name should be unique';
            }else{
                $date_format = date('Y-m-d h:i:s');
                $sql = 'INSERT INTO todo(name, created_at) VALUES(?,?)';
                $statement = $this->dbconn->prepare($sql);
                $response =   $statement->execute([$name, $date_format]);
                if($response){
                    return $this->dbconn->lastInsertId();
                }else{
                    return 0;
                }
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
        $date_updated = date('Y-m-d h:i:s');
        $sql = "UPDATE todo SET name=?, updated_at=? WHERE id=?";
        $statement = $this->dbconn->prepare($sql);
        $updated = $statement->execute([$name ,$date_updated, $id]);
        if($updated){
            return true;
        }else{
            return false;
        }


    }

    public function completed($id){
        $date_completed = date('Y-m-d h:i:s');
        $sql = "UPDATE todo SET completed_at=? ,is_completed = 1 WHERE id=?";
        $statement = $this->dbconn->prepare($sql);
        $updated = $statement->execute([$date_completed, $id]);
        if($updated){
           return true ;
        }else{
                return false;
        }
    }

    public function delete($id){
        $sql = "DELETE FROM todo WHERE id=?";
        $statement = $this->dbconn->prepare($sql);
        $deleted = $statement->execute([$id]);
        if($deleted){
            return true;
        }else{
            return false;
        }
    } 
}


?>