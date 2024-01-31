<?php
error_reporting(E_ALL);
session_start();
require_once('../classes/Todo.php');

if($_POST && isset($_POST['add_task'])){
    $name = $_POST['task'];
    $date_added = $_POST['date_created'];
    $date_completed = $_POST['date_completed'];
    $task_desc = $_POST['task_desc'];

    if(!empty($name )&& !empty($date_added )&& !empty($date_completed ) && !empty($task_desc )){
        $todo = new Todo();
        $todo->insert_todo($name);
       
    }else{
        echo "Please you need to input all fields";
    }
}

if($_POST && isset($_POST['edit_task'])){
    $name = $_POST['task_edited'];
    $todo_id  =   $_SESSION['todo_id'];

    $todo = new Todo();
    $response =   $todo->update_todo($todo_id ,$name);

    if($response){
        header('location:../index.php');
        exit();
    }
}

?>