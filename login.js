$(document).ready(function(){
    $('#login').click(function(){
        let users_email = $("#email").val()
        let password = $('#password').val()

        $.post('process/process_login.php' , {users_email ,password} ,function(response){
            console.log(response)
            let resp =  JSON.parse(response);
            if(resp.success == true){
                alert(resp.message)
                window.location.href = 'http://localhost/Todo/users.php';
            }else{
                alert(resp.message)
            }
        })
    })
})