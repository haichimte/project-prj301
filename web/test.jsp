<%-- 
    Document   : test
    Created on : Dec 4, 2023, 11:52:33 PM
    Author     : Thanh Hai
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="authour" items="${requestScope.listProductstry}">
                    <tr>
                        <td>${authour.Id}</td>
                        <td>${authour.name()}</td>
                    </tr
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
