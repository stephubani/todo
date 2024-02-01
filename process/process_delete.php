<?php
error_reporting(E_ALL);
require_once "../classes/Todo.php";

if(isset($_GET['id'])){
    $todo_id = $_GET['id'];
    $todo = new Todo();
    $response =   $todo->delete($todo_id);

    if($response){
        header('location:../index.php');
        exit();
    }

}


?>