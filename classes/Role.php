<?php
require_once 'Db.php';

class Role
{
    public int $roles_id;
    public string $roles_name ;
    public bool $roles_isActive;

    public static  $dbconn;

    public static function connectDatabase()
    {
        self::$dbconn = (new Db())->conn;
        
    }

    public  function linkPropertiesToDatabase(){
        if(!isset($this->roles_id)){
            $sql = 'INSERT INTO roles(roles_name , roles_isActive) VALUES(?,?)';
            $statement = self::$dbconn->prepare($sql);
            $response = $statement->execute([$this->roles_name , (int)$this->roles_isActive]);
            if($response){
                $this->roles_id = self::$dbconn->lastInsertId();
                return $this->roles_id;

            }else{
                return false;
            }
        }else{
            $sql = 'UPDATE roles SET roles_name=? , roles_isActive=? WHERE roles_id=?';
            $statement = self::$dbconn->prepare($sql);
            $response = $statement->execute([$this->roles_name, (int)$this->roles_isActive , $this->roles_id]);

            return $response ? true : false;
        }
    }

    
    public static function checkIfRoleExists($name , $id = null){
        self::connectDatabase();
        $sql = 'SELECT * FROM roles WHERE roles_name =?';
        $params = [$name];
        if($id){
            $sql .= ' AND roles_id != ?';
            $params[] = $id;
        }
        $statement= self::$dbconn->prepare($sql);
        $statement->execute($params);
        $roles_name = $statement->fetch(PDO::FETCH_ASSOC);
        
        return $roles_name ? $roles_name : false;
    }

    public static function create( $roles_name)
    {
        $roles = new Role();
        $roles->roles_name = $roles_name;
        $roles->roles_isActive = 0;
        self::connectDatabase();
        return $roles->linkPropertiesToDatabase();
    }

    public function update($roles_name)
    {

        $this->roles_name = $roles_name;
        self::connectDatabase();
        return $this->linkPropertiesToDatabase();
        
    }

    public function delete()
    {
        self::connectDatabase();
        $sql = 'DELETE  FROM roles WHERE roles_id=?';
        $statement = self::$dbconn->prepare($sql);
        $response = $statement->execute([$this->roles_id]);

        return $response ? true : false ;
    }

    public static function getAllRoles()
    {
        self::connectDatabase();
        $sql = 'SELECT * FROM roles ORDER BY roles_id DESC';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute();
        $allRoles = $statement->fetchAll(PDO::FETCH_ASSOC);


        $roles = [];
        if($allRoles){
            foreach($allRoles as $a_role){
                $role = new Role();
                $role->roles_id = $a_role['roles_id'];
                $role->roles_name = $a_role['roles_name'];
                $role->roles_isActive = $a_role['roles_isActive'];

                $roles[] = $role;
            }
            return $roles;
        }
        

        return [];
    }

    public static function getRolesById($id)
    {
        self::connectDatabase();
        $sql = 'SELECT * FROM roles WHERE roles_id = ?';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute([$id]);
        $a_role = $statement->fetch(PDO::FETCH_ASSOC);
        
       if($a_role){
            $role = new Role();
            $role->roles_id = $a_role['roles_id'];
            $role->roles_name = $a_role['roles_name'];
            $role->roles_isActive = $a_role['roles_isActive'];

            return $role;
       }
       return null;
    }

    public function UserStatus(){
        self::connectDatabase();
        $this->roles_isActive = ($this->roles_isActive == 0) ? 1 : 0;
        return $this->linkPropertiesToDatabase();

    }

    public function displayStatusOfRoles(){
        return $this->roles_isActive == 0 ? 'Unactive' : 'Active';
    }

    public static function selectAllActiveRoles(){
        self::connectDatabase();
        $sql = 'SELECT * FROM roles WHERE roles_isActive = 1';
        $statement = self::$dbconn->prepare($sql);
        $statement->execute();
        $activeRole = $statement->fetchAll(PDO::FETCH_ASSOC);

        $allActiveRole = [];
        if($activeRole){
            foreach($activeRole as $role){
                $an_Activerole = new Role();
                $an_Activerole->roles_id = $role['roles_id'];
                $an_Activerole->roles_name = $role['roles_name'];
                $an_Activerole->roles_isActive = $role['roles_isActive'];
                $allActiveRole[] = $an_Activerole;
            }
            return $allActiveRole;
        }else{
            return $allActiveRole = [];
        }

    }

    
}