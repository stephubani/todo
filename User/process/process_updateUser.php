<?php
error_reporting(E_ALL);
require_once '../../classes/User.php';

if($_POST){
    $userid = isset($_POST['user_id']) ? $_POST['user_id'] :  '';
    $user = User::getUserById($userid);
   
    if($user->is_active == false){
        $userActive = $user->activateUser();

        if($userActive){
            $response = ['success' => true , 'data'=>$user, 'message' => 'Activated User Successfully'];
    
            echo json_encode($response);
        }else{
            $response = ['success' => false ,  'message' => 'We couldnt activate this user now'];
        
            echo json_encode($response);
        }
    }else{
        $userUnactive = $user->deactivateUser();
        if($userUnactive){
            $response = ['success' => true , 'data'=>$user, 'message' => 'Activated User Successfully'];
    
            echo json_encode($response);
        }else{
            $response = ['success' => false ,  'message' => 'We couldnt activate this user now'];
        
            echo json_encode($response);
        }    
       
        
    }
  

 
        
}else{
    echo ' hello something is wrong';
}