<?php
error_reporting(E_ALL);
session_start();
require_once('../classes/Todo.php');


if(isset($_GET['name'])){
    $name = $_GET['name'];
    
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if(!empty($name )){
        $todoNameExists =  Todo::doesTodoNameExist($name);

        if(!$todoNameExists){
            if(!empty($id)){
                $todo = Todo::findById($id);
                $todo->update($name);
            }else{
                $todo = Todo::create($name); 
                
            }
            $response = ['success'=> true, 'data'=>$todo];
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

