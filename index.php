<?php
error_reporting(E_ALL);
require_once "classes/Todo.php";
require_once 'classes/User.php';

$all_todo = Todo::findAll();
$active_users = User::selectAllActiveUsers();
?>

<?php require_once 'partials/head.php'?>
        <?php require_once 'partials/nav.php'; ?>
        <div class="row">
            <center> 
                <div class="col-md">
                    <h1>TODO</h1>
                    <p>A website made for an easier well planned life</p>
                </div>
            </center>
            
        </div>

        <div class= 'mb-5'>
            <center>
                <div class="row" id="edit_name">
                    <div class="todo">
                        <div class="col-md-3">
                            <input type="text" name="todo_name" id="todo_name" class="mb-3 form-control" placeholder="To-Do Name">
                            <input type="hidden" name="todo_id" value="" id="atodo_id">
                        </div>
                   
                        <div class="col-md-3 des ">
                            <select name="" class="form-select" id="alluser">
                            
                            </select>
                        </div>
                        <div>
                            <button class="btn btn-primary btn-md" id="saveButton">Add</button>
                        </div>
                        
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
                            <th>User</th>
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
                                <td class="username" id="<?php echo $todo->users_id?>"><?php echo $todo->user?->users_name ?></td>
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
                                        <input type='hidden' value= '<?php echo $todo->id?>' class='todo_id'>
                                        <button class="btn delete_btn" id = 'deleteTodo_<?php echo $todo->id?>'><i class="fa fa-trash text-danger">
                                        </i>
                                        </button>

                                </td>
                               
                            </tr> 
                        <?php } ?>     
                    </tbody>
                </table>

            </div>

        </div>
<?php require_once 'partials/footer.php'?>