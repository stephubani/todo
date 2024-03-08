<?php

error_reporting(E_ALL);

require_once '../classes/Role.php';

if(isset($_POST['role_id']))
{
    $role_id = $_POST['role_id'];

    $role = Role::getRolesById($role_id);
    $reponse = $role->delete();

    if($reponse){
        $success_message = 'Todo Deleted Successfully' ;
        $response = ['success' => true , 'data' => $success_message];
        echo json_encode($response);
        exit();
    }else{
        $error_message = 'Unable To Delete This To-Do At The Moment';
        $response = ['success' => false , 'data' => $error_message];
        echo json_encode($response);
    }

}