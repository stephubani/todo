$(document).ready(function(){
    $('#user_button').click(function(){
        var fullname =   $('#fullname').val();
        console.log(fullname.length)
        
        var user_id = $('#userid').val();
        let data = {
            name : fullname
        }
        if(user_id != ''){
           data.user_id = user_id
        }
        var url = 'process/process_createUser.php'
        $.post(url ,data , function(response){
            console.log(response);
            var rsp = JSON.parse(response)
            if(rsp.success == true){
                let html = ''
                if(user_id == ''){
                    html += `<tr id= '${rsp.data.users_id}'>`
                }
                html += `
                    <td class='username'>${rsp.data.users_name}</td>
                    <td>
                        <button class = 'btn btn-secondary status'id='status_${rsp.data.users_id}'>
                            ${rsp.data.is_active == false ? 'Unactive' : 'Active'}
                        </button>
                        
                    </td>
                    <td>  
                        <button class='btn btn-primary edit_btn' id='editUser_${rsp.data.users_id}'>
                            <input type="hidden" class="user_id" value="${rsp.data.users_id}">
                            <i class="fa-solid fa-pen"></i>
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

                document.getElementById(`editUser_${rsp.data.users_id}`).addEventListener('click', editUser)
                document.getElementById(`status_${rsp.data.users_id}`).addEventListener('click', activateUser)
               
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

        var userName = $(event.target).closest('tr').find('.username').text()
        console.log(userName.length)
        var user_id = $(event.target).closest('tr').find('.user_id').val()
        $('#userid').val(user_id)
        $('#user_button').text('Edit')
        $('#fullname').val(userName)
    }
    

    $('.edit_btn').click(function(event){
       editUser(event)
    })

    $('.status').click(function(event){
        activateUser(event)
    })

    function activateUser(event){
        var user_id = $(event.target).closest('tr').find('.user_id').val()
        var url = 'process/process_updateUser.php'
        $.post(url ,{user_id} , function(response){
            var rsp = JSON.parse(response)
            if(rsp.success == true){
                let html = ''
                html = `
                    <td class='username'>${rsp.data.users_name}</td>
                    <td>
                        <button class = 'btn btn-secondary status' id='status_${rsp.data.users_id}'>
                            ${rsp.data.is_active == false ? 'Unactive' : 'Active'}
                        </button>
                        
                    </td>
                    <td> 
                        <button class='btn btn-primary edit_btn' id='editUser_${rsp.data.users_id}'>
                            <input type="hidden" class="user_id" value="${rsp.data.users_id}">
                            <i class="fa-solid fa-pen"></i>
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
               
               
            }
        })   
    }
})