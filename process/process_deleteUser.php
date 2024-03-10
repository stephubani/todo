<?php

error_reporting(E_ALL);
require_once '../classes/User.php';

if(isset($_POST['user_id'])){
    $user_id =$_POST['user_id'];

    $user = User::getUserById($user_id);
    $result = $user->deleteUser($user_id);

    if($result){
        $success_message = 'User Deleted Successfully' ;
        $response = ['success' => true , 'data' => $success_message];
        echo json_encode($response);
        exit();
    }else{
        $error_message = 'Unable To Delete This User At The Moment';
        $response = ['success' => false , 'data' => $error_message];
        echo json_encode($response);
    }
}