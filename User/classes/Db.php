<?php
require_once "config.php";

class Db{
    private $dbhost = DBHOST;
    private $dbname = DBNAME;
    private $dbuser = DBUSER;
    private $dbpass = DBPASS;

    public $conn ;

    public function __construct()
    {
        $dsn = "mysql:host=$this->dbhost;dbname=$this->dbname;";

        $option = [
            PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION
        ];
        $this->conn = new PDO($dsn, $this->dbuser,$this->dbpass,$option);
    }
    protected function connect(){
       
    }

}

?>

