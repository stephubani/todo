<?php
error_reporting(E_ALL);
require_once "classes\Todo.php";

use className\Todo;
 
$todo = new Todo();
$all_todo = $todo->findAll();
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/style.css">
    <link href='assets/fa/css/all.min.css' rel='stylesheet'>
    <title>Document</title>
</head>
<body>
    <div class="container-fluid">
         <!-- nav bar starts here -->
        <div class="row">
            <div class="col-md ">
                <nav class="navbar navbar-expand-lg  bg-primary ">
                    <div class="container">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                
                                <li class="nav-item">
                                    <a class="nav-link active redesigned" aria-current="page" href="index.php" style="font-size: 15px;">Home</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link active redesigned" aria-current="page" href="create.php" style="font-size: 15px;">Add To Do</a>
                                </li>


                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- nav bar ends here -->
        <div class="row">
            <center>
                <div class="col-md">
                    <h1>Welcome To TODO</h1>
                    <p>A website made for an easier well planned life</p>
                </div>
            </center>
            
        </div>

        <div class= 'mb-5'>
            <center>
                <div class="row" id="edit_name">
                    <div class="col-md">
                        <label for="">To-do Name</label>
                        <input type="text" name="todo_name" id="todo_name" class=" mb-3">
                        <input type="hidden" name="todo_id" value="" id="atodo_id">
                        <button class="btn btn-primary" id="saveButton">Add</button>
                    </div>
                </div>

                <div id="displayMessageContainer" class="col-md-6 ">

                </div>
            </center>
        </div>

        <div class="row">
            <div class="col-md">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Date Created</th>
                            <th>Date Completed</th>
                            <th></th>
                        </tr>
                        
                    </thead>
                   
                    <tbody>
                        <?php foreach($all_todo as $todo ){ ?>
                            <tr class="new_tr" id='<?php echo $todo->id ?>'>
                                <td class='todo_name'><?php echo $todo->name ?></td>
                                <td id="todo_status"><?php echo $todo->displayStatus() ?></td>
                                <td><?php echo $todo->created_at ?></td>
                                <td><?php echo $todo->completed_at ?></td>
                                <td>
                                    <?php if($todo->is_completed == 0){ ?>
                                            <input type="hidden" class="todo_id" name="" value="<?php echo $todo->id ?>">
                                            <button class="btn btn-primary mark_btn">Mark as Completed</button>
                                    <?php } ?>

                                    <?php if($todo->is_completed == 0){ ?>
                                        <button class='btn btn-primary edit_btn' id='editTodo_<?php echo $todo->id ?>'>
                                            <i class="fa-solid fa-pen"></i>
                                        </button>
                                    <?php } ?>
                                    <!-- <a href="process/process_delete.php?id=<?php echo $todo->id ?>"> -->
                                    <input type="hidden" class="todo_id" name="" value="<?php echo $todo->id ?>">
                                    <button class="btn delete_btn" ><i class="fa fa-trash text-danger"></i></button>
                                <!-- </a> -->
                                </td>
                               
                            </tr> 
                        <?php } ?>     
                    </tbody>
                </table>

            </div>

        </div>
    </div>
<script src="jquery.min.js"></script>
<script src="index.js"></script>  
</body>
</html>