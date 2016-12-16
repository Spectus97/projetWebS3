package projetS3;

import java.sql.Date;

public class Absences {
	private int idEtu;
	private String cours;
	private Date date;
	private boolean matin;
	private boolean aprem;
	private boolean estJustifie;
	
	public Absences(int id,String cours,Date d,boolean matin,boolean aprem){
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public boolean isMatin() {
		return matin;
	}

	public void setMatin(boolean matin) {
		this.matin = matin;
	}

	public boolean isEstJustifie() {
		return estJustifie;
	}

	public void setEstJustifie(boolean estJustifie) {
		this.estJustifie = estJustifie;
	}

	public boolean isAprem() {
		return aprem;
	}

	public void setAprem(boolean aprem) {
		this.aprem = aprem;
	}
}
