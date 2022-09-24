<%-- 
    Document   : list
    Created on : 28-Nov-2021, 12:58:57 pm
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
        <link href="final.css" rel="stylesheet"/>
    </head>
    <body>
        <div class="booked">
            <h1>Items you booked:</h1>
            <% 
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
                Statement s = con.createStatement();
                String s5 = "select * from booking";
                PreparedStatement p1 = con.prepareStatement(s5);
                ResultSet rs1 = p1.executeQuery();
            %>
            <table>
                <tr>
                    <th>Product name</th>
                    <th>Quantity</th>
                </tr>
                <% while(rs1.next()){
                      if(rs1.getString("name").equals(session.getAttribute("user"))){ %>
                <tr>
                    <td><%= rs1.getString("product")%></td>
                    <td><%= rs1.getString("quantity")%></td>
                </tr>
                <% }} %>
            </table>
        </div>
    </body>
</html>
