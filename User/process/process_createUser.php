<?php
error_reporting(E_ALL);
require_once '../../classes/User.php';

if($_POST){
    $userid = isset($_POST['user_id']) ? $_POST['user_id'] :  '';
    $name = $_POST['name'];

        if(!empty($name)){
            $userExist = User::checkIfUserExists($name);
            if(!$userExist){
                if(!empty($userid)){
                    $user = User::getUserById($userid);
                    $updated = $user->update($name);

                    if($updated){
                        $success_message = 'Updated Successful';
                    
                        $response = ['success'=> true , 'message'=> $success_message , 'data' => $user];
                        echo json_encode($response);
                    }else{
                        $error_message = 'Something Occured Please Wait A Moment';
                    
                        $response = ['success'=> false , 'message'=> $error_message];
                        echo json_encode($response);
                    }

                }else{
                    $user_id = User::create($name);
                    $user = User::getUserById($user_id);
                    $success_message = 'Registration Successful';
                    
                    $response = ['success'=> true , 'message'=> $success_message , 'data' => $user];
                    echo json_encode($response);
                }
                
              
            }else{
                $error_message = 'Username Must Be Unique';
                    
                $response = ['success'=> false , 'message'=> $error_message ];
                echo json_encode($response);
            }
        }else{
            $error_message = 'A Username is Required To Continue....';
                    
            $response = ['success'=> false , 'message'=> $error_message ];
            echo json_encode($response);
        }
      
        
}else{
    echo ' hello something is wrong';
}