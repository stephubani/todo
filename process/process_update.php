<?php
error_reporting(E_ALL);
require_once "../classes/Todo.php";


if (isset($_GET['id'])) {
    $todo_id = $_GET['id'];

    $todo = new Todo();
    $isCompleted = $todo->markAsCompleted($todo_id);

    if ($isCompleted) {
        $responseTodo = $todo->findById($todo_id);
        $response = ['success' => true , 'data'=>$responseTodo, 'message' => 'Marked Successfully'];
       
        echo json_encode($response);
    }else{
        $error = "We Couldnt Mark This To-Do At The Moment";
        $response = ['sucess '=> false , 'error'=> $error];
        echo json_encode($response);
    }
}


