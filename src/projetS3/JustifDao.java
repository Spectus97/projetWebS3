package projetS3;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JustifDao {
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
	
	
	public boolean addJustif(int id, String l, String dateDeb, String dateFin){
		try{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			stmt.executeUpdate("INSERT INTO justification VALUES("+id+",'"+l+"','"+dateDeb
			+"','"+dateFin+"')");
			checkJustifAbs(id);
			con.close();
			return true;
		}catch(Exception e){
			System.out.println("addJustif error : "+e.getStackTrace());
		}
		return false;
	}
	
	public boolean checkJustifAbs(int id){
		try{
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			/*ResultSet rs = stmt.executeQuery("SELECT * FROM absence WHERE ida="+id);
			
			Statement stmt2 = con.createStatement();
			ResultSet rs2 = stmt2.executeQuery("SELECT * FROM justification WHERE idj="+id);
			
			// pour chaque absences
			while(rs.next()){
				
			}*/
			
				
			String sql = "UPDATE absence "
					+ " SET estvalide='t'"
					+ " WHERE absence.ida "
					+ " IN (SELECT idj FROM justification WHERE idj="+id+" AND absence.ida="+id+" AND absence.date BETWEEN datedeb AND datefin); ";
			
			/*stmt.executeUpdate("UPDATE absence"
					+ "SET estvalide='t'"
					+ "WHERE absence.ida "
					+ "IN (SELECT idj FROM justification WHERE idj="+id+" AND absence.ida="+id+" AND absence.date BETWEEN datedeb AND datefin)");
			*/
			
			stmt.executeUpdate(sql);
			con.close();
			return true;
		}catch(Exception e){
			System.out.println("addJustif error : "+e.getStackTrace());
		}
		return false;
	}
}
