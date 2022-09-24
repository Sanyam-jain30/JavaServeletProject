<%-- 
    Document   : newproduct
    Created on : 02-Dec-2021, 9:20:51 pm
    Author     : SANYAM
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Product</title>
        <link href="final.css" rel="stylesheet"/>
    </head>
    <body>
        <% 
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
                Statement s = con.createStatement();
        %>
        <h1 class="un"><%= session.getAttribute("user")%></h1>
        <a class="book" href="login.jsp">Sign Out</a>
        <div class="lform">
            <h1>New Product:</h1>
            <form action="addpro.jsp">
                Image URL: <input required="true" type="url" name="url" placeholder="https://xyz.com"/><br/>
                Product name: <input required="true" type="text" name="name" placeholder="Mobile Phone"/><br/>
                Product Price: <input required="true" type="text" name="value" placeholder="Rs. 20,000"/><br/>
                <input class="button" type="submit" value="Add"/>
            </form>
        </div>
        <%
            String s5 = "select * from product";
            PreparedStatement p2 = con.prepareStatement(s5);
            ResultSet rs2 = p2.executeQuery();
        %>
        <div class="rform">
            <h1>Remove Product:</h1>
            <form action="removepro.jsp">
                Product Name: <select name="name">
                    <% while(rs2.next()){ %>
                        <option><%= rs2.getString("name")%></option>
                    <% } %>
                </select><br/>
                <input class="button" type="submit" value="Remove"/>
            </form>
        </div>
    </body>
</html>
