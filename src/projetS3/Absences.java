package projetS3;

import java.sql.Date;

public class Absences {
	private int idEtu;
	private String cours;
	private String date;
	private String matin;
	private String aprem;
	private boolean estJustifie;
	
	public Absences(int id,String cours,String d,String matin,String aprem){
		this.setIdEtu(id);
		this.setCours(cours);
		this.setDate(d);
		this.setMatin(matin);
		this.setAprem(aprem);
		this.setEstJustifie(false);
	}

	public int getIdEtu() {
		return idEtu;
	}

	public void setIdEtu(int idEtu) {
		this.idEtu = idEtu;
	}

	public String getCours() {
		return cours;
	}

	public void setCours(String cours) {
		this.cours = cours;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String isMatin() {
		return matin;
	}

	public void setMatin(String matin) {
		this.matin = matin;
	}

	public boolean isEstJustifie() {
		return estJustifie;
	}

	public void setEstJustifie(boolean estJustifie) {
		this.estJustifie = estJustifie;
	}

	public String isAprem() {
		return aprem;
	}

	public void setAprem(String aprem) {
		this.aprem = aprem;
	}
}
