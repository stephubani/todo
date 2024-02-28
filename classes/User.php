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
        self::connectDatabase();
        $sql = 'INSERT INTO users(name) VALUES(?)';
        $statement = self::$dbconn->prepare($sql);
        $response = $statement->execute([$user->name]);
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

        // echo '<pre>';
        // print_r($a_user);
        // die();

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

    }
    public function deactivateUser(){
        
    }

    public function displayStatusOfUser(){
        return $this->is_active == 0 ? 'Active' : 'Deactive';
    }
}