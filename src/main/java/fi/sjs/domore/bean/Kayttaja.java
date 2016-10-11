package fi.sjs.domore.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

@Entity 
@Table(name = "kayttaja")
public class Kayttaja {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(name="k_etunimi")
	@Size(min = 1, max = 50)
	private String etunimi;
	
	@Column(name="k_sukunimi")
	@Size(min = 1, max = 50)
	private String sukunimi;
	
	@Column(name="k_ika")
	@Pattern(regexp = "\\d{1,3}")
	private int ika;
	
	@Column(name="k_kuvaus")
	@Size(min = 1, max = 500)
	private String kuvaus;
	
	@Column(name="k_sposti")
	@Size(min = 1, max = 30)
	@Email
	private String sposti;
	
	@Column(name="k_puh")
	@Pattern(regexp = "\\d\\-\\+{7,13}")
	private String puh;
	

	public Kayttaja() {
		super();
		
	}

	public Kayttaja(int id, String etunimi, String sukunimi, int ika,
			String kuvaus, String sposti, String puh) {
		super();
		this.id = id;
		this.etunimi = etunimi;
		this.sukunimi = sukunimi;
		this.ika = ika;
		this.kuvaus = kuvaus;
		this.sposti = sposti;
		this.puh = puh;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEtunimi() {
		return etunimi;
	}

	public void setEtunimi(String etunimi) {
		this.etunimi = etunimi;
	}

	public String getSukunimi() {
		return sukunimi;
	}

	public void setSukunimi(String sukunimi) {
		this.sukunimi = sukunimi;
	}

	public int getIka() {
		return ika;
	}

	public void setIka(int ika) {
		this.ika = ika;
	}

	public String getKuvaus() {
		return kuvaus;
	}

	public void setKuvaus(String kuvaus) {
		this.kuvaus = kuvaus;
	}

	public String getSposti() {
		return sposti;
	}

	public void setSposti(String sposti) {
		this.sposti = sposti;
	}

	public String getPuh() {
		return puh;
	}

	public void setPuh(String puh) {
		this.puh = puh;
	}

	@Override
	public String toString() {
		return "Kayttaja [id=" + id + ", etunimi=" + etunimi + ", sukunimi="
				+ sukunimi + ", ika=" + ika + ", kuvaus=" + kuvaus
				+ ", sposti=" + sposti + ", puh=" + puh + "]";
	}
	
	
	
}
