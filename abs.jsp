<%@page import="java.text.SimpleDateFormat"%>
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
			
			if(curUser.getRole().equals("enseignant")){
				if(request.getParameter("submitA") != null && request.getParameter("nom") != null && request.getParameter("prenom") != null && request.getParameter("cours") != null && request.getParameter("date") != null){
					User temp = auth.getUserByName(request.getParameter("nom"), request.getParameter("prenom"));
					if(temp != null && temp.getRole().equals("etudiant")){
						String mat = "f";
						String apr = "t";
						if(request.getParameter("matin") != null){
							mat = "t";
						}
						
						if(request.getParameter("aprem") != null){
							apr = "t";
						}
						
						Absences tmpAbs = new Absences(temp.getId(),
								request.getParameter("cours"),
								request.getParameter("date"),
								mat,
								apr); 
						
						if(absBdd.addAbs(tmpAbs)){
							response.sendRedirect("panel.jsp?successAbs=1"); // success : reussis
						}else{
							response.sendRedirect("panel.jsp?errorAbs=3"); // error : abs bdd pb
						}
					}else{
						response.sendRedirect("panel.jsp?errorAbs=2"); // error : etu introuvable
					}
				}else{
					response.sendRedirect("panel.jsp?errorAbs=1"); // error : parametre null
				}
			}else{
				response.sendRedirect("panel.jsp");
			}
			
		
		%>
	</body>
</html>