<%-- 
    Document   : home
    Created on : 22-Nov-2021, 3:27:58 pm
    Author     : SANYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="casual.css" rel="stylesheet"/>
        <style>
            a{
                text-decoration: none;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>
        
        <form action="welcomelogin.jsp">
            <table>
                <tr>
                    <th colspan="2"><h1>Login</h1></th>
                </tr>
                <tr>
                    <td>Username:</td>
                    <td><input required="true" type="text" name="name"/></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input required="true" type="password" name="password"/></td>
                </tr>
                <tr>
                    <td style="text-align: center;"><input class="button" type="submit" value="Login"/></td>
                    <td style="text-align: center;"><a class="button" href="setpass.jsp">Set Password</a></td>
                </tr>
            </table>
        </form>
    </body>
</html>
