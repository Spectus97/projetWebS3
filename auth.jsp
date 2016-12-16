<%@page import="javax.swing.text.DefaultEditorKit.CutAction"%>
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
			
			
			// On gere la session ici, si l'user is logged alors redirect
			User curUser = (User)session.getAttribute("utilisateur");
			if(curUser != null){
				if(curUser.getRole().equals("secretaire")){
					response.sendRedirect("panel.jsp");
				}else if(curUser.getRole().equals("etudiant")){
					response.sendRedirect("panel.jsp");
				}else if(curUser.getRole().equals("enseignant")){
					response.sendRedirect("panel.jsp");
				}
			}
		
			if(request.getParameter("submitR") != null){
				String pseudo = "";
				String mdp = "";
				String prenom = "";
				String nom = "";
				String role = "";
				
				if(request.getParameter("pseudo") != null && !request.getParameter("pseudo").equals("")){
					pseudo = (String)request.getParameter("pseudo").toLowerCase();
				}else {
					error = true;
				}
			
				if(request.getParameter("password") != null && !request.getParameter("password").equals("")){
					mdp = (String)request.getParameter("password").toLowerCase();
				}else {
					error = true;
				}
				
				if(request.getParameter("prenom") != null && !request.getParameter("prenom").equals("")){
					prenom = (String)request.getParameter("prenom").toLowerCase();
				}else {
					error = true;
				}
				
				if(request.getParameter("nom") != null && !request.getParameter("nom").equals("")){
					nom = (String)request.getParameter("nom").toLowerCase();
				}else {
					error = true;
				}
				
				if(request.getParameter("role") != null && !request.getParameter("role").equals("")){
					role = (String)request.getParameter("role").toLowerCase();
				}else {
					error = true;
				}
				
				if(!error){
					User temp = auth.getUserByPseudo(pseudo);
					if(temp == null){				
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
					pseudo = (String)request.getParameter("pseudo").toLowerCase();
				}else {
					error = true;
				}
			
				if(request.getParameter("password") != null && !request.getParameter("password").equals("")){
					mdp = (String)request.getParameter("password").toLowerCase();
				}else {
					error = true;
				}
				
				if(!error){
					User temp = auth.getUser(pseudo,mdp);
					if(temp != null){
						session.setAttribute("utilisateur", temp);
						response.sendRedirect("panel.jsp");
						
					}else{
						response.sendRedirect("index.jsp?error=4"); // ERREUR UTILISATEUR INTROUVABLE
					}
					
				}else{
					response.sendRedirect("index.jsp?error=1"); // ERREUR DES CHAMPS
				}
			}else if(request.getParameter("disconnect") != null && request.getParameter("disconnect").equals("1")){
				session.setAttribute("utilisateur", null);
				response.sendRedirect("index.jsp");
			}
			
		
		%>
	</body>
</html>