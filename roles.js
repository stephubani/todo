$(document).ready(function(){
    $('.roles').click(function(){
        let roles_name = $('#rolesname').val();
        let role_id = $('#roles_id').val();

        let data = 
        {
            roles_name : roles_name ,
        }
        if(role_id != '')
        {
            data.roles_id = role_id; 
        }

        
        $.post('process/process_roles.php' , data , function(response){
            console.log(response);
            rsp = JSON.parse(response);
            if(rsp.success == true)
            {
                let html = ''
                if(role_id == '')
                {
                    html += ` <tr class="role" id="${rsp.data.roles_id}">`
                }

                html += `
                    <td class='rolesname'>${rsp.data.roles_name}</td>
                    <td>
                        <button class = 'btn btn-secondary status'id='status_${rsp.data.roles_id}'>
                            ${rsp.data.roles_isActive == false ? 'Unactive' : 'Active'}
                        </button>
                    
                    </td>
                    <td>
                        <button class='btn btn-primary edit_btn' id='editRole_${rsp.data.roles_id}'>
                        <input type="hidden" name="role_id" class="rolesid" value="${rsp.data.roles_id}">
                                <i class="fa-solid fa-pen"></i>
                        </button>

                        <button class="btn delete_btn" id = 'deleteRole_${rsp.data.roles_id}'><i class="fa fa-trash text-danger">
                    </td>
                    
                `

                if(role_id == '')
                {
                    html += `</tr>`
                }

                if(role_id == ''){
                    $('#tbody').prepend(html);
                }else{
                    $(`#${role_id}`).html(html);
                }

                $('#rolesname').val('');
                $('.roles').text('Create')
                $('#roles_id').val('')
               

                $('#displayMessage').html(rsp.message)
                setTimeout(function() {
                  $('#displayMessage').html('')
                }, 3000);

                document.getElementById(`editRole_${rsp.data.roles_id}`).addEventListener('click' , editRole)
                document.getElementById(`deleteRole_${rsp.data.roles_id}`).addEventListener('click' , deleteRole)
                document.getElementById(`status_${rsp.data.roles_id}`).addEventListener('click' , activateRole)

            }else{
                $('#displayMessage').html(rsp.message)
                setTimeout(function() {
                  $('#displayMessage').html('')
                }, 3000);
            }
            
        })
        
    })

    $('.edit_btn').click(function(event){
        editRole(event)
    })

    function editRole(event){
        let role_id = $(event.target).closest('tr').find('.rolesid').val()
        let role_name = $(event.target).closest('tr').find('.rolesname').text()

        $('#roles_id').val(role_id)
        $('#rolesname').val(role_name)
        $('.roles').text('Edit')
    }

    $('.delete_btn').click(function(event){
        deleteRole(event)
    })

    function deleteRole(event){
        let confirmation = confirm('Delete Role?')
        if(confirmation == true){
            let role_id = $(event.target).closest('tr').find('.rolesid').val()

            $.post('process/process_deleteRole.php' , {role_id} , function(response){
                rsp = JSON.parse(response)

                if(rsp.success == true){
                    $(`#${role_id}`).remove()
                    $('#displayMessage').html(rsp.data)
                    setTimeout(function() {
                      $('#displayMessage').html('')
                    }, 3000);
                }else{
                    $('#displayMessage').html(rsp.data)
                    setTimeout(function() {
                      $('#displayMessage').html('')
                    }, 3000);
                }

            })
        }
      
    }

    $('.status').click(function(event){
        activateRole(event)
    })

    function activateRole(event){
        let role_id = $(event.target).closest('tr').find('.rolesid').val()

        $.post('process/process_activateRole.php' , {role_id} , function(response){
            console.log(response);
            
            rsp = JSON.parse(response)
            if(rsp.success == true){
                html = `
                    <td class='rolesname'>${rsp.data.roles_name}</td>
                    <td>
                        <button class = 'btn btn-secondary status'id='status_${rsp.data.roles_id}'>
                            ${rsp.data.roles_isActive == false ? 'Unactive' : 'Active'}
                        </button>
                    
                    </td>
                    <td>
                        <button class='btn btn-primary edit_btn' id='editRole_${rsp.data.roles_id}'>
                        <input type="hidden" name="role_id" class="rolesid" value="${rsp.data.roles_id}">
                                <i class="fa-solid fa-pen"></i>
                        </button>

                        <button class="btn delete_btn" id = 'deleteRole_${rsp.data.roles_id}'><i class="fa fa-trash text-danger">
                    </td>
                
                `
                $(`#${role_id}`).html(html);

                if (rsp.data.roles_isActive == true) {
                    $(`#status_${rsp.data.roles_id}`).removeClass('btn-secondary').addClass('btn-primary');
                } else {
                    $(`#status_${rsp.data.roles_id}`).removeClass('btn-primary').addClass('btn-secondary');
                }

                
                document.getElementById(`editRole_${rsp.data.roles_id}`).addEventListener('click' , editRole)
                document.getElementById(`deleteRole_${rsp.data.roles_id}`).addEventListener('click' , deleteRole)
                document.getElementById(`status_${rsp.data.roles_id}`).addEventListener('click' , activateRole)


            }else{
                $('#displayMessage').html('couldnt activate user')
                setTimeout(function() {
                  $('#displayMessage').html('')
                }, 3000);
            }
          
        })

    }
})