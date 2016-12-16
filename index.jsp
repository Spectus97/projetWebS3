<%@ page pageEncoding="utf-8" %>
<%@ page import="javax.servlet.*,java.sql.*,java.io.*"  %>

<!DOCTYPE html>
<html lang='fr'>
	<head>
		<title>Accueil</title>
	</head>
	
	<body>
	
		<% 
			// CI-DESSOUS ON AFFICHE LES RESULTATS DE L'INSCRIPTION
		
		if(request.getParameter("success") != null && request.getParameter("success").equals("1")){
			out.println("<h3 style='color:green;'>Vous êtes désormais inscrit dans la base de donnée.</h3>");
		}else if(request.getParameter("error") != null && request.getParameter("error").equals("1")){
			out.println("<h3 style='color:red;'>Veuillez saisir tout les champs.</h3>");
		}else if(request.getParameter("error") != null && request.getParameter("error").equals("2")){
			out.println("<h3 style='color:red;'>Pseudo déja pris.</h3>");
		}else if(request.getParameter("error") != null && request.getParameter("error").equals("3")){
			out.println("<h3 style='color:red;'>Erreur survenue avec la base de donnée.</h3>");
		}
		
		%>
	
		<nav id="Inscription">
			<form method="POST" action="auth.jsp">
				<label>Pseudo : </label><input type="text" name="pseudo" /><br/>
				<label>Password : </label><input type="password" name="password" /><br/>
				<label>Prenom : </label><input type="text" name="prenom" /><br/>
				<label>Nom : </label><input type="text" name="nom" /><br/>
				<label>Role : </label><input type="text" name="role" /><br/>
				<input type="submit" value="Inscription" name="submitR" />
			</form>
		</nav>
		<br/>
		<nav id="Connexion">
			<form method="POST" action="auth.jsp">
				<label>Pseudo : </label><input type="text" name="pseudo" /><br/> 
				<label>Password : </label><input type="password" name="password" /><br/>
				<input type="submit" value="Connexion" name="submitL" />
			</form>
		</nav>
	</body>
</html>