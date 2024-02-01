<?php
error_reporting(E_ALL);
session_start();
require_once('../classes/Todo.php');

if($_POST && isset($_POST['add_task'])){
    $name = $_POST['task'];
    $task_desc = $_POST['task_desc'];

    if(!empty($name )&&  !empty($task_desc )){
        $todo = new Todo();
        $todo->create($name);
       
    }else{
        echo "Please you need to input all fields";
    }
}

if($_POST && isset($_POST['edit_task'])){
    $name = $_POST['task_edited'];
    $todo_id  =   $_SESSION['todo_id'];

    if(!empty($name) && !empty($todo_id)){
        $todo = new Todo();
        $response =   $todo->update($todo_id ,$name);

        if($response){
            header('location:../index.php');
            exit();
        }
    }else{
        echo 'All fields are neccessary for this update';
    }

    
}

?>