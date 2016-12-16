package projetS3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class AbsDAO {
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
	
	public String findAllAbs(int id){
		String affichage = "";
		try{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM absence WHERE ida="+id);
			
			affichage += "<table>";
			affichage += "<tr>";
			affichage += 	"<th>Cours</th>";
			affichage += 	"<th>Date</th>";
			affichage += 	"<th>Matin</th>";
			affichage += 	"<th>Aprem</th>";
			affichage += 	"<th>Justifié</th>";
			affichage += "</tr>";
			while(rs.next()){
				affichage += "<tr>";
				affichage += 	"<td>"+rs.getString(2)+"</td>";
				affichage += 	"<td>"+rs.getString(3)+"</td>";
				affichage += 	"<td>"+rs.getString(4)+"</td>";
				affichage += 	"<td>"+rs.getString(5)+"</td>";
				affichage += 	"<td>"+rs.getString(6)+"</td>";
				affichage += "</tr>";
			}
			affichage += "</table>";
			con.close();
		}catch(Exception e){
			System.out.println("Error findAllAbs : "+e.getStackTrace());
		}
		return affichage;
	}
}
