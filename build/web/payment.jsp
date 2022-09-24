<%-- 
    Document   : payment
    Created on : 03-Dec-2021, 12:58:58 pm
    Author     : SANYAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment</title>
        <link href="casual.css" rel="stylesheet"/>
    </head>
    <body>
        <form action="pay.jsp">
            <table>
                <tr>
                    <th colspan="2"><h1>Payment</h1></th>
                </tr>
                <tr>
                    <td>Amount: </td>
                    <td><input required="true" type="text" name="amount" placeholder="Rs. 15,000"/></td>
                </tr>
                <tr>
                    <td>Payment Type: </td>
                    <td>
                        <select name="type">
                            <option>Check</option>
                            <option>Cash</option>
                            <option>Credit Card</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;"><input class="button" type="submit" value="Pay"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
