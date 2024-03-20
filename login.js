$(document).ready(function(){
    $('#login').click(function(){
        let users_email = $("#email").val()
        let password = $('#password').val()

        $.post('process/process_login.php' , {users_email ,password} ,function(response){
            let resp =  JSON.parse(response);
            if(resp){
                alert(resp.message)
                window.location.href = 'http://localhost/Todo/users.php';
            }
        })
    })
})