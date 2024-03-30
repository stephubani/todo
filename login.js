$(document).ready(function(){
    $('#login').click(function(){
        let users_email = $("#email").val()
        let password = $('#password').val()

        $.post('process/process_login.php' , {users_email ,password} ,function(response){
            let resp =  JSON.parse(response);
            if(resp.success == true){
                alert(resp.message)
                window.location.href = 'users.php';
            }else{
                alert(resp.message)
            }
        })
    })
})