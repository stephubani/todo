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
        $user = new User();
        $user->name = $name;
        $user->is_active = 0;
        self::connectDatabase();
        $sql = 'INSERT INTO users(name , is_active) VALUES(?,?)';
        $statement = self::$dbconn->prepare($sql);
        $response = $statement->execute([$user->name , $user->is_active]);
        if($response){
            return $user->id = self::$dbconn->lastInsertId();
        }else{
            return false;
        }
    }
   

    public static function getUserById($id){
        self::connectDatabase();
        $sql= 'SELECT * FROM users WHERE id = ?';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute([$id]);
        $a_user = $statement->fetchAll(PDO::FETCH_ASSOC);

    

        if($a_user){
            $user = new User();
            $user->id = $a_user[0]['id'];
            $user->name = $a_user[0]['name'];
            $user->is_active = $a_user[0]['is_active'];

            return $user;

        }
        return null;

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
    
    public  function update($name){
        $this->name = $name;
        $sql = 'UPDATE users SET name=? WHERE id=?';
        $statement = self::$dbconn->prepare($sql);
        $response = $statement->execute([$this->name, $this->id]);

        return $response ? true : false;

    }

    public function activateUser(){
        $this->is_active = 1;
        self::connectDatabase();
        $sql = 'UPDATE users SET is_active = 1 WHERE id=?';
        $statement = self::$dbconn->prepare($sql);
        $response = $statement->execute([$this->id]);

        return $response ? true : false;
    }
    public function deactivateUser(){
        $this->is_active = 0;
        self::connectDatabase();
        $sql = 'UPDATE users SET is_active = 0 WHERE id=?';
        $statement = self::$dbconn->prepare($sql);
        $response = $statement->execute([$this->id]);

        return $response ? true : false;
    }

    public static function selectAllActiveUsers(){
        self::connectDatabase();
        $sql = 'SELECT * FROM users WHERE is_active = 1';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute();
        $active_users = $statement->fetchAll(PDO::FETCH_ASSOC);

        $allActiveUsers = [];
        if($active_users){
            foreach($active_users as $users){
                $an_ActiveUser = new User();
                $an_ActiveUser->id = $users['id'];
                $an_ActiveUser->name = $users['name'];
                $an_ActiveUser->is_active = $users['is_active'];

                $allActiveUsers[] = $an_ActiveUser;
            }
            return $allActiveUsers;
        }else{
            return [];
        }
        
    }

    public function displayStatusOfUser(){
        return $this->is_active == 0 ? 'Unactive' : 'Active';
    }
}