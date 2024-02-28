<?php

require_once 'Db.php';



class Todo{
   
    public $id;
    public $name;
    public $is_completed;
    public $created_at;
    public $updated_at;
    public $completed_at;

    private static $dbconn;

    public function __construct($data)
    {
        $this->id=$data['id'] ?? null;
        $this->name = $data['name'];
        $this->created_at = $data['created_at'] ?? null;
        $this->is_completed = $data['is_completed'] ?? null;
        $this->updated_at = $data['updated_at'] ?? null;
        $this->completed_at = $data['completed_at'] ?? null;
      
    }

    public static function setDbConnection(){
        self::$dbconn = (new Db())->conn;
    }

    public static function doesTodoNameExist($name){
        try{
            self::setDbConnection();
            $sql = 'SELECT * FROM todo WHERE name=?';
            $statement =  self::$dbconn->prepare($sql);
            $statement->execute([$name]);
            $todo_name =$statement->fetchAll(PDO:: FETCH_ASSOC);

            return $todo_name ? true : false;

        }catch(PDOException $e){
            echo  $e->getMessage();
            exit();
              
        }
    }

    public static function create($name){
        try{
            self::setDbConnection();
            $date_format = date('Y-m-d h:i:s');
            $sql = 'INSERT INTO todo(name, created_at) VALUES(?,?)';
            $statement = self::$dbconn->prepare($sql);
            $response=   $statement->execute([$name, $date_format]);
            if($response){
                return self::findById(self::$dbconn->lastInsertId()); 
            }else{
                return false;
            }
            
        }catch(PDOException $e){
            echo  $e->getMessage();
            exit();
        }

    }

    public static function findAll(){
        self::setDbConnection();
        $sql = 'SELECT * FROM todo ORDER BY id DESC';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute();
        $all_todo =$statement->fetchAll(PDO::FETCH_ASSOC);
        // $all_todo =$statement->fetchAll(PDO::FETCH_CLASS,'Todo');
        $todos = [];
        if($all_todo){
            foreach($all_todo as $todo){
                $a_todo = new Todo($todo);
                $todos[] = $a_todo;
            }
            
        }
        return $todos;

    }

    public static function findById($id){
        self::setDbConnection();
        $sql = 'SELECT * FROM todo WHERE id = ?';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute([$id]);
        $todo = $statement->fetch( PDO::FETCH_ASSOC);
        if($todo){
            $a_todo = new Todo($todo);
            return $a_todo;
        }
        return null;
    }

    public function update($name ){
        try{
            self::setDbConnection();
            $date_updated = date('Y-m-d h:i:s');
            $sql = "UPDATE todo SET name=?, updated_at=? WHERE id=?";
            $statement = self::$dbconn->prepare($sql);
            $statement->execute([$name ,$date_updated, $this->id]);
            return true;

        }catch(PDOException $e){
           $_SESSION['error_message']= "To do already exists";
           return false;
        }
       
       
    }

    public function markAsCompleted(){
        self::setDbConnection();
        $this->completed_at= date('Y-m-d h:i:s');
        $this->is_completed = 1;
        $sql = "UPDATE todo SET completed_at=? ,is_completed = 1 WHERE id=?";
        $statement = self::$dbconn->prepare($sql);
        $updated = $statement->execute([$this->completed_at, $this->id]);
        
        return $updated;
    }

    public function delete(){
        self::setDbConnection();
        $sql = "DELETE FROM todo WHERE id=?";
        $statement = self::$dbconn->prepare($sql);
        $deleted = $statement->execute([$this->id]);
        
        return $deleted ? true : false;
    } 

    public function displayStatus(){
        return $this->is_completed == 0 ? "Not Completed" : "Completed" ;
}
    
}
