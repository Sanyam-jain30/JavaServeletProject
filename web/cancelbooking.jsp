<%-- 
    Document   : cancelbooking
    Created on : 26-Nov-2021, 11:22:13 am
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
        <jsp:useBean id="Removebooking" scope="request" class="beans.Bookings"/>
        <jsp:setProperty name="Removebooking" property="name" value="<%= name %>"/>
        <jsp:setProperty name="Removebooking" property="product"/>
        <jsp:setProperty name="Removebooking" property="quantity"/>
        <% int a = Removebooking.remove(); %>
        <% String err = Removebooking.err(); %>
        <% if(err == "") { %>
            <% response.sendRedirect("booked.jsp"); %>
        <% } else { %>
            <h1><%= "Error: " + err %></h1>
        <% } %>
    </body>
</html>
