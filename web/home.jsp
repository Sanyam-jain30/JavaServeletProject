<%-- 
    Document   : home
    Created on : 25-Nov-2021, 6:10:55 pm
    Author     : SANYAM
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="homestyling.css" rel="stylesheet"/>
    </head>
    <body>
        <%-- (String.valueOf(session.getAttribute("got")).equals("1")) --%>
        <div class="nav">
            <h1>Electronic Items</h1>
            <div class="options">
                <% if(String.valueOf(session.getAttribute("got")).equals("1") && !String.valueOf(session.getAttribute("get")).equals("1")) {%>
                    <a class="book" href="newproduct.jsp">Manage products</a>
                <% } else { %>
                    <a class="book" href="superu.jsp">Super User</a>
                <% } %>
                <a class="book" href="payment.jsp">Payment</a>
                <a class="book" href="booked.jsp">My Bookings</a>
                <h2><%=(String)session.getAttribute("user")%></h2>
                <a class="book" href="login.jsp">Sign Out</a>
            </div>
        </div>
            <% 
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
                Statement s = con.createStatement();
                String s5 = "select * from product";
                PreparedStatement p1 = con.prepareStatement(s5);
                ResultSet rs1 = p1.executeQuery();
            %>
        <div class="products">
            <% while(rs1.next()){ %>
            <div class="card">
                <img src=<%= rs1.getString("url")%> alt="<%= rs1.getString("name")%>"/>
                <h2><%= rs1.getString("name")%></h2>
                <h2><%= rs1.getString("price")%></h2>
            </div>
            <% } %>
        </div>
    </body>
</html>
