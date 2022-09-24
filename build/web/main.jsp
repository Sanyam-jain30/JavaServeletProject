<%-- 
    Document   : main
    Created on : 25-Nov-2021, 8:55:15 pm
    Author     : SANYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
    <style>
        .main{
            display: block;
            top: 40%;
            left: 50%;
            position: absolute;
            width: max-content;
            margin: auto;
            text-align: center;
            transform: translate(-50%, -50%);
        }
        a{
            text-decoration: none;
            background-color: green;
            border: none;
            color: white;
            margin: 0 10px;
            padding: 10px 20px;
            border-radius: 5px;
            box-shadow: 0 0 40px 40px #3498db inset,
                        0 0 0 0 #3498db;
            transition: all 150ms ease-in-out;
        }
        a:hover{
            cursor: pointer;
            background-color: black;
            box-shadow: 0 0 10px 0 #3498db inset,
                        0 0 10px 4px #3498db;
        }
        .bottom{
            position: fixed;
            bottom: 0;
            width: 100%;
            text-align: center;
            color: blue;
            font-family: 'Courgette', cursive;
        }
        .book{
            text-decoration: none;
            margin-top: 5px;
            margin-right: 20px;
            float: right;
            background-color: white;
            padding: 20px;
            border-radius: 2rem;
            transition: all 1s ease-in-out;
        }
        .book:hover{
            transform: scale(1.1);
            color: white;
            background-color: black;
        }
    </style>
    </head>
    <body>
        <a class="book" href="itsme.jsp">It's Me</a>
        <div class="main">
            <h1>Welcome To Electronic Items Booking and Management</h1>
            <p>Which would you like to do:</p>
            <a href="login.jsp">Login</a>
            <a href="signup.jsp">SignUp</a>
        </div>
        <div class="bottom">
            <h2>By Sanyam Jain 20BIT0428</h2>
        </div>
    </body>
</html>
