$(document).ready(function(){
    
    $('.mark_btn').click(function(){
        var todo_id =   $(this).closest('tr').find('.todo_id').val();

        $.get('process/process_update.php', {id: todo_id}, function(response){
          var updatedTodo = JSON.parse(response)
          var updatedTodoRow = `
          <td>${updatedTodo.name}</td>
          <td>${updatedTodo.is_completed == 1 ? 'Completed' : 'Not Completed'}</td>
          <td>${updatedTodo.created_at}</td>
          <td>${updatedTodo.completed_at}</td>
          `
          $(`#${todo_id}`).html(updatedTodoRow);
          
      });
      
    })

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