<%-- 
    Document   : welcomesignup
    Created on : 22-Nov-2021, 5:53:29 pm
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
        <jsp:useBean id="Signupcheck" scope="request" class="beans.Signupadd"/>
        <jsp:setProperty name="Signupcheck" property="name"/>
        <jsp:setProperty name="Signupcheck" property="password"/>
        <jsp:setProperty name="Signupcheck" property="confirmPassword"/>
        <%
           int a = Signupcheck.add();
           String name = request.getParameter("name");
           session.setAttribute("user", name);
           session.setAttribute("got", "0");
           session.setAttribute("get", a);
           String err = Signupcheck.err();
        %>
        <% if(err == "" && a==1){ %>
            <jsp:forward page="home.jsp"/>
        <%} else{ %>
            <h1>Error: <%= err %></h1>
        <%}%>
    </body>
</html>
