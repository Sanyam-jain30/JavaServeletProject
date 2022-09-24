<%-- 
    Document   : pay
    Created on : 03-Dec-2021, 1:33:49 pm
    Author     : SANYAM
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
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
        <jsp:useBean id="Payment" scope="request" class="beans.Payment"/>
        <jsp:setProperty name="Payment" property="name" value="<%= name %>"/>
        <jsp:setProperty name="Payment" property="amount"/>
        <jsp:setProperty name="Payment" property="type"/>
        <%
           String a = Payment.pay();
           String err = Payment.err();
        %>
        <% if(err == ""){ %>
            <h1>Total amount paid is: <%= a %></h1>
        <%} else{ %>
            <h1>Error: <%= err %></h1>
        <% } %>
    </body>
</html>
