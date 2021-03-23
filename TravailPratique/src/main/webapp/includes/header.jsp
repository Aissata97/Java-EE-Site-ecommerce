<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="actions.CategorieAction"%>
<%@page import="entities.Categorie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="managers.SessionManager" %>
<% CategorieAction.afficherToutesLesCategorie(request);
    ArrayList<Categorie> listCategorie = (ArrayList<Categorie>) request.getAttribute("listeCategorie");
%>

<header>
    <img src="images/images.png" alt="pure Phone">
    <b>Pure Phone</b>
</header>

<nav>
    <a class="a_nav" href="pagesControler?action=home"><b>Home</b></a>
    <a class="a_nav" href="produitControler"><b>Catalogue</b></a>
    <a class="a_nav" href="pagesControler?action=galerie"><b>Gallerie</b></a>
    <div class="subnav">
        <button class="subnavbtn">Categories<i class="fa fa-caret-down"></i></button>
        <div class="subnav-content">
            <% for (Categorie categorie : listCategorie ) { %>
            <a href="produitControler?idCategorie=<%=categorie.getId_categorie()%>"><%=categorie.getNom_categorie()%></a>
            <%}%>
        </div>
    </div>
        
    <%= (SessionManager.getByKey(request, true, "sessionClient") == null) ? "<a class=\"a_nav2\" href=\"pagesControler?action=connexion\"><i class=\"fa fa-fw fa-user\"></i> Connexion</a>" : "<a class=\"a_nav2\" href=\"pagesControler?action=deconnexion\"><i class=\"fa fa-fw fa-user\"></i> Deconnexion</a>" %>    
    <a class="a_nav2" href="pagesControler?action=panier"><i class="fa fa-shopping-cart"></i>Panier</a>
    <%= (SessionManager.getByKey(request, true, "sessionClient") == null) ? "" : "<a class=\"a_nav2\" href=\"commandeControler?action=commandes\"><i class=\"fa fa-shopping-cart\"></i>Mes commandes</a>" %>
</nav>
