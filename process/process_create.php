<?php
error_reporting(E_ALL);
session_start();
require_once('../classes/Todo.php');

if($_POST && isset($_POST['add_task'])){
    $name = $_POST['task'];

    if(!empty($name )){
        $todo = new Todo();
        $todoNameExists =  $todo->doesTodoNameExist($name);

        if(!$todoNameExists){
            $response = $todo->create($name);
            if($response){
                header('location:../index.php');
                exit();
            }
        }else{
            $_SESSION['name'] = $name;
            $_SESSION['error_message'] = 'Todo name must be unique';
            header("location:../create.php");
            exit();
           
        }
        $_SESSION['error_message'];
       
    }else{
        echo "Please you need to input all fields";
    }
}

if($_POST && isset($_POST['edit_task'])){
    $name = $_POST['task_edited'];
    $todo_id  = $_POST['todo_id'];

    if(!empty($name) && !empty($todo_id)){
        $todo = new Todo();
        $response =   $todo->update($todo_id ,$name);

        if($response){
            header('location:../index.php');
            exit();
        }
        header("location: ../create.php?id=$todo_id");
        exit();
        
    }
    $_SESSION['error_message'] = 'All fields are neccessary';
    header('location: ../create.php');
    exit();
}
