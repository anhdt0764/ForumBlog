<%-- 
    Document   : AddPost
    Created on : Apr 23, 2024, 11:15:29 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/site.css">
    </head>
    <body>
        <form action="createpost" method="post">
            <div class="container">
                <div class="row" id="row_style">
                    <h4 class="text-center">New post</h4>
                    <div class="col-md-4   col-md-offset-4">
                        <div class="form-group">
                            <input type="text" name="title" class="form-control" required placeholder="Title">
                        </div>
                        <textarea id="editor" cols="30" rows="10" name="content" required placeholder="Enter content here"></textarea>
                        <br>
                        <div class="form-group">
                            <input type="text" class="form-control" required placeholder="Tags" name="tag">
                        </div>
                        <div class="form-group">
                            <input type="submit" class="btn btn-primary" id="submit" value="Post now">
                        </div>
                    </div>
                </div>
            </div>

            <style>
                #row_style {
                    margin-top: 30px;
                }

                #submit {
                    display: block;
                    margin: auto;
                }
            </style>

            <!-- you need to include the shieldui css and js assets in order for the charts to work -->
            <link rel="stylesheet" type="text/css" href="https://www.shieldui.com/shared/components/latest/css/light/all.min.css" />
            <script type="text/javascript" src="https://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>

            <script>
                $(function () {
                    $("#editor").shieldEditor({
                        height: 260
                    });
                })
            </script>
        </form>
    </body>
</html>
