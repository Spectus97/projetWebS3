<%@ page pageEncoding="utf-8"%>
<%@ page import="projetS3.*,javax.servlet.*,java.sql.*,java.io.*"%>

<!DOCTYPE html>
<html lang='fr'>
<link rel="stylesheet" href="style.css" />
<head>
<title>Panel</title>
</head>

<body>
	<%
		// On gere la session ici, si l'user is logged alors redirect
		User curUser = (User) session.getAttribute("utilisateur");
		if (curUser == null) {
			response.sendRedirect("index.jsp");
		} else {
			AbsDAO absBdd = new AbsDAO();

			if (curUser.getRole().equals("secretaire")) {
	%>
	<h2 id="inscr">Justification</h2>
	<nav id="Inscription">
		<form method="POST" action="justif.jsp">
			<label>Nom : </label><input type="text" name="nom" /><br /> 
			<label>prenom: </label><input type="text" name="prenom" /><br /> 
			<label>Libelle : </label><input type="text" name="libelle" /><br />
			<label>Date debut : </label><input type="date" name="dateDeb" /><br />
			<label>Date fin : </label><input type="date" name="dateFin" /><br />
			<input type="submit" value="Entrer" name="submitJ" />
		</form>
	</nav>
	<%
		} else if (curUser.getRole().equals("etudiant")) {
				out.println(absBdd.findAllAbs(curUser.getId()));
			} else if (curUser.getRole().equals("enseignant")) {
			
	%>
	<h2 id="inscr">Absence</h2>
	<nav id="Inscription">
		<form method="POST" action="abs.jsp">
			<label>Nom : </label><input type="text" name="nom" /><br /> 
			<label>prenom: </label><input type="text" name="prenom" /><br /> 
			<label>Cours: </label><input type="text" name="cours"/><br/>
			<label>Date: </label><input type="date" name="date" /><br /> <br>
			<label> Matin </label><input type="checkbox" name="matin" /><br /> 
			<label> Après-midi </label><input type="checkbox" name="aprem" /><br /> 
			<input type="submit" value="Entrer" name="submitA" />
		</form>
	</nav>
	<%
		} else {
				response.sendRedirect("index.jsp");
			}
		}
	%>
	<a href="index.jsp"> Déconnecter </a>
</body>
</html>