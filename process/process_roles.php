<?php

error_reporting(E_ALL);
require_once '../classes/Role.php';

if(!empty($_POST['roles_name']))
{
    $roles_name = $_POST['roles_name'];
    $roles_id = isset($_POST['roles_id']) ? $_POST['roles_id'] : '' ;

    $Rolesexist = Role::checkIfRoleExists($roles_name , $roles_id);
    if(!$Rolesexist){
        if(empty($roles_id))
        {
            $roles = Role::create($roles_name);
            if($roles)
            {
                $role = Role::getRolesById($roles);
                $response = ['success'=> true , 'message'=> 'Created Successfully' , 'data'=>$role];
                echo json_encode($response);
            }else{
                $response = ['success'=> false , 'message'=> ' UnSuccessfully' ];
                echo json_encode($response);
            }

        }else{
            
            $role = Role::getRolesById($roles_id);
            $role->update($roles_name);
            $response = ['success'=> true , 'message'=> 'Updated Successfully' , 'data'=>$role];
            echo json_encode($response);
        }
    }else{
        $response = ['success'=> false , 'message'=> ' Role Name Must Be Unique' ];
        echo json_encode($response);
    }
    
}else{
    $response = ['success'=> false , 'message'=> ' A Role Name is Required To Continue......' ];
    echo json_encode($response);
}