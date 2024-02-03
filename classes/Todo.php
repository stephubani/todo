<?php
require_once 'Db.php';

class Todo extends Db{
    public $id;
    public $name;
    public $is_completed;
    public $created_at;
    public $updated_at;
    public $completed_at;

    private $dbconn ;

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

    public function findAll(){
        $sql = 'SELECT * FROM todo ORDER BY id DESC';
        $statement = $this->dbconn->prepare($sql);
        $statement->execute();
        $all_todo =$statement->fetchAll(PDO::FETCH_ASSOC);
        // $all_todo =$statement->fetchAll(PDO::FETCH_CLASS,'Todo');
        $todos = [];
        if($all_todo){
            foreach($all_todo as $todo){
                $a_todo = new Todo();
                $a_todo->id=$todo['id'];
                $a_todo->name = $todo['name'];
                $a_todo->created_at = $todo['created_at'];
                $a_todo->is_completed = $todo['is_completed'];
                $a_todo->updated_at = $todo['updated_at'];
                $a_todo->completed_at = $todo['completed_at'];
                
                $todos[] = $a_todo;
            }
            
        }
        return $todos;

    }

    public function findById($id){
        $sql = 'SELECT * FROM todo WHERE id = ?';
        $statement = $this->dbconn->prepare($sql);
        $statement->execute([$id]);
        $todo = $statement->fetch( PDO::FETCH_ASSOC);
        if($todo){
            $a_todo = new Todo();
            $a_todo->id=$todo['id'];
            $a_todo->name = $todo['name'];
            $a_todo->created_at = $todo['created_at'];
            $a_todo->is_completed = $todo['is_completed'];
            $a_todo->updated_at = $todo['updated_at'];
            $a_todo->completed_at = $todo['completed_at'];
            
            return $a_todo;
        }
        return null;
    }

    public function update($id , $name ){
        try{
            $date_updated = date('Y-m-d h:i:s');
            $sql = "UPDATE todo SET name=?, updated_at=? WHERE id=?";
            $statement = $this->dbconn->prepare($sql);
            $statement->execute([$name ,$date_updated, $id]);
            return true;

        }catch(PDOException $e){
           $_SESSION['error_message']= "To do already exists";
           return false;
        }
       
       
    }

    public function completed($id){
        $date_completed = date('Y-m-d h:i:s');
        $sql = "UPDATE todo SET completed_at=? ,is_completed = 1 WHERE id=?";
        $statement = $this->dbconn->prepare($sql);
        $updated = $statement->execute([$date_completed, $id]);
        
        return $updated ? true : false;
    }

    public function delete($id){
        $sql = "DELETE FROM todo WHERE id=?";
        $statement = $this->dbconn->prepare($sql);
        $deleted = $statement->execute([$id]);
        
        return $deleted ? true : false;
    } 

    public function displayStatus(){
        return $this->is_completed == 0 ? "Not Completed" : "Completed" ;
    }
}
