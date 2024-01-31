<?php
error_reporting(E_ALL);
require_once '../classes/Todo.php';

if($_POST && isset($_POST['edit_todo'])){
    $todo_name = $_POST['todo_name'];
    $todo_id = $_POST['todo_id'];

    echo "to do name is $todo_name and yoour id is $todo_id";
}


?>