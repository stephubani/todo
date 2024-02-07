$(document).ready(function(){

    $('.addTodo').click(function(){
     
      var todo_name = $('.todo_name').val();
      $.post('process/process_create.php',{name : todo_name}, function(response){
          var newTodo = JSON.parse(response)
          todo_id = newTodo.id;
          var newTodoRow = `
          <tr id='${newTodo.id}'>
            <td>${newTodo.name}</td>
            <td>${newTodo.is_completed == 1 ? 'Completed' : 'Not Completed'}</td>
            <td>${newTodo.created_at}</td>
            <td>${newTodo.completed_at == null ? '' : newTodo.completed_at}</td>
            <td>
              ${newTodo.is_completed == 0 ? ` <input type="hidden" class="todo_id" name="" value="<?php echo $todo->id ?>">
              <button class="btn btn-primary mark_btn" id='mark_button_${newTodo.id}'>Mark as Completed</button>`: ''}

              ${newTodo.is_completed == 0 ? `
              <a href="create.php?id=<?php echo $todo->id?>">
                <i class="fa-solid fa-pen"></i>
              </a>`: ' '}
              
              <button class="btn delete_btn"><i class="fa fa-trash text-danger"></i></button>
            </td>
          </tr>
        
          ` 
          $('tbody').prepend(newTodoRow);
          console.log(newTodoRow);
          $('.todo_name').val('');

           document.getElementById(`mark_button_${newTodo.id}`).addEventListener('click',markAsCompleted)
      })
    })

     $('.mark_btn').click(function(event){
       markAsCompleted(event);

    })
   
    function markAsCompleted(event){
      var todo_id =   $(event.target).closest('tr').find('.todo_id').val();
       console.log(todo_id);
    $.get('process/process_update.php', {id: todo_id}, function(response){
      var updateTodo = JSON.parse(response)
     
      var updateTodoRow = `
      <td>${updateTodo.name}</td>
      <td>${updateTodo.is_completed == 1 ? 'Completed' : 'Not Completed'}</td>
      <td>${updateTodo.created_at}</td>
      <td>${updateTodo.completed_at}</td>
      <td><button class="btn delete_btn"><i class="fa fa-trash text-danger"></i></button></td>
      `
      $(`#${todo_id}`).html(updateTodoRow);
      
    });
    
   
    
   }
   

    $('.delete_btn').click(function(){
      var response = confirm("Do you really want to delete this todo");
      if(response == true){
        var todo_id = $(this).closest('tr').find('.todo_id').val();

        $.get('process/process_delete.php', {id:todo_id}, function(response){
            $(`#${todo_id}`).remove();
            alert(response);
        })
      }
    })
    
    
   


})