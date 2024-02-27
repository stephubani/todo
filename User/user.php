<?php
error_reporting(E_ALL);
require_once "../classes/User.php";

$allUser = User::getAllUser();



?>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/style.css">
    <link href='../assets/fa/css/all.min.css' rel='stylesheet'>
    <title>Document</title>
</head>
<body>
    <div class="container">
       <div class="row">
            <div class="col-md">
                <h1>Welcome To To-Do!</h1>
                <p>Please fill this form to register as a user</p>
                    <label for="Fullname">Full-Name
                        <input type="text" name="fullname" id="fullname" class="form-control">
                        <input type="hidden" name="user_id" id="userid" value="">
                    </label>

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
                        <th>Name</th>
                        <th>Activate</th>
                        <th>Edit</th>

                    </thead>

                    <tbody id ="table_body">
                        <?php foreach($allUser as $user){ ?>
                        <tr id="<?php echo $user->id?>">
                            <td class="username"><?php echo $user->name?></td>
                            <td class="is_active"><?php echo $user->is_active?></td>
                            <td>  
                                <button class='btn btn-primary edit_btn' id='editUser_<?php echo $user->id ?>'>
                                    <input type="hidden" class="user_id" value="<?php echo $user->id ?>">
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
 <script src="../jquery.min.js"></script>   
 <script src="create_user.js"></script>   
</body>
</html>