<?php
error_reporting(E_ALL);
session_start();
require_once('../classes/Todo.php');

if(isset($_GET['name'])){
    $name = $_GET['name'];
    
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if(!empty($name )){
        $todo = new Todo();
        $todoNameExists =  $todo->doesTodoNameExist($name);

        if(!$todoNameExists){
            if(!empty($id)){
                $todo->update($id,$name);
            }else{
                $id = $todo->create($name);  
            }

            $todo_data = $todo->findById($id);
            $response = ['success'=> true, 'data'=>$todo_data];
            echo json_encode($response);
            exit();
        }else{
           $error = 'To-Do Name Must Be Unique';
           
        }
        
       
    }else{
        $error = 'All fiels must be filled';
    }
    $response = ['success' => false , 'error' => $error];
    echo json_encode($response);
}

