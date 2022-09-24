<%-- 
    Document   : welcome
    Created on : 22-Nov-2021, 3:38:20 pm
    Author     : SANYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="loginchecking" scope="request" class="beans.Logincheck"/>
        <jsp:setProperty name="loginchecking" property="name"/>
        <jsp:setProperty name="loginchecking" property="password"/>
        <%
           int a = loginchecking.check();
           String name = request.getParameter("name");
           session.setAttribute("user", name);
           session.setAttribute("get", "0");
           session.setAttribute("got", a);
        %>
        <% if(a > 0){ %>
            <jsp:forward page="home.jsp"/>
        <%} else{ %>
            <h1>Error: Please enter a valid username and password!</h1>
        <% } %>
    </body>
</html>
