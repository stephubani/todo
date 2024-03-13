<?php
error_reporting(E_ALL);
session_start();
require_once('../classes/Todo.php');


if(isset($_GET['name'])){
    $name = $_GET['name'];
    $user_id = $_GET['user_id'];
    
    $id = isset($_GET['id']) ? $_GET['id'] : '';

        if(empty($name) || empty($user_id)){
            
            $error = 'All fields must be filled';
        }else{
            $todoNameExists =  Todo::doesTodoNameExist($name , $id);
            

            if($todoNameExists){
                $error = 'To-Do Name Must Be Unique';
            }else{    
                if(!empty($id)){
                    
                    $todo = Todo::findById($id);
                    $todo->update($name , $user_id);
                    
                }else{
                
                    $todo = Todo::create($name, $user_id );
                    
                }
                $response = ['success'=> true, 'data'=>$todo];
                echo json_encode($response);
                exit();
            
            }
            
       
        }
    
  
    $response = ['success' => false , 'error' => $error];
    echo json_encode($response);
}

