<?php
session_start();
error_reporting(E_ALL);
require_once '../classes/User.php';

if($_POST['users_email'] && $_POST['password']){
    $users_email = $_POST['users_email'];
    $users_password = $_POST['password'];
    $user = User::login($users_email , $users_password);
    
    if($user){
        $_SESSION['user_loggedIn'] = $user;
        $response = ['success'=> true , 'message'=> 'Logged In Successful'];
        echo json_encode($response);
      
    }else{
        $error_message = 'Cant find an account with this credentials';
        $response = ['success'=> false , 'message'=> $error_message , ];
        echo json_encode($response);
    }

}