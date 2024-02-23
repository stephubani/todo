<?php
error_reporting(E_ALL);
require_once '../../classes/User.php';

if(isset($_POST) && isset($_POST['name'])){
   
    $name = $_POST['name'];

    $userExist = User::checkIfUserExists($name);
    if(!$userExist){
        $user_id = User::create($name);
        if($user_id){
            $userDetails = User::getUserById($user_id);
            $success_message = 'Registration Successful';
        
            $response = ['success'=> true , 'message'=> $success_message , 'data' => $userDetails];
            echo json_encode($response);
        }else{
            $error_message = 'Registration Unsuccessful';

            $response = ['success' => false , 'message' => $error_message];
            echo json_encode($response);
        }
    }else{
        $error_message = 'Name must be Unique';
        $Response  = ['success'=> false , 'message'=> $error_message];
        echo json_encode($Response);
    }

   

   

    
    

}