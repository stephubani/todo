<?php
error_reporting(E_ALL);
session_start();
require_once('../classes/Todo.php');

if(isset($_POST['name'])){
    $name = $_POST['name'];

    if(!empty($name )){
        $todo = new Todo();
        $todoNameExists =  $todo->doesTodoNameExist($name);

        if(!$todoNameExists){
            $todo_id = $todo->create($name);
            if($todo_id){
                $todo_data = $todo->findById($todo_id);
                echo json_encode($todo_data);
            }
        }else{
           echo json_encode('To-Do Name Must Be Unique');
           
        }
        
       
    }else{
        echo json_encode('All fiels must be filled');
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
