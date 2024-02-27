$(document).ready(function(){
    $('#user_button').click(function(){
        var fullname =   $('#fullname').val();
        var user_id = $('#userid').val();
        let data = {
            name : fullname
        }
        if(user_id != ''){
           data.user_id = user_id
        }
        var url = 'process/process_createUser.php'
        $.post(url ,data , function(response){
            var rsp = JSON.parse(response)
            if(rsp.success == true){
                let html = ''
                if(user_id == ''){
                    html += `<tr id= '${rsp.data[0].id}'>`
                }
                html += `
                
                    <td class='username'>${rsp.data[0].name}</td>
                    <td>${rsp.data[0].is_active}</td>
                    <td>  
                        <button class='btn btn-primary edit_btn' id='editUser_${rsp.data[0].id}'>
                            <input type="hidden" class="user_id" value="${rsp.data[0].id}">
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

                document.getElementById(`editUser_${rsp.data[0].id}`).addEventListener('click', editUser)
               
            }else{
                $('.feedback').html(rsp.message)
                setTimeout(function(){
                    $('.feedback').html('')
                } , 3000)
                $('#fullname').val('')
               
            }

        })

    })

    function editUser(event){
        var userName = $(event.target).closest('tr').find('.username').text()
        var user_id = $(event.target).closest('tr').find('.user_id').val()
        $('#userid').val(user_id)
        $('#user_button').text('Edit')
        $('#fullname').val(userName)
    }
    

    $('.edit_btn').click(function(event){
       editUser(event)
       
    })
})