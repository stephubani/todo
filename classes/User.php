<?php
error_reporting(E_ALL);
require_once "Db.php";



class User {
    public  int $id;
    public  string $name;
    public  bool $is_active;

    public static $dbconn;

    public static function linkPropertiesToDatabase($user){
       
    }

    private static function connectDatabase(){
        self::$dbconn = (new Db())->conn;
    }

    public static function checkIfUserExists($name){
        self::connectDatabase();
        $sql = 'SELECT * FROM users WHERE name =?';
        $statement= self::$dbconn->prepare($sql);
        $statement->execute([$name]);
        $user_name = $statement->fetch(PDO::FETCH_ASSOC);
        
        return $user_name ? $user_name : false;
    }

    public static function create($name){
        self::connectDatabase();
        $sql = 'INSERT INTO users(name) VALUES(?)';
        $statement = self::$dbconn->prepare($sql);
        $response = $statement->execute([$name]);
        if($response){
            return self::$dbconn->lastInsertId();
        }else{
            return false;
        }
    }

    public static function getUserById($id){
        self::connectDatabase();
        $sql= 'SELECT * FROM users WHERE id = ?';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute([$id]);
        $user_details = $statement->fetchAll(PDO::FETCH_ASSOC);

        return $user_details ? $user_details :  false;
    }

    public  static function getAllUser(){
        self::connectDatabase();
        $sql = 'SELECT * FROM users ORDER BY id DESC';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute();
        $allusers = $statement->fetchAll(PDO::FETCH_ASSOC);

        $users = [];
        if($allusers){
            foreach($allusers as $user){
                $a_user = new User();
                $a_user->id = $user['id'];
                $a_user->name = $user['name'];
                $a_user->is_active = $user['is_active'];
                $users[] = $a_user;
            }
            return $users;
           
        }else{
            return [];
        }

    }
    
    public  function update($name, $id){
        $sql = 'UPDATE users SET name=? WHERE id=?';
        $statement = self::$dbconn->prepare($sql);
        $response = $statement->execute([$name, $id]);

        return $response ? true : false;

    }

    public function activateUser(){

    }
    public function deactivateUser(){
        
    }
}