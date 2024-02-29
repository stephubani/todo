<?php
error_reporting(E_ALL);

require_once "../classes/Todo.php";




if (isset($_GET['id'])) {
    $todo_id = $_GET['id'];

    $todo = Todo::findById($todo_id);
   
    
    $isCompleted = $todo->markAsCompleted();

    if ($isCompleted) {
        $response = ['success' => true , 'data'=>$todo, 'message' => 'Marked Successfully'];
       
        echo json_encode($response);
    }else{
        $error = "We Couldnt Mark This To-Do At The Moment";
        $response = ['success '=> false , 'error'=> $error];
        echo json_encode($response);
    }
}


