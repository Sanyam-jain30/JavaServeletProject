<%-- 
    Document   : change
    Created on : 05-Dec-2021, 2:14:55 pm
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
            String pass = request.getParameter("pass");
            String cpass = request.getParameter("cpass");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/electronic","root","");
            Statement s = con.createStatement();
            
            if(cpass.equals(pass)){
                a=1;
            }
            
            String regex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$";
            
            Pattern pt = Pattern.compile(regex);
            Matcher m = pt.matcher(pass);
            
            if(m.matches()){
                a=2;
            }
            
            if(a==2){
                
                String s2 = "select * from superuser";
                PreparedStatement p1 = con.prepareStatement(s2);
                ResultSet rs1 = p1.executeQuery();

                while(rs1.next()){
                    String n = rs1.getString("name");
                    if(name.equals(n)){
                        String s3 = "update superuser set pass=? where name=?";
                        PreparedStatement p3 = con.prepareStatement(s3);
                        p3.setString(1, pass);
                        p3.setString(2, name);
                        p3.executeUpdate();
                        a=3;
                        break;
                    }
                }
                
                String s4 = "select * from user";
                PreparedStatement p4 = con.prepareStatement(s4);
                ResultSet rs4 = p4.executeQuery();

                while(rs4.next()){
                    String n = rs4.getString("name");
                    if(name.equals(n)){
                        String s6 = "update user set pass=? where name=?";
                        PreparedStatement p6 = con.prepareStatement(s6);
                        p6.setString(1, pass);
                        p6.setString(2, name);
                        p6.executeUpdate();
                        a=3;
                        break;
                    }
                }
            }
            
            if(a == 0){
        %>
            <h1>Confirm password does not match with given password!</h1>
        <%  } else if(a == 1) { %>
            <h1>Please enter a strong password!</h1>
        <%  } else if(a == 2) { %>
            <h1>Invalid name!</h1>
        <%    } else {
                response.sendRedirect("login.jsp");
            } 
        %>
    </body>
</html>
