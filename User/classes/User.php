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

    public static function connectDatabase(){
        self::$dbconn = (new Db())->conn;
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

    public function getUserById(){
        self::connectDatabase();
        $sql= '';
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
           
        }

    }
    
    public function update(){

    }

    public function activateUser(){

    }
    public function deactivateUser(){
        
    }
}