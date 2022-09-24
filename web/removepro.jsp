<%-- 
    Document   : removepro
    Created on : 03-Dec-2021, 10:46:55 am
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
        <% String name = (String)session.getAttribute("user"); %>
        <h1><%= "name is " + name %></h1>
        <jsp:useBean id="Removeproduct" scope="request" class="beans.Addproduct"/>
        <jsp:setProperty name="Removeproduct" property="name"/>
        <% int a = Removeproduct.remove(); %>
        <% String err = Removeproduct.err(); %>
        <% if(a==1) { 
            response.sendRedirect("home.jsp");
            } else { %>
            <h1> Error: <%= err %> </h1>
        <% } %>
    </body>
</html>
