<?php
error_reporting(E_ALL);
require_once '../classes/User.php';

if(isset($_POST)){
    $name = $_POST['name'];

    $userExist = User::checkIfUserExists($name);
    if(!$userExist){
        $response = User::create($name);
        if($response){
        $success_message = 'Registration Successful';
        
        $response = ['success'=> true , 'message'=> $success_message , 'data' => $name];
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