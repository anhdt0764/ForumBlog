<%-- 
    Document   : user
    Created on : Apr 22, 2024, 10:52:20 PM
    Author     : Administrator
--%>
<%@ page import="DAO.MyDAO, models.Users" %>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/site.css">
    </head>
    <body>

        <%
        /* Checking the user credentials */
        String username = (String) session.getAttribute("username");
        String password = (String) session.getAttribute("password");

        // Check if session attributes exist and are not null
        if (username == null || password == null || username.isEmpty() || password.isEmpty()) {
            response.sendRedirect("login.jsp?mess=User Not Found");
        } else {
            MyDAO dao = new MyDAO();
            Users user = dao.getUser(username, password);
            if(user == null) {
                response.sendRedirect("login.jsp");
            }
        }
        %>


        <div class="container height-100 d-flex justify-content-center align-items-center">
            <div class="card text-center">
                <div class="py-4 p-2">
                    <div>
                        <img src="https://th.bing.com/th/id/OIP.LfUcKCHKBamgN20k7KQWeAHaHT?w=206&h=204&c=7&r=0&o=5&dpr=1.3&pid=1.7" class="rounded" width="100">
                    </div>
                    <div class="mt-3 d-flex flex-row justify-content-center">
                        <h5>Hello ${user.getUsername()}</h5>
                        <span class="dots"><i class="fa fa-check"></i></span>
                    </div>
                    <span>Email: ${user.getEmail()}</span><br>
                    <span>Password: ${user.getPassword()}</span>
                    <div class="mt-3">
                        <button class="btn btn-danger">Follow</button>
                        <button class="btn btn-outline-secondary"><i class="fa fa-users"></i> 451</button>
                    </div>
                </div>
                <div>
                    <ul class="list-unstyled list">
                        <li>
                            <span class="font-weight-bold">Post</span>
                            <div>
                                <span class="mr-1">5</span>
                                <i class="fa fa-angle-right"></i>
                            </div>
                        </li>
                        <li>
                            <span class="font-weight-bold">Comments</span>
                            <div>
                                <span class="mr-1">45</span>
                                <i class="fa fa-angle-right"></i>
                            </div>
                        </li>
                        <li>
                            <span class="font-weight-bold">Favorites</span>
                            <div>
                                <span class="mr-1">15</span>
                                <i class="fa fa-angle-right"></i>
                            </div>
                        </li>
                    </ul>
                </div>
                <div><p><button onclick='window.history.go(-1);'>Back to previous page</button></div>
            </div>

        </div>
    </body>
</html>
