<?php
error_reporting(E_ALL);
session_start();
require_once('../classes/Todo.php');


if(isset($_GET['name'])){
    $name = $_GET['name'];
    $user_id = $_GET['user_id'];
    $username = $_GET['username'];

   
    
    $id = isset($_GET['id']) ? $_GET['id'] : '';

    if(!empty($user_id)){
        if(!empty($name )){
       
            $todoNameExists =  Todo::doesTodoNameExist($name , $id);
            

            if(!$todoNameExists){

                if(!empty($id)){
                    
                    $todo = Todo::findById($id);
                    $todo->update($name , $user_id , $username);
                    
                }else{
                
                    $todo = Todo::create($name, $user_id );
                    
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
    }else{
        $error = 'An Active User Must Be Available To Perform This Action';
    }
  
    $response = ['success' => false , 'error' => $error];
    echo json_encode($response);
}

