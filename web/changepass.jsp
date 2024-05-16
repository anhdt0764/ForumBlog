<%-- 
    Document   : forgetPassword
    Created on : Apr 16, 2024, 10:34:52 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password</title>
        <link rel="stylesheet" href="https://unpkg.com/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    </head>
    <body>
        <!-- Password Reset 8 - Bootstrap Brain Component -->
        <section class="bg-light p-3 p-md-4 p-xl-5">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-12 col-xxl-11">
                        <div class="card border-light-subtle shadow-sm">
                            <div class="row g-0">
                                <div class="col-12 col-md-6">
                                    <img class="img-fluid rounded-start w-100 h-100 object-fit-cover" loading="lazy" src="https://th.bing.com/th/id/R.13820971a962ffbeb63a8fef36185b16?rik=vZ3lu%2blbhy6jxw&riu=http%3a%2f%2fwallup.net%2fwp-content%2fuploads%2f2016%2f03%2f10%2f319576-photography-landscape-nature-water-grass-trees-plants-sunrise-lake.jpg&ehk=6WS2p9KknQa9F%2bgAH16n44NReuUyS2rzXah2zy7kiAw%3d&risl=&pid=ImgRaw&r=0" alt="Welcome back you've been missed!">
                                </div>
                                <div class="col-12 col-md-6 d-flex align-items-center justify-content-center">
                                    <div class="col-12 col-lg-11 col-xl-10">
                                        <div class="card-body p-3 p-md-4 p-xl-5">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="mb-5">
                                                        <div class="text-center mb-4">
                                                            <a href="#!">
                                                                <img src="https://www.ometrics.com/blog/wp-content/uploads/2018/12/chatbot.png" alt="BootstrapBrain Logo" width="175" height="175">
                                                            </a>
                                                        </div>
                                                        <h2 class="h4 text-center">Password Reset</h2>
                                                        <h3 class="fs-6 fw-normal text-secondary text-center m-0">Provide the email address associated with your account to recover your password.</h3>
                                                    </div>
                                                </div>
                                            </div>
                                            <form action="change" method="post">
                                                <div class="row gy-3 overflow-hidden">
                                                    <div class="col-12">
                                                        <div class="form-floating mb-3">
                                                            <input type="text" class="form-control" name="password" required>
                                                            <label for="email" class="form-label">New Password</label>
                                                        </div>
                                                        <div class="form-floating mb-3">
                                                            <input type="text" class="form-control" name="repassword" required>
                                                            <label for="email" class="form-label">Re-Password</label>
                                                        </div>
                                                        <br><!-- comment -->
                                                        <a style="display: block; background-color: pink; text-align: center; padding: 10px;">${err}</a>

                                                    </div>
                                                    <div class="col-12">
                                                        <div class="d-grid">
                                                            <button class="btn btn-dark btn-lg" type="submit">Reset Password</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="d-flex gap-2 gap-md-4 flex-column flex-md-row justify-content-md-center mt-5">
                                                        <a href="login.jsp" class="link-secondary text-decoration-none">Login</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
