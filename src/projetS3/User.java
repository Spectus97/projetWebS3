package projetS3;

public class User {
	private int id;
	private String pseudo;
	private String prenom;
	private String nom;
	private String mdp;
	private String role;
	
	public User(int idp, String pseudo, String mdp, String nom, String prenom, String role){
		this.setId(idp);
		this.setMdp(mdp);
		this.setNom(nom);
		this.setRole(role);
		this.setPseudo(pseudo);
		this.setPrenom(prenom);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPrenom() {
		return prenom;
	}

	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getMdp() {
		return mdp;
	}

	public void setMdp(String mdp) {
		this.mdp = mdp;
	}

	public String getPseudo() {
		return pseudo;
	}

	public void setPseudo(String pseudo) {
		this.pseudo = pseudo;
	}
}
