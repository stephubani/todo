<?php
error_reporting(E_ALL);
require_once "Db.php";
require_once 'Role.php';



class User {
    public  int $users_id;
    public  string $users_name;
    public $users_email;
    public $users_password;
    public  bool $is_active;
    public $roles_id;

    public $role;

    public static $dbconn;

    public  function linkPropertiesToDatabase(){
       if(!isset($this->users_id)){
            $sql = 'INSERT INTO users(users_name , is_active , roles_id , users_email) VALUES(?,?,?,?)';
            $statement = self::$dbconn->prepare($sql);
            $response = $statement->execute([$this->users_name , (int)$this->is_active , $this->roles_id , $this->users_email]);
            if($response){
                $this->users_id = self::$dbconn->lastInsertId();
                return $this->users_id;

            }else{
                return false;
            }
        }else{
            $sql = 'UPDATE users SET users_name=? , is_active=? , roles_id=? , users_email=? WHERE users_id=?';
            $statement = self::$dbconn->prepare($sql);
            $response = $statement->execute([$this->users_name, (int)$this->is_active , $this->roles_id, $this->users_email, $this->users_id  ]);

            return $response ? true : false;
        }
    }

    private static function connectDatabase(){
        self::$dbconn = (new Db())->conn;
    }

    public  static function Login($users_email){
        self::connectDatabase();
        $sql = 'SELECT * FROM users WHERE users_email=?';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute([$users_email ]);    
        $a_user = $statement->fetchAll(PDO::FETCH_ASSOC);
       
            if($a_user){
                $user = new User();
                $user->users_id = $a_user[0]['users_id'];
                $user->users_name = $a_user[0]['users_name'];
                $user->users_email = $a_user[0]['users_email'];
                $user->is_active = $a_user[0]['is_active'];
                $user->roles_id = $a_user[0]['roles_id'];
                $user->role = Role::getRolesById($a_user[0]['roles_id']);
    
                return $user;
    
            }
            return null;
      
    }

    public static function checkIfUserExists($name , $id = null){
        self::connectDatabase();
        $sql = 'SELECT * FROM users WHERE users_name =?';
        $params = [$name];
        if($id){
            $sql .= ' AND users_id != ?';
            $params[] = $id;
        }
        $statement= self::$dbconn->prepare($sql);
        $statement->execute($params);
        $user_name = $statement->fetch(PDO::FETCH_ASSOC);
        
        return $user_name ? $user_name : false;
    }

    public static function create($name , $role_id ,$email){
        $user = new User();
        $user->users_name = $name;
        $user->users_email = $email;
        $user->is_active = 0;
        $user->roles_id = $role_id;
        self::connectDatabase();
        return $user->linkPropertiesToDatabase();
    }
   

    public static function getUserById($id){
        self::connectDatabase();
        $sql= 'SELECT * FROM users WHERE users_id = ?';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute([$id]);
        $a_user = $statement->fetchAll(PDO::FETCH_ASSOC);

    

        if($a_user){
            $user = new User();
            $user->users_id = $a_user[0]['users_id'];
            $user->users_name = $a_user[0]['users_name'];
            $user->users_email = $a_user[0]['users_email'];
            $user->is_active = $a_user[0]['is_active'];
            $user->roles_id = $a_user[0]['roles_id'];
            $user->role = Role::getRolesById($a_user[0]['roles_id']);

            return $user;

        }
        return null;

    }

    public  static function getAllUser(){
        self::connectDatabase();
        $sql = 'SELECT * FROM users ORDER BY users_id DESC';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute();
        $allusers = $statement->fetchAll(PDO::FETCH_ASSOC);

        $users = [];
        if($allusers){
            foreach($allusers as $user){
                $a_user = new User();
                $a_user->users_id = $user['users_id'];
                $a_user->users_name = $user['users_name'];
                $a_user->is_active = $user['is_active'];
                $a_user->roles_id = $user['roles_id'];
                $a_user->role = Role::getRolesById($user['roles_id']);
                $users[] = $a_user;
            }
            return $users;
           
        }else{
            return [];
        }

    }
    
    public  function update($name , $roles_id , $email){
      $this->users_name = $name;
      $this->users_email = $email;
      $this->is_active = false;
      $this->roles_id = $roles_id;
      $this->role = Role::getRolesById($this->roles_id);
        return $this->linkPropertiesToDatabase();
    }


    public function UserStatus(){
        self::connectDatabase();
        $this->is_active = ($this->is_active == 0) ? 1 : 0;
        return $this->linkPropertiesToDatabase();
       

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
                $an_ActiveUser->users_id = $users['users_id'];
                $an_ActiveUser->users_name = $users['users_name'];
                $an_ActiveUser->users_email = $users['users_email'];
                $an_ActiveUser->is_active = $users['is_active'];
                $allActiveUsers[] = $an_ActiveUser;
            }
            return $allActiveUsers;
        }else{
            return $active_users = [];
        }
        
    }

    public function deleteUser(){
        self::connectDatabase();
        $sql = 'DELETE  FROM users WHERE users_id=?';
        $statement = self::$dbconn->prepare($sql);
        $response = $statement->execute([$this->users_id]);

        return $response ? true : false ;
    }

    public function displayStatusOfUser(){
        return $this->is_active == 0 ? 'Unactive' : 'Active';
    }   
}