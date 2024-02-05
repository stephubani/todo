$(document).ready(function(){
    
    $('.mark_btn').click(function(){
        var todo_id =   $(this).closest('tr').find('.todo_id').val();
        // alert(todo_id);

        $.get('process/process_update.php', {id: todo_id}, function(response){
          $('#new_tr').html(response);
          console.log(response);
      });
      
    })


})