<%-- 
    Document   : admin
    Created on : Apr 22, 2024, 10:00:25 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello Admin!</h1>
        <form action="admin" method="post">
            <table border="1">
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Email</th>
                        <th>Select</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${list}" var="user">
                        <tr>
                            <td>${user.username}</td>
                            <td>${user.password}</td>
                            <td>${user.email}</td>
                            <td><a href="admin?mode=1&name=${user.username}">Select</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>
            <br>
            <br>
            <form action="admin" method="post">
                <!-- Existing code -->
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Username</td>
                            <td><input type="text" name="name" value="${u.username}" readonly></td>
                        </tr>
                        <tr>
                            <td>Password</td>
                            <td><input type="text" name="password" value="${u.password}"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" value="${u.email}"></td>
                        </tr>
                        <tr>
                            <td><a style="color: crimson; font-size: 20px">${mess}</a></td>
                            <!-- Add hidden input fields for passing parameters -->
                            <td>
                                <input type="hidden" name="mode" value="1">
                                <input type="hidden" name="edit" value="true">
                                <input type="submit" value="Edit">
                            </td>
                            <td>
                                <input type="hidden" name="mode" value="1">
                                <input type="submit" name="delete" value="Delete">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>

        </form>
    </body>
</html>
