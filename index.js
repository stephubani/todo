$(document).ready(function(){

     $('.mark_btn').click(function(event){
       markAsCompleted(event);

    })

    $('.edit_btn').click(function(event){
      editTodoName(event);

   })

   
    function markAsCompleted(event){
      let todo_id =  $(event.target).closest('tr').find('.todo_id').val()
      $.get('process/process_update.php', {id: todo_id}, function(response){
         
        let rsp = JSON.parse(response)
       
        if(rsp.success == true){
          let updateTodoRow = `
          <td class="username">${rsp.data.user.users_name}</td>
          <td>${rsp.data.name}</td>
          <td>${rsp.data.is_completed == 1 ? 'Completed' : 'Not Completed'}</td>
          <td>${rsp.data.created_at}</td>
          <td>${rsp.data.completed_at}</td>
          <td>
            <input type='hidden' value= '${rsp.data.id}' class='todo_id'>
            <button class="btn delete_btn" id = 'deleteTodo_${rsp.data.id}'><i class="fa fa-trash text-danger">
            </i>
            <input type="hidden" class="users_id" name="" value="${rsp.data.user.users_id}
            </button>
          </td>
          `
          $('#displayMessageContainer').html(rsp.message)
          setTimeout(function() {
            $('#displayMessageContainer').html('')
          }, 3000);
      

          $(`#${todo_id}`).html(updateTodoRow);
          document.getElementById(`deleteTodo_${rsp.data.id}`).addEventListener('click', deleteTodo)
          
        }else{
          $('#displayMessageContainer').html(rsp.message)
          setTimeout(function() {
            $('#displayMessageContainer').html('')
          }, 3000);
        }
      
       
      });
    
   
    
   }
   



    $('.delete_btn').click(function(event){
      deleteTodo(event);
    })
    
    function deleteTodo(event){
      let response = confirm("Do you really want to delete this todo");
      if(response == true){
        let todo_id = $(event.target).closest('tr').find('.todo_id').val();

        $.get('process/process_delete.php', {id:todo_id}, function(response){
          rsp = JSON.parse(response)
          if(rsp.success == true){
            $(`#${todo_id}`).remove();
    
          }else{
            $('#displayMessageContainer').html(rsp.error)
            setTimeout(function() {
              $('#displayMessageContainer').html('')
            }, 3000);
          }
           
        
        })
      }
    }

    function editTodoName(event) {
      let todo_name = $(event.target).closest('tr').find('.todo_name').text();
      let todo_id = $(event.target).closest('tr').find('.todo_id').val();
      let users_id = $(event.target).closest('tr').find('.users_id').val();
      $('#atodo_id').val(todo_id);
      $('#saveButton').text('Edit')
      $('#todo_name').val(todo_name)
      $('#alluser').val(users_id);
    
      
    }

   

    $('#saveButton').click(function(event) {
      let todo_name = $('#todo_name').val()
      let todo_id = $('#atodo_id').val();
      let user_id = $('#alluser').val();
      let username = $('#alluser').val();
  


     
      let data = {
        name : todo_name,
        user_id : user_id,
        username : username

      }
     
      if(todo_id != '' ){
        data['id'] = todo_id
      }
      $.get('process/process_create.php', data , function(response){
        const res = JSON.parse(response)
        
        if(res.success){
        
          let html = ''
          if(todo_id == ''){
            html += `<tr id = ${res.data.id}>`
          }
          html += `
            <td class="username" id='${res.data.user.users_id}'>${res.data.user.users_name}</td>
            <td class='todo_name'>${res.data.name}</td>
            <td>${res.data.is_completed == 1 ? 'Completed' : 'Not Completed'}</td>
            <td>${res.data.created_at}</td>
            <td>${res.data.completed_at == null ? '' : res.data.completed_at}</td>
            <td>
              ${res.data.is_completed == 0 ? ` <input type="hidden" class="todo_id" name="" value="${res.data.id}">
              <button class="btn btn-primary mark_btn" id='mark_button_${res.data.id}'>Mark as Completed</button>`: ''}

              ${res.data.is_completed == 0 ? `
              <button class='btn btn-primary'id='editTodo_${res.data.id}'>
                <i class="fa-solid fa-pen"></i>
              </button>`: ' '}
              
              <button class="btn delete_btn" id='deleteTodo_${res.data.id}'><i class="fa fa-trash text-danger"></i></button>
              <input type="hidden" class="users_id" name="" value="${res.data.user.users_id}"
            </td>
          `
          if(todo_id == ''){
            html += `</tr>` 
          }

          if(todo_id == ''){
            $('tbody').prepend(html);
          }else{
            $(`#${todo_id}`).html(html)
          }
          $('#todo_name').val('')
          $('#atodo_id').val('');
          $('#alluser').val('');
          
          document.getElementById(`mark_button_${res.data.id}`).addEventListener('click',markAsCompleted)
          document.getElementById(`deleteTodo_${res.data.id}`).addEventListener('click', deleteTodo)
          document.getElementById(`editTodo_${res.data.id}`).addEventListener('click', editTodoName)

          $('#saveButton').text('Add');
          
        }else{
          $('#displayMessageContainer').html(res.error)
          setTimeout(function() {
            $('#displayMessageContainer').html('')
          }, 3000);
        }
       
       
      });
    })


  
  
      $.post('process/process_get_activeuser.php', function(response) {
        let rsp = JSON.parse(response)
        if(rsp.success == true){
          $('#alluser').append('<option value= "">Select A User</option>')
          rsp.data.forEach(function(user) {
            let option = $('<option>', { value: user.users_id, text: user.users_name });
            $('#alluser').append(option);
          });
        }else{
          $('#displayMessageContainer').html(rsp.message)
          setTimeout(function() {
            $('#displayMessageContainer').html('')
          }, 3000);
        }
    });
    
 


})