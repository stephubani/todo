<?php
session_start();
error_reporting(E_ALL);

require_once 'classes/Role.php';

$roles = Role::getAllRoles();

?>



<?php require_once 'partials/head.php'?>

        <?php require_once 'partials/nav.php'; 
        if(!isset($_SESSION['user_loggedIn'])){
            echo  "You must be logged in to access this page";
            exit;
        }        
        ?>
        <h1>Roles</h1>
        <div class="row g-2">
            <div class="col-auto">
                <input type="text" name="" id="rolesname" class="form-control mb-3" placeholder="To-Do Roles">
                <input type="hidden" name="roles_id" id="roles_id" value=''>
                
            </div>
            <div class="col-auto">
                <button class="btn btn-primary roles">Create</button>
            </div>
            
             
        </div>
        <div id="displayMessage" class="col-md-6 ">

        </div>

        <div class="row ">
            <div class="col-md mb-3">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>Roles</th>
                            <th>Status</th>
                            <th>Edit</th>
                        </tr>
                        
                    </thead>
                   
                    <tbody id="tbody">
                        <?php foreach($roles as $role){ ?>
                            <tr class="role" id="<?php echo $role->roles_id?>">
                                <td class="rolesname"><?php echo $role->roles_name?></td>
                                <td class="is_active"> 
                                    <button class="btn <?php echo $role->roles_isActive == 0 ? "btn-secondary" : "btn-primary" ?>  status" id="status_<?php echo $role->roles_id?>">
                                        <?php echo $role->displayStatusOfRoles()?>
                                    </button>
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
       
<?php require_once 'partials/footer.php'?>