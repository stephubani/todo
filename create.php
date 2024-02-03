<?php
error_reporting(E_ALL);
require_once('classes/Todo.php');
session_start();

if(isset($_GET['id'])){
    $todo = new Todo();
    $todo = $todo->findById($_GET['id']);
    $name = $todo->name;
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
                <?php
                if(isset($_SESSION['error_message'])){
                    echo "<div class='alert alert-danger'>".$_SESSION['error_message']."</div>";
                    unset($_SESSION['error_message']);
                }
                ?>
              <h1>Today</h1>  
            </div>
            <div class="col-md-6 m-auto">
                <form action="process/process_create.php" method="post">
                    <label for="todo">Add New Task</label>
                    <?php
                        if(isset($_GET['id'])){
                            echo "<input type='text' class='form-control mb-3' name='task_edited' id='todo' value='$name'>";
                            echo "<input type='hidden' class='form-control mb-3' name='todo_id' id='todo' value='$todo->id'>";

                        }else{
                            echo "<input type='text' class='form-control mb-3' name='task' id='todo'>";
                        }
                    ?>
                   
                    <?php
                        if(isset($_GET['id'])){
                            echo "<button type='submit' class='btn btn-primary' name='edit_task'>Edit Task</button>";
                        }else{
                            echo ' <button type="submit" class="btn btn-primary" name="add_task">Add Task</button>';
                        }
                    ?>
                </form>
            </div>
        </div>
    </center>
        
    </div>
   
</body>
</html>