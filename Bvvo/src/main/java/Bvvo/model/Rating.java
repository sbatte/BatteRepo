package Bvvo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ratings")
public class Rating {

	@Id
	@GeneratedValue
	int id;
	
	@Column(nullable=false)
	boolean enable;
	
	String title;
	String message;
	String service;
	String knowledge;
	String overall;
	
	@ManyToOne
	Lawyer lawyername;
	
	@ManyToOne
	User email;

	public Rating() {
		enable=true;
	}
	
	public Rating(int id, String title, String message, String knowledge, String overall, String service,boolean enable) {
		super();
		this.id = id;
		this.title = title;
		this.message = message;
		this.knowledge = knowledge;
		this.overall = overall;
		this.service = service;
		this.enable= enable;
	}

	public Lawyer getLawyername() {
		return lawyername;
	}

	public void setlawyername(Lawyer lawyername) {
		this.lawyername = lawyername;
	}

	public User getEmail() {
		return email;
	}

	public void setEmail(User email) {
		this.email = email;
	}
	
	public boolean isEnable() {
		return enable;
	}

	public void setEnable(boolean enable) {
		this.enable = enable;
		
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getKnowledge() {
		return knowledge;
	}

	public void setKnowledge(String knowledge) {
		this.knowledge = knowledge;
	}

	public String getOverall() {
		return overall;
	}

	public void setOverall(String overall) {
		this.overall = overall;
	}

	public String getService() {
		return service;
	}

	public void setService(String service) {
		this.service = service;
	}

	


}
