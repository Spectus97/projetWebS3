<%@ page pageEncoding="utf-8" %>
<%@ page import="javax.servlet.*,java.sql.*,java.io.*"  %>

<!DOCTYPE html>
<html lang='fr'>
<link rel="stylesheet" href="style.css" />
	<head>
		<title>Accueil</title>
	</head>
	<header>
		<h1 id="titre"> Bienvenue sur IUT Absence </h1>
		<p id="presentation">IUT Absence est un logiciel pour faciliter la comptabilité des absences.</p>
		<p id="presentation" > Vous êtes étudiants et inscrit à l'IUT, entrer votre identifiant, mot de passe et pour le rôle,
		entrer étudiant.</p>
		<p id="presentation"> Vous êtes secrétaire à l'IUT, entrer votre identifiant, mot de passe et pour le rôle,
		entrer secrétaire.</p>
		<p id="presentation"> Vous êtes professeurs à l'IUT, entrer votre identifiant, mot de passe et pour le rôle,
		entrer professeur. </p>
		<p id="presentation"> Si vous n'êtes pas encore inscrit vous pouvez le faire à l'aide du formulaire d'insciption. </p>
	</header>
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
		}else if(request.getParameter("error") != null && request.getParameter("error").equals("4")){
			out.println("<h3 style='color:red;'>Erreur utilisateur introuvable.</h3>");
		}
		
		%>
	
		<h2 id="inscr"> Inscription </h2>
		<nav id="Inscription">
			<form method="POST" action="auth.jsp">
				<label>Identifiant : </label><input type="text" name="pseudo" /><br/>
				<label>Mot de passe : </label><input type="password" name="password" /><br/>
				<label>Prenom : </label><input type="text" name="prenom" /><br/>
				<label>Nom : </label><input type="text" name="nom" /><br/>
				<label>Role : </label>
				<select name="role" id="role">
					<option value="etudiant"> Etudiant </option>
					<option value="secretaire"> Secretaire</option>
					<option value="prof"> Professeur</option>
				</select> <br>
				<input type="submit" value="Entrer" name="submitR" />
			</form>
		</nav>
		<br/>
		<h2 id="conn"> Connexion </h2>
		<nav id="Connexion">
			<form method="POST" action="auth.jsp">
				<label>Identifiant : </label><input type="text" name="pseudo" /><br/> 
				<label>Mot de passe : </label><input type="password" name="password" /><br/>
				<input type="submit" value="Entrer" name="submitL" />
			</form>
		</nav>
	</body>
</html>