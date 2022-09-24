<%-- 
    Document   : addpro
    Created on : 02-Dec-2021, 9:23:36 pm
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
        <jsp:useBean id="Addproduct" scope="request" class="beans.Addproduct"/>
        <jsp:setProperty name="Addproduct" property="url"/>
        <jsp:setProperty name="Addproduct" property="name"/>
        <jsp:setProperty name="Addproduct" property="value"/>
        <% int a = Addproduct.add(); %>
        <% String err = Addproduct.err(); %>
        <% if(a==1) { 
            response.sendRedirect("home.jsp");
            } else { %>
            <h1> Error: <%= err %> </h1>
          <% } %>
    </body>
</html>
