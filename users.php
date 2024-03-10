<?php
error_reporting(E_ALL);
require_once "classes/User.php";
require_once 'classes/Role.php';


$allUser = User::getAllUser();
;
$activeRole = Role::selectAllActiveRoles();



?>
<?php require_once 'partials/head.php'?>
        <?php require_once 'partials/nav.php'; ?>
       <center>
            <h1>User</h1>
            <p>Please fill this form to register as a user</p>
       </center>
           
        <div class="row g-2 d-flex justify-content-center">
            <div class="col-auto">
                <input type="text" name="fullname" id="fullname" class="form-control" value="" placeholder="FullName"> 
            </div>
            <div class="col-auto">
                <select name="" id="active_role" class="form-select">
                    <option value="">Select A Role</option>
                    <?php  foreach($activeRole as $role){?>
                        <option value="<?php echo $role->roles_id?>"><?php echo $role->roles_name?></option>
                    <?php } ?>
                </select>
            </div>
                
            <input type="hidden" name="user_id" id="userid" value="">
            <div class="col-auto">
                <button type="submit" class="btn btn-primary" id="user_button">Register</button>
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

                                <button class='btn btn-danger  delete_btn' id='deleteUser_<?php echo $user->users_id ?>'>
                                    <i class="fa-solid fa-trash"></i>
                                </button>

                                
                            </td>
                        </tr>
                        <?php }
                        ?>
                    </tbody>
                </table>
            </div>
       </div>

 <?php require_once 'partials/footer.php'?>      
