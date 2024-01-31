<?php
error_reporting(E_ALL);
require_once "classes/Todo.php";
$todo = new Todo();
$all_todo = $todo->fetch_todo();

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
    <title>Document</title>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md">
                <h1>Welcome To TODO</h1>
                <p>A website made for an easier well planned life</p>
            </div>
        </div>

        <div class="row">
            <div class="col-md">
                <table class="table table-striped">
                    <th>Name</th>
                    <th>Status</th>
                    <th>Date Created</th>
                    <th>Date Completed</th>
                    <tbody>
                            <?php
                                foreach($all_todo as $todo ){
                            ?>
                            <tr>
                                <td><?php echo $todo['name']?></td>
                                <td>
                                <?php
                                if( $todo['is_completed'] == 2){
                                    echo "Not Completed";
                                }else{
                                    echo " Completed";
                                }
                                ?>
                                </td>
                                <td><?php echo $todo['created_at']?></td>
                                <td><?php echo $todo['completed_at']?></td>
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