<%@page import="javax.swing.text.DefaultEditorKit.CutAction"%>
<%@page import="projetS3.AuthDAO"%>
<%@ page pageEncoding="utf-8" %>
<%@ page import="projetS3.*,javax.servlet.*,java.sql.*,java.io.*"  %>

<!DOCTYPE html>
<html lang='fr'>
	<head>
		<title>Abs</title>
	</head>
	
	<body>
		<% 
		
			AuthDAO auth = new AuthDAO();
			boolean error = false; 
			
			// DECONNEXION
			if(request.getParameter("disconnect") != null && request.getParameter("disconnect").equals("1")){
				session.setAttribute("utilisateur", null);
				response.sendRedirect("index.jsp");
			}
			
			/* On gere la session ici, si l'user is logged alors redirect
			User curUser = (User)session.getAttribute("utilisateur");
			if(curUser != null){
				if(curUser.getRole().equals("secretaire")){
					response.sendRedirect("panel.jsp");
				}else if(curUser.getRole().equals("etudiant")){
					response.sendRedirect("panel.jsp");
				}else if(curUser.getRole().equals("enseignant")){
					response.sendRedirect("panel.jsp");
				}
			}*/
		
			// On gere la session ici, si l'user is logged alors redirect
			User curUser = (User) session.getAttribute("utilisateur");
			if (curUser == null) {
				response.sendRedirect("index.jsp");
			}
			
			AbsDAO absBdd = new AbsDAO();
			
			if(request.getParameter("submitA") != null && request.getParameter("nom") != null && request.getParameter("prenom") != null && request.getParameter("date") != null && request.getParameter("id") != null){
				
			}else{
				response.sendRedirect("panel.jsp?error=1"); // error : parametre null
			}
			
		
		%>
	</body>
</html>