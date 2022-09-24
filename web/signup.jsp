<%-- 
    Document   : signup
    Created on : 22-Nov-2021, 5:39:50 pm
    Author     : SANYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link href="casual.css" rel="stylesheet"/>
    </head>
    <body>
        <form action="welcomesignup.jsp" method="get">
            <table>
                <tr>
                    <th colspan="2"><h1>Sign Up</h1></th>
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
                    <td>Confirm Password:</td>
                    <td><input required="true" type="password" name="confirmPassword"/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;"><input class="button" type="submit" value="SignUp"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
