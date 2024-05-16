<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forum login</title>
        <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styles.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=EB+Garamond:wght@400;500&family=Inter:wght@400;500&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">

        <!-- Template Main CSS Files -->
        <link href="assets/css/variables.css" rel="stylesheet">
        <link href="assets/css/main.css" rel="stylesheet">
    </head>
    <body>
        <a href="home" class="logo d-flex align-items-center">
            <!-- Uncomment the line below if you also wish to use an image logo -->
            <!-- <img src="assets/img/logo.png" alt=""> -->
            <h1>Dream forum</h1>
        </a>
        <div class="login-reg-panel">
            <div class="login-info-box">
                <h2>Have an account?</h2>
                <p>Welcome to forum chat</p>
                <label id="label-register" for="log-reg-show">Login</label>
                <input type="radio" name="active-log-panel" id="log-reg-show" checked="checked">
            </div>



            <div class="register-info-box">
                <h2>Don't have an account?</h2>
                <p>Register now!</p>
                <label id="label-login" for="log-login-show">Register</label>
                <input type="radio" name="active-log-panel" id="log-login-show">
            </div>
            <div class="white-panel">
                <form action="login" method="post">
                    <div class="login-show">
                        <h2>LOGIN</h2>
                        <c:if test="${not empty mess}">
                            <div class="alert alert-danger" style="text-align: center" role="alert">
                                ${requestScope.mess}
                            </div>
                        </c:if>
                        <input type="text" name="username" value="${username}" required="required" placeholder="Username">
                        <input type="password" name="password" value="${password}" required="required" placeholder="Password">
                        <input type="submit" value="Login">
                        <a href="forgetPassword.jsp">Forgot password?</a>
                    </div>

                </form>
                <form action="register" method="post">
                    <div class="register-show">
                        <h2>REGISTER</h2>
                        <c:if test="${not empty err}">
                            <div class="alert alert-danger" style="text-align: center" role="alert">
                                ${requestScope.err}
                            </div>
                        </c:if>
                        <input type="text" name="reg_username" required="required" placeholder="Username">
                        <input type="text" name="reg_email" required="required" placeholder="Email">
                        <input type="password" name="reg_password" required="required" placeholder="Password">
                        <input type="password" name="reg_repassword" required="required" placeholder="Confirm Password">
                        <input type="submit" value="Register">
                    </div>
                </form>
            </div>
        </div>

        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="js/js.js"></script>
    </body>
</html>
