<?php include('server.php') ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title><h2>Login</h2></title>

</head>

<center>
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                
                

                    <div class="signin-form">
                        <h2 class="form-title">Login</h2>
                        
                        <form method="POST" class="register-form" action="login.php" id="login-form">
                        <?php include('errors.php'); ?>
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="username" id="username" required="_required"placeholder="username"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" required="_required" placeholder="Password"/>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="submit" id="submit" class="form-submit" value="Log in"/>
                            </div>

                            
                            <div class="signin-image">
                        <a href="register.php" class="signup-image-link">Sign-Up</a>
                    </div>
                        </form>  
                                            
                    </div>
                </div>
            </div>
        </section>

    </div>

</body>
</center>  
</html>