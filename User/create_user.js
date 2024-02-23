$(document).ready(function(){
    $('.register').click(function(){
        var fullname =   $('#fullname').val();

        var url = 'process/process_createUser.php'
        $.post(url , {name:fullname} , function(response){
            console.log(response);
            var rsp = JSON.parse(response)
            if(rsp.success == true){
                newRow = `
                <tr>
                   <td>${rsp.data}</td>
                </tr>
                `
                $('#table_body').prepend(newRow)
                $('.feedback').html(rsp.message)
                setTimeout(function(){
                    $('.feedback').html('')
                } , 3000)

                $('#fullname').val('')
               
            }else{
                $('.feedback').html(rsp.message)
                setTimeout(function(){
                    $('.feedback').html('')
                } , 3000)
            }

        })
    })
})