<%-- 
    Document   : reset
    Created on : 04-Dec-2021, 10:34:22 pm
    Author     : SANYAM
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.util.regex.Matcher,java.util.regex.Pattern" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int a=0;
            String name = request.getParameter("name");
            String prep = request.getParameter("prep");
            String newp = request.getParameter("newp");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
            
            String regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$";
            
            Pattern pt = Pattern.compile(regex);
            Matcher m = pt.matcher(newp);
            
            if(m.matches()){
                a=1;
            }
            
            if(a==1){
                String s1 = "select * from superuser";
                PreparedStatement p = con.prepareStatement(s1);
                ResultSet rs = p.executeQuery();

                while(rs.next()){
                    String n = rs.getString("name");
                    String pass = rs.getString("pass");
                    if(name.equals(n) && prep.equals(pass)){
                        String s6 = "update superuser set pass=? where name=?";
                        PreparedStatement p6 = con.prepareStatement(s6);
                        p6.setString(1, newp);
                        p6.setString(2, name);
                        p6.executeUpdate();
                        a=2;
                        break;
                    }
                }

                String s2 = "select * from user";
                PreparedStatement p1 = con.prepareStatement(s2);
                ResultSet rs1 = p1.executeQuery();

                while(rs1.next()){
                    String n = rs1.getString("name");
                    String pass = rs1.getString("pass");
                    if(name.equals(n) && prep.equals(pass)){
                        String s6 = "update user set pass=? where name=?";
                        PreparedStatement p6 = con.prepareStatement(s6);
                        p6.setString(1, newp);
                        p6.setString(2, name);
                        p6.executeUpdate();
                        a=2;
                        break;
                    }
                }
            }
            
            if(a == 1){
        %>
            <h1>Invalid name/previous password!</h1>
        <% } else if(a == 0){ %>
            <h1>Please enter a strong password!</h1>
        <%  } else {
            response.sendRedirect("login.jsp");
            } 
        %>
    </body>
</html>
