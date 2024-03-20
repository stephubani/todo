<?php require_once 'partials/head.php'?>
<?php require_once 'partials/nav.php'?>
<div class="container-fluid">
    <div class="row">
        <div>
            <center>
                <h1>Please Fill The Form To Register</h1>
            </center>
        </div>
        
    </div>

    <div class="row g-3 d-flex justify-content-center">
        <div class="col-auto">
            <input type="text" class="form-control" name="email" id="email" placeholder="Email">
        </div>

        <div class="col-auto" >
            <input type="password"class='form-control' name="password" id="password" value="password" disabled placeholder="Password">
          
        </div>
        <div class="col-auto">
            <button class="btn btn-primary" id="login">Login</button>
        </div>

       
       
    </div>

</div>
<?php require_once 'partials/footer.php'?>
