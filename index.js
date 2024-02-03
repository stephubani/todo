$(document).ready(function(){
    $('.checked').click(function(){
      var todo_id =   $(this).closest('tr').find('.todo_id').val();
        // alert(todo_id);

        $.ajax({
            type:"GET",
            url:"process/process_update.php",
            data : {"id" : todo_id},
            success:function(response){
                console.log(response)
                
            }
        })
    })
})