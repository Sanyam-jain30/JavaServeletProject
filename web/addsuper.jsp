<%-- 
    Document   : addsuper
    Created on : 03-Dec-2021, 11:59:21 am
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
        <%  int a=0;
            String pass = "";
            String name = (String)session.getAttribute("user"); 
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
            String s1 = "select * from customer";
            System.out.println("sucess");
            PreparedStatement p = con.prepareStatement(s1);
            ResultSet rs = p.executeQuery();

            while(rs.next()){
                String n = rs.getString("name");
                String am = rs.getString("amount");
                if(name.equals(n) && am.equals("Rs. 0")){
                    a=1;
                    break;
                }
            }
            if(a==1) {
                String s4 = "select * from user";
                PreparedStatement p4 = con.prepareStatement(s4);
                ResultSet rs4 = p4.executeQuery();

                while(rs4.next()){
                    String n = rs4.getString("name");
                    if(name.equals(n)){
                        pass = rs4.getString("pass");
                        break;
                    }
                }
                
                String s5 = "update customer set amount=? where name=?";
                PreparedStatement p5 = con.prepareStatement(s5);
                p5.setString(1, "Rs. 45,000");
                p5.setString(2, name);
                p5.executeUpdate();
                
                String s2 = "insert into superuser(name, pass)" + "values(?,?)";
                PreparedStatement p2 = con.prepareStatement(s2);
                p2.setString(1, name);
                p2.setString(2, pass);
                p2.executeUpdate();
                
                String s3 = "delete from user where name=?";
                PreparedStatement p3 = con.prepareStatement(s3);
                p3.setString(1, name);
                p3.executeUpdate();
                response.sendRedirect("login.jsp");
            }
            else {
        %>
            <h1> Please first clear your remaining amount! </h1>
        <% } %>
    </body>
</html>
