 
  
  <!-- nav bar starts here -->
  <div class="row">
            <div class="col-md ">
                <nav class="navbar navbar-expand-lg  bg-primary ">
                    <div class="container">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                
                                <li class="nav-item">
                                    <a class="nav-link active redesigned" aria-current="page" href="index.php" style="font-size: 15px;">Home</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link active redesigned" aria-current="page" href="users.php" style="font-size: 15px;">Users</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link active redesigned" aria-current="page" href="roles.php" style="font-size: 15px;">Roles</a>
                                </li>
                        
                                <li class="nav-item pad">
                                    <a class="nav-link active redesigned" aria-current="page" href="<?php echo isset($_SESSION['user_loggedIn']) ? 'logout.php' : 'login.php'?>" style="font-size: 15px;">
                                    <?php echo isset($_SESSION['user_loggedIn']) ? 'Logout' : 'Login'?></a>
                                </li>

                        

                              




                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- nav bar ends here -->