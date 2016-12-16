<%@page import="projetS3.AuthDAO"%>
<%@ page pageEncoding="utf-8" %>
<%@ page import="projetS3.*,javax.servlet.*,java.sql.*,java.io.*"  %>

<!DOCTYPE html>
<html lang='fr'>
	<head>
		<title>Auth</title>
	</head>
	
	<body>
		<% 
		
			AuthDAO auth = new AuthDAO();
			boolean error = false; 
		
			if(request.getParameter("submitR") != null){
				String pseudo = "";
				String mdp = "";
				String prenom = "";
				String nom = "";
				String role = "";
				
				if(request.getParameter("pseudo") != null && !request.getParameter("pseudo").equals("")){
					pseudo = (String)request.getParameter("pseudo");
				}else {
					error = true;
				}
			
				if(request.getParameter("password") != null && !request.getParameter("password").equals("")){
					mdp = (String)request.getParameter("password");
				}else {
					error = true;
				}
				
				if(request.getParameter("prenom") != null && !request.getParameter("prenom").equals("")){
					prenom = (String)request.getParameter("prenom");
				}else {
					error = true;
				}
				
				if(request.getParameter("nom") != null && !request.getParameter("nom").equals("")){
					nom = (String)request.getParameter("nom");
				}else {
					error = true;
				}
				
				if(request.getParameter("role") != null && !request.getParameter("role").equals("")){
					role = (String)request.getParameter("role");
				}else {
					error = true;
				}
				
				if(!error){
					if(auth.getUserByPseudo(pseudo) == null){
						if(auth.addUser(new User((auth.getLastID() + 1) ,pseudo,mdp,nom,prenom,role))){
							response.sendRedirect("index.jsp?success=1");
						}else{
							response.sendRedirect("index.jsp?error=3"); // ERREUR BDD
						}
					}else{
						response.sendRedirect("index.jsp?error=2"); // ERREUR PSEUDO DEJA PRIS
					}
				}else{
					response.sendRedirect("index.jsp?error=1"); // ERREUR DES CHAMPS
				}
				
			}else if(request.getParameter("submitL") != null){
				String pseudo = "";
				String mdp = "";
				
				if(request.getParameter("pseudo") != null && !request.getParameter("pseudo").equals("")){
					pseudo = (String)request.getParameter("pseudo");
				}else {
					error = true;
				}
			
				if(request.getParameter("password") != null && !request.getParameter("password").equals("")){
					mdp = (String)request.getParameter("password");
				}else {
					error = true;
				}
				
				if(!error){
					User user = auth.getUser(pseudo,mdp);
				}else{
					response.sendRedirect("index.jsp?error=1"); // ERREUR DES CHAMPS
				}
			}
			
		
		%>
	</body>
</html>