<?php
error_reporting(E_ALL);
require_once('classes/Todo.php');
session_start();

if(isset($_GET['id'])){
    $_SESSION['todo_id'] = $_GET['id'];

    $todo = new Todo();
    $all_todo =  $todo->fetch_todo_byId($_SESSION['todo_id']);
    $name = $all_todo['name'];
    // echo '<pre>';
    // print_r($name);
    // echo '</pre>';
    // die();
}


?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/style.css">
    <title>Document</title>
</head>
<body>
    <div class="container-fluid">
    <center>
        <div class="row">
            <div>
              <h1>Today</h1>  
            </div>
            <div class="col-md-6 m-auto">
                <form action="process/process_create.php" method="post">
                    <label for="todo">Add New Task</label>
                    <?php
                        if(isset($_SESSION['todo_id'])){
                            echo "<input type='text' class='form-control mb-3' name='task_edited' id='' value='$name'>";
                        }else{
                            echo "<input type='text' class='form-control mb-3' name='task' id=''>";
                        }
                    ?>
                   

                    <label for="todo">Description</label>
                    <textarea name="task_desc" class="form-control mb-3" id="" cols="30" rows="10"></textarea>
                    <?php
                        if(isset($_SESSION['todo_id'])){
                            echo "<button type='submit' class='btn btn-primary' name='edit_task'>Edit Task</button>";
                        }
                    ?>
                    <button type="submit" class="btn btn-primary" name="add_task">Add Task</button>


                </form>
            </div>
        </div>
    </center>
        
    </div>
   
</body>
</html>