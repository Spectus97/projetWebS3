package projetS3;

import java.sql.*;

public class AuthDAO {
	public Connection getConnection(){
		Connection con = null;
		try{
			Class.forName("org.postgresql.Driver");
			
			String url = "jdbc:postgresql://psqlserv/n3p1";
			String nom = "diazr";
			String mdp = "moi";
			
			con = DriverManager.getConnection(url,nom,mdp);
		}catch(Exception e){
			System.out.println(e.getStackTrace());
		}	
		return con;
	}
	
	public User getUserByPseudo(String pseudo){
		User personne = null;
		try{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM personne WHERE pseudo='"+pseudo+"'");
			while(rs.next()){
				personne = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));	
			}
			con.close();
			return personne;
		}catch(Exception e){
			System.out.println("getUserByPseudo error : "+e.getStackTrace());
		}
		return personne;
	}
	
	public User getUserByName(String name,String prenom){
		User personne = null;
		try{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM personne WHERE nom='"+name+"' AND prenom='"+prenom+"' ");
			while(rs.next()){
				personne = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));	
			}
			con.close();
			return personne;
		}catch(Exception e){
			System.out.println("getUserByName error : "+e.getStackTrace());
		}
		return personne;
	}
	
	public User getUser(String pseudo,String password){
		User personne = null;
		try{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM personne WHERE pseudo='"+pseudo+"' AND mdp='"+password+"'");
			while(rs.next()){
				personne = new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6));
			}
			con.close();
			return personne;
		}catch(Exception e){
			System.out.println("getUser error : "+e.getStackTrace());
		}
		return personne;
	}
	
	public int getLastID(){
		try{
			int id = 0;
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM personne");
			rs.next();
			id = rs.getInt(1);
			con.close();
			return id;
		}catch(Exception e){
			System.out.println("GetLastID error : "+e.getStackTrace());
		}
		return -1;
	}
	
	public boolean addUser(User user){
		try{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("INSERT INTO personne VALUES("+user.getId()+",'"+user.getPseudo()+"','"+user.getMdp()
			+"','"+user.getNom()+"','"+user.getPrenom()+"','"+user.getRole()+"')");
			con.close();
			return true;
		}catch(Exception e){
			System.out.println("addUser error : "+e.getStackTrace());
		}
		return false;
	}
}
