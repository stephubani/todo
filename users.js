$(document).ready(function(){
    $('#user_button').click(function(){
        let fullname =   $('#fullname').val();
        let email = $('#email').val();
        let password = $('#password').val();
        let role_id = $('#active_role').val();
        let user_id = $('#userid').val();

        let data = {
            name : fullname,
            email : email,
            password: password,
            role_id :role_id
        }
        if(user_id != ''){
           data.user_id = user_id
        }
        let url = 'process/process_createUser.php'
        $.post(url ,data , function(response){
            let rsp = JSON.parse(response)
            if(rsp.success == true){
                let html = ''
                if(user_id == ''){
                    html += `<tr id= '${rsp.data.users_id}'>`
                }
                html += `
                    <td class = 'roles'>${rsp.data.role.roles_name}</td>
                    <td class='username'>${rsp.data.users_name}</td>
                    <td class='useremail'>${rsp.data.users_email}</td>
                    <td>
                        <button class = 'btn btn-secondary status'id='status_${rsp.data.users_id}'>
                            ${rsp.data.is_active == false ? 'Unactive' : 'Active'}
                            <input type="hidden" class="roles_id" name="role" value="${rsp.data.role.roles_id}">
                        </button>
                        
                    </td>
                    <td>  
                        <button class='btn btn-primary edit_btn' id='editUser_${rsp.data.users_id}'>
                            <input type="hidden" class="user_id" value="${rsp.data.users_id}">
                            <i class="fa-solid fa-pen"></i>
                        </button>

                        <button class='btn btn-danger  delete_btn' id='deleteUser_${rsp.data.users_id}'>
                            <i class="fa-solid fa-trash"></i>
                        </button>

                    </td>
                `
                if(user_id == ''){
                    html += `</tr>`
                }

                if(user_id == ''){
                    $('#table_body').prepend(html)
                }else{
                    $(`#${user_id}`).html(html)
                }

                $('.feedback').html(rsp.message)
                setTimeout(function(){
                    $('.feedback').html('')
                } , 3000)

                $('#fullname').val('')
                $('#user_button').text('Register')
                $('#active_role').val('');
                $('#email').val('');
                $('#userid').val('')
                
                

                document.getElementById(`editUser_${rsp.data.users_id}`).addEventListener('click', editUser)
                document.getElementById(`status_${rsp.data.users_id}`).addEventListener('click', activateUser)
                document.getElementById(`deleteUser_${rsp.data.users_id}`).addEventListener('click', deleteUser)
               
            }else{
                $('.feedback').html(rsp.message)
                setTimeout(function(){
                    $('.feedback').html('')
                } , 3000)
                $('#fullname').val()
               
            }

        })

    })

    function editUser(event){

        let userName = $(event.target).closest('tr').find('.username').text()
        let email = $(event.target).closest('tr').find('.useremail').text()
        let roles_id = $(event.target).closest('tr').find('.roles_id').val()
        let user_id = $(event.target).closest('tr').find('.user_id').val()
        $('#userid').val(user_id)
        $('#user_button').text('Edit')
        $('#fullname').val(userName)
        $('#active_role').val(roles_id);
        $('#email').val(email);

       
        
    }
    

    $('.edit_btn').click(function(event){
       editUser(event)
    })

    $('.status').click(function(event){
        activateUser(event)
    })

    function activateUser(event){
        let user_id = $(event.target).closest('tr').find('.user_id').val()
        let url = 'process/process_updateUser.php'
        $.post(url ,{user_id} , function(response){
            let rsp = JSON.parse(response)
            if(rsp.success == true){
                let html = ''
                html = `
                    <td class = 'roles'>${rsp.data.role != null ? rsp.data.role.roles_name : ''}</td>
                    <td class='username'>${rsp.data.users_name}</td>
                    <td class='useremail'>${rsp.data.users_email}</td>
                    <td>
                        <button class = 'btn btn-secondary status' id='status_${rsp.data.users_id}'>
                            ${rsp.data.is_active == false ? 'Unactive' : 'Active'}
                            <input type="hidden" class="roles_id" name="role" value="${rsp.data.role.roles_id}">
                        </button>
                        
                    </td>
                    <td> 
                        <button class='btn btn-primary edit_btn' id='editUser_${rsp.data.users_id}'>
                            <input type="hidden" class="user_id" value="${rsp.data.users_id}">
                            <i class="fa-solid fa-pen"></i>
                        </button>

                        <button class='btn btn-danger  delete_btn' id='deleteUser_${rsp.data.users_id}'>
                            <i class="fa-solid fa-trash"></i>
                        </button>

                    </td>
                `
                $(`#${user_id}`).html(html)
                if (rsp.data.is_active == true) {
                    $(`#status_${rsp.data.users_id}`).removeClass('btn-secondary').addClass('btn-primary');
                } else {
                    $(`#status_${rsp.data.users_id}`).removeClass('btn-primary').addClass('btn-secondary');
                }

                document.getElementById(`editUser_${rsp.data.users_id}`).addEventListener('click', editUser)
                document.getElementById(`status_${rsp.data.users_id}`).addEventListener('click', activateUser)
                document.getElementById(`deleteUser_${rsp.data.users_id}`).addEventListener('click', deleteUser)
               
               
            }
        })   
    }


    $('.delete_btn').click(function(event){
        deleteUser(event)
    })
    function deleteUser(event){
        let confirmation = confirm('Delete User')
        if(confirmation == true ){
            let user_id = $(event.target).closest('tr').find('.user_id').val()

            $.post('process/process_deleteUser.php' , {user_id}, function(response){
                rsp = JSON.parse(response)

                if(rsp.success == true){
                    $(`#${user_id}`).remove();

                    $('.feedback').html(rsp.message)
                    setTimeout(function(){
                        $('.feedback').html('')
                    } , 3000)
                    $('#fullname').val()
                }else{
                    $('.feedback').html(rsp.message)
                    setTimeout(function(){
                        $('.feedback').html('')
                    } , 3000)
                    $('#fullname').val()
                }
            }) 
        }
       
    }
})