<?php
error_reporting(E_ALL);
require_once "classes/Todo.php";
$todo = new Todo();
$all_todo = $todo->find_All();
    

// echo "<pre>";
// foreach($all_todo as $todo){
//     echo ($todo['is_completed']);
// }

// echo "</pre>";
// die();



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

        <div class="row">
            <div class="col-md">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Status</th>
                            <th>Date Created</th>
                            <th>Date Completed</th>
                            <th>Completion</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </tr>
                        
                    </thead>
                    
                    <tbody>
                            <?php
                                foreach($all_todo as $todo ){
                            ?>
                                 <tr>
                                <input type="hidden" name="todo_id" value="<?php echo $todo['id']?>">
                                <td name='todo_name'><?php echo $todo['name']?></td>
                                <td>
                                <?php
                                if( $todo['is_completed'] == 0){
                                    echo "Not Completed";
                                }else{
                                    echo " Completed";
                                }
                                ?>
                                </td>
                                <td><?php echo $todo['created_at']?></td>
                                <td><?php echo $todo['completed_at']?></td>

                                <td>
                                    <?php
                                    if($todo['is_completed'] == 0){
                                    ?>
                                    <a href="process/process_update.php?id=<?php echo $todo['id']?>">Mark As Completed</a>
                                    <?php
                                     }
                                    ?>
                                   
                                </td>
                                <td>
                                    <?php
                                        if($todo['is_completed'] == 0){
                                    ?>
                                    <a href="create.php?id=<?php echo $todo['id']?>">
                                        <button type="submit" name="edit_todo">
                                        <i class="fa-solid fa-pen"></i>
                                        </button> 
                                    </a>
                                    <?php
                                    }
                                    ?>
                                </td>
                            
                                <td><a href="process/process_delete.php?id=<?php echo $todo['id']?>"><button type="submit" name="delete_btn" class="btn"><i class="fa fa-trash text-danger"></i></button></a></td>
                               
                            </tr> 
                            <?php
                                }
                            ?>     
                    </tbody>
                </table>

            </div>

        </div>
    </div>
   
</body>
</html>