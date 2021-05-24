<%-- 
    Document   : contatos
    Created on : 18 de mai. de 2021, 17:54:30
    Author     : cutekah
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="br.edu.fatecpg.web.Database"%>
<%@page import="br.edu.fatecpg.web.Contato"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
    if(request.getParameter("contato.add") != null) {
        String name = request.getParameter("user.name");
        String telefone = request.getParameter("user.telefone");
        String email = request.getParameter("user.email");    
        Contato newContato = new Contato(name, telefone, email);
        Database.addContato(newContato);
        response.sendRedirect(request.getRequestURI());
    } else if(request.getParameter("contato.remove") != null)  {
        String nome = request.getParameter("user.name");
        Database.removeContato(nome);
        response.sendRedirect(request.getRequestURI());
    }
    
    ArrayList<Contato> contatos = Database.getContatos();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MY SUPER APP CONTATOS</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <h2>CONTATOS</h2>
        <% if(!"Administrador".equals(session.getAttribute("session.name"))) { %>
            <p>Sem permissão de acesso!</p>
        <% } else { %>
        <form>
            Nome: <input type="text" name="user.name"/>
            Telefone: <input type="text" name="user.telefone"/>
            Email: <input type="text" name="user.email"/>
            <input type="submit" name="contato.add"/>
        </form>
        <hr>
        <table border="1">
            <tr>
                <th>Nome</th>
                <th>Telefone</th>
                <th>Email</th>
                <th>Excluir</th>
            </tr>
            <% for(Contato contato: contatos) { %>
            <tr>
                <td><%= contato.getName() %></td>
                <td><%= contato.getTelefone() %></td>
                <td><%= contato.getEmail() %></td>
                <td>
                    <form>
                        <input type="hidden" name="user.name" value="<%= contato.getName() %>"/>
                        <input type="submit" name="contato.remove" value="Excluir"/>
                    </form>
                </td>
            </tr>  
            <% } %>
        </table>
        <% } %>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>