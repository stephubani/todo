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
    <link href='assets/fa/css/all.min.css' rel='stylesheet'>
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
                    <th>Completed</th>
                    <th>Edit</th>
                    <th>Delete</th>
                    <tbody>
                            <?php
                                foreach($all_todo as $todo ){
                            ?>
                                 <tr>
                                <input type="hidden" name="todo_id" value="<?php echo $todo['id']?>">
                                <td name='todo_name'><?php echo $todo['name']?></td>
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
                                <td>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                        <label class="form-check-label" for="flexCheckDefault">
                                            
                                        </label>
                                    </div>
                                </td>
                                <td>
                                    <a href="create.php?id=<?php echo $todo['id']?>">
                                        <button type="submit" name="edit_todo">
                                        <i class="fa-solid fa-pen"></i>
                                    </button> 
                                    </a>
                                   
                                </td>
                                <td><button type="submit" name="delete_btn" class="btn"><i class="fa fa-trash text-danger"></i></button></td>
                               
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