<%-- 
    Document   : booked
    Created on : 26-Nov-2021, 11:15:34 am
    Author     : SANYAM
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bookings</title>
        <link href="final.css" rel="stylesheet"/>
    </head>
    <body>
        <% 
                String total = "";
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
                Statement s = con.createStatement();
                
                String s1 = "select * from customer";
                System.out.println("sucess");
                PreparedStatement p = con.prepareStatement(s1);
                ResultSet rs = p.executeQuery();

                while(rs.next()){
                    String n = rs.getString("name");
                    if((session.getAttribute("user")).equals(n)){
                        total = rs.getString("amount");
                        break;
                    }
                }
        %>
            
        <h2>Total amount: <%= total%></h2>
        <h1 class="un"><%= session.getAttribute("user")%></h1>
        <a class="book" href="login.jsp">Sign Out</a>
        <% 
            String s5 = "select * from product";
            PreparedStatement p1 = con.prepareStatement(s5);
            ResultSet rs1 = p1.executeQuery();
        %>
        <div class="lform">
            <h1>Book Product:</h1>
            <form action="addbooking.jsp">
                Product Name: <select name="product">
                    <% while(rs1.next()){ %>
                        <option><%= rs1.getString("name")%></option>
                    <% } %>
                </select><br/>
                Quantity: <input required="true" type="text" name="quantity"/><br/>
                <input class="button" type="submit" value="Book"/>
            </form>
        </div>
        <%
            PreparedStatement p2 = con.prepareStatement(s5);
            ResultSet rs2 = p2.executeQuery();
        %>
        <div class="rform">
            <h1>Cancel Booking:</h1>
            <form action="cancelbooking.jsp">
                Product Name: <select name="product">
                    <% while(rs2.next()){ %>
                        <option><%= rs2.getString("name")%></option>
                    <% } %>
                </select><br/>
                Quantity: <input required="true" type="text" name="quantity"/><br/>
                <input class="button" type="submit" value="Cancel"/>
            </form>
        </div>
        <jsp:include page="list.jsp"/>
    </body>
</html>
