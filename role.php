<?php
error_reporting(E_ALL);

require_once 'classes/Role.php';

$roles = Role::getAllRoles();

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
                                    <a class="nav-link active redesigned" aria-current="page" href="../index.php" style="font-size: 15px;">Home</a>
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
            <center>
                <div class="col-md-4">
                <h1>To-Do Roles</h1>
                <input type="text" name="" id="rolesname" class="form-control mb-3" placeholder="To-Do Roles">
                <input type="hidden" name="roles_id" id="roles_id" value=''>
                <button class="btn btn-primary roles">Create</button>
                </div>
            </center>
             
        </div>
        <div id="displayMessage" class="col-md-6 ">

        </div>

        <div class="row ">
            <div class="col-md mb-3">
                <h1>All Roles</h1>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Roles</th>
                            <th>Edit</th>
                        </tr>
                        
                    </thead>
                   
                    <tbody id="tbody">
                        <?php foreach($roles as $role){ ?>
                            <tr class="role" id="<?php echo $role->roles_id?>">
                                <td class="rolesname"><?php echo $role->roles_name?></td>
                                <td class="is_active"> 
                                    <?php if($role->roles_isActive == 0){
                                    ?>
                                        <button class="btn btn-secondary status" id="status_<?php echo $role->roles_id?>">
                                            <?php echo $role->displayStatusOfUser()?>
                                        </button>
                                    <?php
                                    }else{
                                        echo "<button class='btn btn-primary status' id='status_" . $role->roles_id. "'>";
                                        echo $role->displayStatusOfUser();
                                        echo "</button>";
                                    }                                
                                    ?>
                              
                                </td>
                                <td>
                                    <button class='btn btn-primary edit_btn' id='editRole_<?php echo $role->roles_id ?>'>
                                    <input type="hidden" name="role_id" class="rolesid" value="<?php echo $role->roles_id?>">
                                       
                                            <i class="fa-solid fa-pen"></i>
                                    </button>

                                    <button class="btn delete_btn" id = 'deleteRole_<?php echo $role->roles_id?>'><i class="fa fa-trash text-danger">
                                </td>
                            </tr> 
                        <?php }?>
                       
                        
                    </tbody>
                </table>
            </div>
        </div>
       
    </div>
<script src="jquery.min.js"></script>
<script src="roles.js"></script>    
</body>
</html>