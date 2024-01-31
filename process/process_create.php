<?php
error_reporting(E_ALL);
require_once('../classes/Task.php');

if($_POST && isset($_POST['add_task'])){
    $name = $_POST['task'];
    $date_added = $_POST['date_created'];
    $date_completed = $_POST['date_completed'];
    $task_desc = $_POST['task_desc'];

    if(!empty($name )&& !empty($date_added )&& !empty($date_completed ) && !empty($task_desc )){
        $task = new Task();
        $task->insert_task($name);
       
    }else{
        echo "Please you need to input all fields";
    }

   
}

?>