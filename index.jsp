<%@ page pageEncoding="utf-8"%>
<%@ page import="javax.servlet.*,java.sql.*,java.io.*"%>

<!DOCTYPE html>
<html lang='fr'>
<link rel="stylesheet" href="style2.css" />
<head>
<title>Accueil</title>
</head>
<header>
	<h1 id="titre">Bienvenue sur IUT Absence</h1>
	<p id="presentation">IUT Absence est un logiciel pour faciliter la
		comptabilité des absences.</p>
	<p id="presentation">Vous êtes étudiants et inscrit à l'IUT, entrer
		votre identifiant, mot de passe et pour le rôle, entrer étudiant.</p>
	<p id="presentation">Vous êtes secrétaire à l'IUT, entrer votre
		identifiant, mot de passe et pour le rôle, entrer secrétaire.</p>
	<p id="presentation">Vous êtes professeurs à l'IUT, entrer votre
		identifiant, mot de passe et pour le rôle, entrer professeur.</p>
	<p id="presentation">Si vous n'êtes pas encore inscrit vous pouvez
		le faire à l'aide du formulaire d'insciption.</p>
</header>
<body>
	<%
		// CI-DESSOUS ON AFFICHE LES RESULTATS DE L'INSCRIPTION

		if (request.getParameter("success") != null && request.getParameter("success").equals("1")) {
			out.println("<h3 style='color:green;'>Vous êtes désormais inscrit dans la base de donnée.</h3>");
		} else if (request.getParameter("error") != null && request.getParameter("error").equals("1")) {
			out.println("<h3 style='color:red;'>Veuillez saisir tout les champs.</h3>");
		} else if (request.getParameter("error") != null && request.getParameter("error").equals("2")) {
			out.println("<h3 style='color:red;'>Pseudo déja pris.</h3>");
		} else if (request.getParameter("error") != null && request.getParameter("error").equals("3")) {
			out.println("<h3 style='color:red;'>Erreur survenue avec la base de donnée.</h3>");
		} else if (request.getParameter("error") != null && request.getParameter("error").equals("4")) {
			out.println("<h3 style='color:red;'>Erreur utilisateur introuvable.</h3>");
		}
	%>

	<div class="form-style-2">
		<div class="form-style-2-heading">Inscription</div>
		<form method="POST" action="auth.jsp">
			<label for="field1"><span>Identifiant <span class="required"></span></span><input type="text" class="input-field" name="pseudo" /></label><br/>
			<label for="field2"><span>Mot de passe <span class="required"></span></span><input type="password" class="input-field" name="password" /></label><br/>
			<label for="field2"><span>Prenom <span class="required"></span></span><input type="text" class="input-field" name="prenom" /></label><br/>
			<label for="field2"><span>Nom <span class="required"></span></span><input type="text" class="input-field" name="nom" /></label><br/>
				<label for="field4"><span>Role</span> </label>
				<select name="role" class="select-field">
					<option value="etudiant">Etudiant </option>
					<option value="secretaire">Secretaire </option>
					<option value="enseignant">Professeur </option>
				</select> <br>
				<input type="submit" value="Entrer" name="submitR" />
		</form>
	</div>

	<br />
	
	<div class="form-style-3">
		<div class="form-style-3-heading">Connexion</div>
		<form method="POST" action="auth.jsp">
			<label for="field1"><span>Identifiant <span class="required"></span></span><input type="text" class="input-field" name="pseudo" /></label><br/>
			<label for="field2"><span>Mot de passe <span class="required"></span></span><input type="password" class="input-field" name="password" /></label><br/>
			<input type="submit" value="Entrer" name="submitL" />
		</form>
	</div>
</body>
</html>