<?php
error_reporting(E_ALL);
require_once '../classes/User.php';

if($_POST){
    $userid = isset($_POST['user_id']) ? $_POST['user_id'] :  '';
    $user = User::getUserById($userid);
    
    
    if ($user->is_active == false) {
        
        $activation_result = $user->UserStatus();
        
        if ($activation_result) {
            $response = ['success' => true , 'data' => $user, 'message' => 'Activated User Successfully'];
            echo json_encode($response);
        } else {
            $response = ['success' => false ,  'message' => 'Failed to activate user'];
            echo json_encode($response);
        }
    } else {
        
        $deactivation_result = $user->UserStatus();
        
        if ($deactivation_result) {
            $response = ['success' => true , 'data' => $user, 'message' => 'Deactivated User Successfully'];
            echo json_encode($response);
        } else {
            $response = ['success' => false ,  'message' => 'Failed to deactivate user'];
            echo json_encode($response);
        }
    }
  
    
   

 
        
}else{
    $response = ['success' => false ,  'message' => 'Unauthorized Visit'];
    echo json_encode($response);
}