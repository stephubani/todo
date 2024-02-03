<?php
error_reporting(E_ALL);
require_once "../classes/Todo.php";

if(isset($_GET['id'])){
    $todo_id = $_GET['id'];

    $todo = new Todo();
    $response = $todo->completed($todo_id);

    if($response){
        $status = $todo->displayStatus();
        echo $status;
    }
    
}
