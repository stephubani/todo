<?php
error_reporting(E_ALL);
require_once "classes/User.php";
require_once 'classes/Role.php';


$allUser = User::getAllUser();
;
$activeRole = Role::selectAllActiveRoles();



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
                                    <a class="nav-link active redesigned" aria-current="page" href="user.php" style="font-size: 15px;">Users</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link active redesigned" aria-current="page" href="role.php" style="font-size: 15px;">Roles</a>
                                </li>


                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- nav bar ends here -->
       <div class="row">
            <div class="col-md">
                <center>
                    <div class="col-md-3">
                        <h1>User</h1>
                        <p>Please fill this form to register as a user</p>
                    
                            <input type="text" name="fullname" id="fullname" class="form-control" value="" placeholder="FullName"> 
                            <select name="" id="active_role" class="form-select">
                                <option value="">Select A Role</option>
                                <?php  foreach($activeRole as $role){?>
                                    <option value="<?php echo $role->roles_id?>"><?php echo $role->roles_name?></option>
                                <?php } ?>
                            </select>
                        <input type="hidden" name="user_id" id="userid" value="">

                        <button type="submit" class="btn btn-primary" id="user_button">Register</button>
                    </div>
                </center>
               
            </div>
       </div>

       <div class="row">
            <div class="col-md feedback">

            </div>
       </div>

       <div class="row">
            <div class="col-md">
                <table class="table table-striped">
                    <thead>
                        <th>Roles</th>
                        <th>Name</th>
                        <th>Activate</th>
                        <th>Edit</th>

                    </thead>

                    <tbody id ="table_body">
                        <?php foreach($allUser as $user){ ?>
                        <tr id="<?php echo $user->users_id?>">
                            <td class="roles"><?php echo $user->role?->roles_name?></td>
                            <td class="username"><?php echo $user->users_name?> </td>
                            <td class="is_active"> 
                                 <?php if($user->is_active == 0){
                                ?>
                                    <button class="btn btn-secondary status" id="status_<?php echo $user->users_id?>">
                                        <?php echo $user->displayStatusOfUser()?>
                                    </button>
                                <?php
                                   }else{
                                    echo "<button class='btn btn-primary status' id='status_" . $user->users_id . "'>";
                                    echo $user->displayStatusOfUser();
                                    echo "</button>";
                                }                                
                                ?>

                              
                            </td>
                            <td>  
                                <button class='btn btn-primary edit_btn' id='editUser_<?php echo $user->users_id ?>'>
                                    <input type="hidden" class="user_id" value="<?php echo $user->users_id ?>">
                                    <i class="fa-solid fa-pen"></i>
                                </button>
                            </td>
                        </tr>
                        <?php }
                        ?>
                    </tbody>
                </table>
            </div>
       </div>

       
    </div>
 <script src="jquery.min.js"></script>   
 <script src="create_user.js"></script>   
</body>
</html>