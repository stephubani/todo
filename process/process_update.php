<?php
error_reporting(E_ALL);
require_once "../classes/Todo.php";


if (isset($_GET['id'])) {
    $todo_id = $_GET['id'];

    $todo = new Todo();
    $isCompleted = $todo->markAsCompleted($todo_id);

    if ($isCompleted) {
        $responseTodo = $todo->findById($todo_id);
        echo json_encode($responseTodo);
    }
}


