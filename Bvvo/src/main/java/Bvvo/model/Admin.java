package Bvvo.model;
import java.io.Serializable;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "admin")
@DiscriminatorValue("admin")


public class Admin  extends User implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	public Admin() {
		super();
	}

	public Admin(int id, String email, String password, String firstname,String lastname, String address, String city, String state,String zip) {
		super();
		
		this.id = id;
		this.email = email;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		
		}
	
	public Admin(String email, String password, String firstname,String lastname, String address, String city, String state,String zip) {
		super();
		
		this.email = email;
		this.password = password;
		this.firstname = firstname;
		this.lastname = lastname;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		
		}
}
