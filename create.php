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
                    <input type="text" class="form-control mb-3" name="task" id="">

                    <label for="todo">Start Date</label>
                    <input type="date" class="form-control" name="date_created" id="">

                    <label for="todo">Estimated Completion Date</label>
                    <input type="date" class="form-control" name="date_completed" id="">


                    <label for="todo">Description</label>
                    <textarea name="task_desc" class="form-control mb-3" id="" cols="30" rows="10"></textarea>

                    <button type="submit" class="btn btn-primary" name="add_task">Add Task</button>


                </form>
            </div>
        </div>
    </center>
        
    </div>
   
</body>
</html>