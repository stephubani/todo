<?php

require_once '../classes/User.php';

$active_User = User::selectAllActiveUsers();

if($active_User){
    $response = ['success'=> true, 'data'=>$active_User];
    echo json_encode($response);
    exit();
}else{
    $response = ['success'=> true, 'message' => 'Unable to get user at the moment'];
    echo json_encode($response);
    exit();
}