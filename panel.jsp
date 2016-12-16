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
		<form method="POST" action="auth.jsp">
			<label>ID etudiant : </label><input type="text" name="id" /><br />
			<label>Libelle : </label><input type="text" name="libelle" /><br />
			<label>Date debut : </label><input type="date" name="dateDeb" /><br />
			<label>Date fin : </label><input type="date" name="dateFin" /><br />
			<input type="submit" value="Entrer" name="submitR" />
		</form>
	</nav>
	<%
		} else if (curUser.getRole().equals("etudiant")) {
				out.println(absBdd.findAllAbs(curUser.getId()));
			} else if (curUser.getRole().equals("enseignant")) {
	%>
	<h2 id="inscr">Absence</h2>
	<nav id="Inscription">
		<form method="POST" action="auth.jsp">
			<label>Nom : </label><input type="text" name="id" /><br /> 
			<label>prenom: </label><input type="text" name="libelle" /><br /> 
			<label>Date: </label> <br>
			<label> Matin </label><input type="checkbox" name="date" /><br /> 
			<label> Après-midi </label><input type="checkbox" name="date" /><br /> 
			<input type="submit" value="Entrer" name="submitR" />
		</form>
	</nav>
	<%
		} else {
				response.sendRedirect("index.jsp");
			}
		}
	%>

</body>
</html>