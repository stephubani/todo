<?php
error_reporting(E_ALL);
require_once '../classes/User.php';

if($_POST){
    $userid = isset($_POST['user_id']) ? $_POST['user_id'] :  '';
    $name = $_POST['name'];
    $email = $_POST['email'];
    $password = isset($_POST['password']) ? $_POST['password'] :  '';
    $role_id = $_POST['role_id'];
        if(!empty($name)&& !empty($role_id)){
            $userExist = User::checkIfUserExists($name , $userid);
            if(!$userExist){
                if(!empty($userid)){
                    $user = User::getUserById($userid);
                    $updated = $user->update($name , $role_id , $email);

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
                    if(!empty($email)|| !empty($password)){
                        $user_id = User::create($name , $role_id , $email , $password);
                        $user = User::getUserById($user_id);
                        $success_message = 'Registration Successful';
                        
                        $response = ['success'=> true , 'message'=> $success_message , 'data' => $user];
                        echo json_encode($response);
                    }else{
                        $error_message = 'Email is Required';
                            
                        $response = ['success'=> false , 'message'=> $error_message ];
                        echo json_encode($response);
                    }
                   
                }
                
              
            }else{
                $error_message = 'Username Must Be Unique';
                    
                $response = ['success'=> false , 'message'=> $error_message ];
                echo json_encode($response);
            }
        }else{
            $error_message = 'All Fields Are Required';
                    
            $response = ['success'=> false , 'message'=> $error_message ];
            echo json_encode($response);
        }
      
        
}else{
    echo ' hello something is wrong';
}