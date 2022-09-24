<%-- 
    Document   : itsme
    Created on : 05-Dec-2021, 2:51:00 pm
    Author     : SANYAM
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>It's Me</title>
        <link href="final.css" rel="stylesheet"/>
        <style>
            table{
                margin: auto;
            }
            td{
                padding: 5px 10px;
            }
        </style>
    </head>
    <body>
        <%
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
        %>
        <div class="lform">
            <h1>Booked Product:</h1>
            <% 
                String s1 = "select * from booking";
                PreparedStatement p1 = con.prepareStatement(s1);
                ResultSet rs1 = p1.executeQuery();
            %>
            <table>
                <tr>
                    <th>Customer name</th>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
                <% while(rs1.next()){ %>
                <tr>
                    <td><%= rs1.getString("name")%></td>
                    <td><%= rs1.getString("product")%></td>
                    <td><%= rs1.getString("value")%></td>
                    <td><%= rs1.getString("quantity")%></td>
                </tr>
                <% } %>
            </table>
        </div>
        
        <div class="rform">
            <h1>Products:</h1>
            <%
            String s2 = "select * from product";
            PreparedStatement p2 = con.prepareStatement(s2);
            ResultSet rs2 = p2.executeQuery();
            %>
            <table>
                <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>URL</th>
                </tr>
                <% while(rs2.next()){ %>
                <tr>
                    <td><%= rs2.getString("name")%></td>
                    <td><%= rs2.getString("price")%></td>
                    <td><%= rs2.getString("url")%></td>
                </tr>
                <% } %>
            </table>
        </div>
        
        <div class="lform" style="width: 100%; border: none">
            <h1>Customer Details:</h1>
            <% 
                String s3 = "select * from customer";
                PreparedStatement p3 = con.prepareStatement(s3);
                ResultSet rs3 = p3.executeQuery();
            %>
            <table>
                <tr>
                    <th>Name</th>
                    <th>Amount</th>
                </tr>
                <% while(rs3.next()){ %>
                <tr>
                    <td><%= rs3.getString("name")%></td>
                    <td><%= rs3.getString("amount")%></td>
                </tr>
                <% } %>
            </table>
        </div>
            
        <div class="lform">
            <h1>Super User:</h1>
            <% 
                String s4 = "select * from superuser";
                PreparedStatement p4 = con.prepareStatement(s4);
                ResultSet rs4 = p4.executeQuery();
            %>
            <table>
                <tr>
                    <th>Name</th>
                </tr>
                <% while(rs4.next()){ %>
                <tr>
                    <td><%= rs4.getString("name")%></td>
                </tr>
                <% } %>
            </table>
        </div>
        
        <div class="rform">
            <h1>User:</h1>
            <%
            String s5 = "select * from user";
            PreparedStatement p5 = con.prepareStatement(s5);
            ResultSet rs5 = p5.executeQuery();
            %>
            <table>
                <tr>
                    <th>Name</th>
                </tr>
                <% while(rs5.next()){ %>
                <tr>
                    <td><%= rs5.getString("name")%></td>
                </tr>
                <% } %>
            </table>
        </div>
    </body>
</html>
