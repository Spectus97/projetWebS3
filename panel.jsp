<%@ page pageEncoding="utf-8" %>
<%@ page import="projetS3.*,javax.servlet.*,java.sql.*,java.io.*"  %>

<!DOCTYPE html>
<html lang='fr'>
	<head>
		<title>Panel</title>
	</head>
	
	<body>
		<%
		
		// On gere la session ici, si l'user is logged alors redirect
		User curUser = (User)session.getAttribute("utilisateur");
		if(curUser == null){
			response.sendRedirect("index.jsp");
		}else{
			AbsDAO absBdd = new AbsDAO();
			
			if(curUser.getRole().equals("secretaire")){
				out.println("secretaire");
			}else if(curUser.getRole().equals("etudiant")){
				out.println(absBdd.findAllAbs(curUser.getId()));
			}else if(curUser.getRole().equals("enseignant")){
				out.println("enseignant");
			}else{
				response.sendRedirect("index.jsp");
			}
		}
		
		%>
	</body>
</html>