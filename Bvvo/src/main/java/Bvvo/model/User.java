package Bvvo.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorType;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Table;


@Entity
@Table(name="users")
@Inheritance(strategy=InheritanceType.SINGLE_TABLE)
@DiscriminatorColumn(name="user_type", discriminatorType=DiscriminatorType.STRING)
@DiscriminatorValue("generaluser")

public class User implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	int id;
	@Column(name = "email")
	String email;
	@Column(name = "password")
	String password;
	@Column(name = "firstname")
	String firstname;
	@Column(name = "lastname")
	String lastname;
	@Column(name = "address")
	String address;
	@Column(name = "city")
	String city;
	@Column(name = "state")
	String state;
	@Column(name = "zip")
	String zip;
	@Column(name = "enable")
	boolean enable;
	

	public User()
	{
		enable=true;
	
	}
	
	public User(String email, String password) {
		this.email = email;
		this.password = password;
	}
	
		public User(int id, String email, String password, String firstname, String lastname, String address, String city, String state, String zip, boolean enable) {
	
		this.id = id;
		this.email = email;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.enable=enable;
	}
    
		public User( String email, String password, String firstname, String lastname, String address, String city, String state, String zip, boolean enable) {
			
			
			this.email = email;
			this.password = password;
			this.firstname = firstname;
			this.lastname = lastname;
			this.address = address;
			this.city = city;
			this.state = state;
			this.zip = zip;
			this.enable=enable;
		}
		
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

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}
	

}



