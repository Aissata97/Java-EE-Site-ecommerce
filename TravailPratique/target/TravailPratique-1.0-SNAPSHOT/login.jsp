<%-- 
    Document   : login
    Created on : May 18, 2020, 11:01:22 AM
    Author     : aouattar
--%>

<%@page import="managers.CookieManager"%>
<%@page import="actions.ClientAction"%>
<%@page import="utils.Validation" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>

<% String erreurClient = (String)request.getAttribute(ClientAction.erreurClient);
    String msgLoginRequis = (String) request.getAttribute(Validation.msgLoginRequis);
    Cookie email = CookieManager.getCookyByNom(request, "email");
    Cookie mdp = CookieManager.getCookyByNom(request, "mdp");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/login.css" >
        <%@include file="includes/head.jsp" %>       
    </head>
    <body>
        <%@include file="includes/header.jsp" %>
        <form action="clientControler" method="post">
            <div class="imgcontainer">
                <img src="images/login-icon.png" alt="Avatar" class="avatar">
            </div>
            
            <% out.println((msgLoginRequis == null) ? "<p></p>" : "<p style='color:red; text-align:center;'>" + msgLoginRequis + "</p>"); %>

            <div class="container">
                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Entrez votre email" name="email" value="<%out.print( (email != null) ? email.getValue() : ""); %>" required>

                <label for="mdp"><b>Mot de passe</b></label>
                <input type="password" placeholder="Entrez votre mot de passe" name="mdp" value="<%out.print( (mdp != null) ? mdp.getValue() : ""); %>" required>

                <button type="submit">Connexion</button>
                <label>
                    <input type="checkbox" checked="checked" name="souvenir"> Se souvenir de moi
                </label>
            </div>
            <% out.println( (erreurClient == null) ? "<p></p>" : "<p style='color:red; text-align:center;'>"+ erreurClient + "</p>"); %>

            <div class="container" style="background-color:#f1f1f1">
                <span class="psw">Vous n'avez pas de compte ? <a href="inscription.jsp">Inscription</a></span>
            </div>
        </form>
    </body>
</html>
