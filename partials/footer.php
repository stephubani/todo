<?php

    $result = explode('/' ,  $_SERVER['PHP_SELF']);
    $php_file = $result[2];
    
?>

</div>
 <script src="jquery.min.js"></script>   
 <script src="<?php echo str_replace('php' , 'js' , $php_file)?>"></script>  
</body>
</html>

