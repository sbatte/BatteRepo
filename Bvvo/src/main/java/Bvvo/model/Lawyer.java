package Bvvo.model;

import java.io.Serializable;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "lawyer")
@DiscriminatorValue("lawyers")
public class Lawyer extends User implements Serializable
{
	private static final long serialVersionUID = 1L;

	String expertize;
	String year;
	byte[] image;
	
	public Lawyer() {

	}
	public Lawyer( int id, String expertize, String year,byte [] image)
	{
		this.id=id;
		this.expertize = expertize;
		this.year = year;
		this.image=image;
	}

	public Lawyer(Integer id,String email,String password,String firstname,String lastname,String city,String address,String state,String zip,String expertize, String year) {
		super();
		this.id=id;
		this.email = email;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.city = city;
		this.address = address;
		this.state = state;
		this.zip = zip;
		this.expertize = expertize;
		this.year = year;
	}
	
	public Lawyer(Integer id,String email,String password,String firstname,String lastname,String city,String address,String state,String zip,String expertize, String year,byte[]  image) {
		super();
		this.id=id;
		this.email = email;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.city = city;
		this.address = address;
		this.state = state;
		this.zip = zip;
		this.expertize = expertize;
		this.year = year;
		this.image = image;
	}

	
	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	
	public String getExpertize() {
		return expertize;
	}

	public void setExpertize(String expertize) {
		this.expertize = expertize;
	}

	/*	
	 public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getZip() {
		return zip;
	}

	public void setZip(int zip) {
		this.zip = zip;
	} */

}

