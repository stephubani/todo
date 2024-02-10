$(document).ready(function(){

    $('#addTodo').click(function(){
      var todo_name = $('#todo_name').val();
      $.post('process/process_create.php',{name : todo_name}, function(response){
          var newTodo = JSON.parse(response)
          console.log(newTodo);
          todo_id = newTodo.id;
          var newTodoRow = `
          <tr id='${newTodo.id}'>
            <td class='todo_name'>${newTodo.name}</td>
            <td>${newTodo.is_completed == 1 ? 'Completed' : 'Not Completed'}</td>
            <td>${newTodo.created_at}</td>
            <td>${newTodo.completed_at == null ? '' : newTodo.completed_at}</td>
            <td>
              ${newTodo.is_completed == 0 ? ` <input type="hidden" class="todo_id" name="" value="${newTodo.id}">
              <button class="btn btn-primary mark_btn" id='mark_button_${newTodo.id}'>Mark as Completed</button>`: ''}

              ${newTodo.is_completed == 0 ? `
              <button class='btn btn-primary'id='editTodo_${newTodo.id}'>
                <i class="fa-solid fa-pen"></i>
              </button>`: ' '}
              
              <button class="btn delete_btn" id='deleteTodo_${newTodo.id}'><i class="fa fa-trash text-danger"></i></button>
            </td>
          </tr>
          ` 
          $('tbody').prepend(newTodoRow);
          console.log(newTodoRow);
          $('#todo_name').val('');

           document.getElementById(`mark_button_${newTodo.id}`).addEventListener('click',markAsCompleted)
           document.getElementById(`deleteTodo_${newTodo.id}`).addEventListener('click', deleteTodo)
           document.getElementById(`editTodo_${newTodo.id}`).addEventListener('click', editTodoName)

           
      })
    })

     $('.mark_btn').click(function(event){
       markAsCompleted(event);

    })

    $('.edit_btn').click(function(event){
      editTodoName(event);

   })

   
    function markAsCompleted(event){
      var todo_id =  $(event.target).closest('tr').find('.todo_id').val()
      $.get('process/process_update.php', {id: todo_id}, function(response){
        var updateTodo = JSON.parse(response)
      
        var updateTodoRow = `
        <td>${updateTodo.name}</td>
        <td>${updateTodo.is_completed == 1 ? 'Completed' : 'Not Completed'}</td>
        <td><input type='hidden' value= '${updateTodo.id}' class='todo_id'></td>
        <td>${updateTodo.created_at}</td>
        <td>${updateTodo.completed_at}</td>
        <td><button class="btn delete_btn" id = 'deleteTodo_${updateTodo.id}'><i class="fa fa-trash text-danger"></i></button></td>
        `
        $(`#${todo_id}`).html(updateTodoRow);
        document.getElementById(`deleteTodo_${updateTodo.id}`).addEventListener('click', deleteTodo)
        
      });
    
   
    
   }
   

    $('.delete_btn').click(function(event){
      deleteTodo(event);
    })
    
    function deleteTodo(event){
      var response = confirm("Do you really want to delete this todo");
      if(response == true){
        var todo_id = $(event.target).closest('tr').find('.todo_id').val();
        alert(todo_id)

        $.get('process/process_delete.php', {id:todo_id}, function(response){
          rsp = JSON.parse(response)
          if(rsp.success == true){
            $(`#${todo_id}`).remove();
            $('#display_message').html(
              `
              <div id="display_message" class="col-md-6 alert alert-success" >
                ${rsp.data}
              </div>
            `
            )
          }else{
            $('#display_message').html(
              `
              <div id="display_message" class="col-md-6 alert alert-success" >
                ${rsp.data}
              </div>
            `
            )
          }
           
        
        })
      }
    }

    function editTodoName(event) {
      var todo_name = $(event.target).closest('tr').find('.todo_name').text();
      var todo_id = $(event.target).closest('tr').find('.todo_id').val();
      $('#atodo_id').val(todo_id);
      $('#saveButton').text('Edit')
      $('#todo_name').val(todo_name)
      
    }

    $('#saveButton').click(function() {
      var todo_name = $('#todo_name').val()
      var todo_id = $('#atodo_id').val(); 
      let data = {
        name : todo_name
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
          
          document.getElementById(`mark_button_${res.data.id}`).addEventListener('click',markAsCompleted)
          document.getElementById(`deleteTodo_${res.data.id}`).addEventListener('click', deleteTodo)
          document.getElementById(`editTodo_${res.data.id}`).addEventListener('click', editTodoName)

          $('#saveButton').text('Add');
          
        }else{
          $('#display_message').html(
            `
            <div id="display_message" class="col-md-6 alert alert-danger" >
              ${res.error}
            </div>
          `
          )
        }
       
       
      });
    })


  
    


})