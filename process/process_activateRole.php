<?php

error_reporting(E_ALL);
require_once '../classes/Role.php';

if(isset($_POST['role_id'])){
    $role_id = $_POST['role_id'];

    $role = Role::getRolesById($role_id);
    if($role->roles_isActive == 0){
        $activation_result = $role->UserStatus();

        if ($activation_result) {
            $response = ['success' => true , 'data' => $role, 'message' => 'Activated User Successfully'];
            echo json_encode($response);
        } else {
            $response = ['success' => false ,  'message' => 'Failed to activate user'];
            echo json_encode($response);
        }
        
    }else{
        $deactivation_result = $role->UserStatus();
        if($deactivation_result){
            $response = ['success' => true , 'data' => $role, 'message' => 'Deactivated User Successfully'];
            echo json_encode($response);
        }else{
            $response = ['success' => false ,  'message' => 'Failed to activate user'];
            echo json_encode($response);
        }


    }
}