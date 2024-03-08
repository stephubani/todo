<?php

require_once '../classes/Role.php';

$active_User = User::selectAllActiveUsers();

if($active_User){
    $response = ['success'=> true, 'data'=>$active_User];
    echo json_encode($response);
    exit();
}else{
    $response = ['success'=> false, 'message' => 'No user at the moment'];
    echo json_encode($response);
    exit();
}