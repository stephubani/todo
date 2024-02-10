<?php
error_reporting(E_ALL);
require_once "../classes/Todo.php";

if(isset($_GET['id'])){
    $todo_id = $_GET['id'];
    $todo = new Todo();
    $response =   $todo->delete($todo_id);

    if($response){
        $success_message = 'Todo Deleted Successfully' ;
        $response = ['success' => true , 'data' => $success_message];
        echo json_encode($response);
        exit();
       
      
    }else{
        $error_message = 'Unable To Delete This To-Do At The Moment';
        $response = ['success' => false , 'data' => $error_message];
        echo json_encode($response);
    }

}
