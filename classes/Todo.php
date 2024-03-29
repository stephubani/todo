<?php

require_once 'Db.php';
require_once 'User.php';



class Todo{
   
    public $id;
    public $name;
    public $is_completed;
    public $created_at;
    public $updated_at;
    public $completed_at;
    public $users_id ;

    public $user ;

    private static $dbconn;

    public function __construct($data)
    {
        $this->id=$data['id'] ?? null;
        $this->name = $data['name'];
        $this->created_at = $data['created_at'] ?? null;
        $this->is_completed = $data['is_completed'] ?? null;
        $this->updated_at = $data['updated_at'] ?? null;
        $this->completed_at = $data['completed_at'] ?? null;
        $this->users_id = $data['users_id']?? null ; 
       
        
      
    }

    public static function setDbConnection(){
        self::$dbconn = (new Db())->conn;
    }

    public static function doesTodoNameExist($name , $id = null){
        try{
            self::setDbConnection();
            $sql = 'SELECT * FROM todo WHERE name=?';
            $params = [$name];
            if($id){
                $sql .= ' AND id != ?';
                $params[] = $id;
            }
            $statement =  self::$dbconn->prepare($sql);
            $statement->execute($params);
            $todo_name =$statement->fetchAll(PDO:: FETCH_ASSOC);

            return $todo_name ? true : false;

        }catch(PDOException $e){
            echo  $e->getMessage();
            exit();
              
        }
    }

    public static function create($name , $users_id){
        try{
            self::setDbConnection();
            $date_format = date('Y-m-d h:i:s');
            $sql = 'INSERT INTO todo(name, created_at , users_id ) VALUES(?,?,?)';
            $statement = self::$dbconn->prepare($sql);
            $response=   $statement->execute([$name, $date_format , $users_id]);
            if($response){
                return self::findById(self::$dbconn->lastInsertId()) ;
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
                $a_todo->user = User::getUserById($todo['users_id']);
                $todos[] = $a_todo;
            
            }
            
        }
        return $todos;

    }

    public static function findById($id){
        self::setDbConnection();
        $sql = 'SELECT * FROM todo  WHERE id = ?';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute([$id]);
        $todo = $statement->fetch( PDO::FETCH_ASSOC);
       
        if($todo){
            $a_todo = new Todo($todo);
            $a_todo->user = User::getUserById($todo['users_id']);
          
            return $a_todo;
        }
        return null;
    }

    public function update($name , $users_id ){
        
        self::setDbConnection();
        $this->name = $name;
        $this->users_id = $users_id;
        $this->updated_at = date('Y-m-d h:i:s');
        $sql = "UPDATE todo SET name=?, updated_at=? , users_id = ? WHERE id=?";
        $statement = self::$dbconn->prepare($sql);
        $statement->execute([$this->name ,$this->updated_at, $this->users_id, $this->id]);
        $this->user = User::getUserById($this->users_id);

        return ;
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
