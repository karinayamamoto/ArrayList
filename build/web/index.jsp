<%-- 
    Document   : index
    Created on : 17 de mai. de 2021, 15:24:34
    Author     : cutekah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MY  SUPER APP</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>Início</h2>
        <%if (session.getAttribute("session.name")==null){%>
            <p>Sem permissão de acesso!</p>
        <%} else {%>
            <p>Blablabla...</p>
        <%}%>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>