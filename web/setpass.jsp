<%-- 
    Document   : setpass
    Created on : 04-Dec-2021, 10:27:46 pm
    Author     : SANYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Set Password</title>
        <link href="final.css" rel="stylesheet"/>
    </head>
    <body>
        <a class="book" href="login.jsp">Back</a>
        <div class="lform">
            <h1>Reset Password:</h1>
            <form action="reset.jsp">
                Name: <input type="text" name="name"/><br/>
                Previous password: <input type="password" name="prep"/><br/>
                New password: <input type="password" name="newp"/><br/>
                <input class="button" type="submit" value="Reset"/>
            </form>
        </div>
        <div class="rform">
            <h1>Change Password:</h1>
            <form action="change.jsp">
                Name: <input type="text" name="name"/><br/>
                New Password: <input type="password" name="pass"/><br/>
                Confirm Password: <input type="password" name="cpass"/><br/>
                <input class="button" type="submit" value="Change"/>
            </form>
        </div>
    </body>
</html>
