package Bvvo.web.controller;


import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import Bvvo.model.Admin;
import Bvvo.model.Lawyer;
import Bvvo.model.Rating;

import Bvvo.model.User;
import Bvvo.model.dao.UserDao;
import Bvvo.security.SecurityUtils;
import Bvvo.web.controller.validator.UserValidator;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

@Controller
@SessionAttributes("userdetails")
public class UserController {

	@Autowired
	UserDao userDao;

	@Autowired
	JavaMailSenderImpl mailSender;
	
	@PersistenceContext
	EntityManager entityManager;
	
	@Autowired
	UserValidator userValidator; 
	@InitBinder
	public void initBinder(WebDataBinder binder)
	{
	binder.registerCustomEditor(byte[].class,new ByteArrayMultipartFileEditor());
	}
	@RequestMapping(value = "/user/Index.html")
	public String Index( ModelMap models )
	{
		return "/user/Index";
	}
	@RequestMapping(value = "/user/ViewUsers.html")
	public String ViewUsers( ModelMap models )
	{
		return "/user/ViewUsers";
	}
	
	@RequestMapping(value = "/user/SearchResults.html")
	public String SearchResults( ModelMap models )
	{
		return "/user/SearchResults";
	}
	@RequestMapping(value = "/user/UserReg.html", method = RequestMethod.GET)
	public String UserReg(ModelMap models  )
	{
		models.put( "userdetails", new User() );
		return "user/UserReg";
	}
	@RequestMapping(value = "/user/UserReg.html", method = RequestMethod.POST)
	public String addUser( @ModelAttribute User user,BindingResult bindingResult )
	{
		userValidator.validate( user, bindingResult );
		if( bindingResult.hasErrors() ) return "users/UserReg";

		userDao.saveUser( user );
		return "redirect:Login.html";
	}


	@RequestMapping(value = "/user/LawyerReg.html", method = RequestMethod.GET)
	public String LawyerReg(ModelMap models)
	{
		models.put("lawyers", new Lawyer());
		return "/user/LawyerReg";
	}

	@RequestMapping(value = "/user/LawyerReg.html", method = RequestMethod.POST)
	public String saveLawyer(@ModelAttribute("lawyers") Lawyer lawyers, @RequestParam("file") MultipartFile uploadedFile, ModelMap models,BindingResult bindingResult) throws IOException {
		if( !uploadedFile.isEmpty() )
		{
			byte[] bytes = uploadedFile.getBytes();   
			lawyers.setImage(bytes);
		}

		userValidator.validate( lawyers, bindingResult );
		if( bindingResult.hasErrors() ) return "user/LawyerReg";

		userDao.saveLawyer( lawyers );
		return "redirect:SearchLawyer.html";
	}
	
	@RequestMapping(value = "/user/AdminReg.html", method = RequestMethod.GET)
	public String AdminReg(ModelMap models  )
	{
		models.put( "admin", new Admin() );
		return "user/AdminReg";
	}
	@RequestMapping(value="/user/AdminReg.html", method = RequestMethod.POST)
	public String AdminReg(@ModelAttribute Admin admin)
	{
		userDao.saveAdmin(admin);
		return "user/Index";
	}
	
	@RequestMapping(value = "/user/SearchLawyer.html", method = RequestMethod.GET)
	public String searchLawyer( ModelMap models )
	{
		models.put( "search", new Lawyer() );
		return "user/SearchLawyer";
	}

	@RequestMapping(value = "/user/SearchLawyer.html", method = RequestMethod.POST)
	public String searchLawyer( ModelMap models, @ModelAttribute Lawyer lawyer )
	{
		String db="from Lawyer where user_type='lawyers'";
		if(lawyer.getFirstname()!=null && !lawyer.getFirstname().equals("")){
			db+=" and (firstname = '" + lawyer.getFirstname() + "' or  lastname = '" + lawyer.getFirstname() + "')";	    		
		}if(lawyer.getCity()!=null && !lawyer.getCity().equals("")){
			db+=" and ( city = '" + lawyer.getCity() +"' or state = '" + lawyer.getCity()+ "') ";

		}if (!lawyer.getExpertize().equals("all")) {
			db+="and expertize = '" + lawyer.getExpertize()+ "'" ;
		}
		List<Lawyer> SearchResults = entityManager.createQuery( db , Lawyer.class )
				.getResultList();
		models.put("result", SearchResults);

		return "user/SearchResults";
	}

	@RequestMapping(value = "/user/LawyerReview.html", method = RequestMethod.GET)
	public String LawyerReview( ModelMap models ,HttpSession session )
	{
		String ses = SecurityUtils.getUsername();
		User username = userDao.getUserByName(ses).get(0);
		models.put( "reviews", new Rating() );
		models.put("ses", username.getId());
		return "user/LawyerReview";
		
	}
	@RequestMapping(value = "/user/LawyerReview.html", method = RequestMethod.POST)
	public String LawyerReview(  @ModelAttribute Rating review, SessionStatus sessionStatus ,@RequestParam Integer id,HttpSession session) throws MessagingException
	{

		userDao.saveReview(review);
		
		Lawyer lawyer=userDao.getLawyerById(id);
		MimeMessage message = mailSender.createMimeMessage();
		String name=SecurityUtils.getUsername();		
		User users = userDao.getUserByName(name).get(0);
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		helper.setFrom("hello@hello.in");
		helper.setTo("sravya@localhost.localdomain");
		helper.setSubject("You Have Received a New Review on BVVO");
		
		helper.setText("<html><body> "+users.getFirstname() +" " + users.getLastname()+" wrote a review of you at " + new java.util.Date() +". You can check out the review at "+" http://localhost:8080/Bvvo/user/ViewReviews.html?id="+id +"</body></html>", true);

		mailSender.send(message);
		
		return "redirect:LawyerProfile.html?id="+id;
	}
	
	///Edit
	
	 @RequestMapping(value = "/user/EditReview.html", method = RequestMethod.GET)
	    public String EditReview( @RequestParam Integer id, ModelMap models )
	    {
	        models.put( "rating", userDao.getReviewId(id) );
	        return "user/EditReview";
	    }

	    @RequestMapping(value = "/user/EditReview.html", method = RequestMethod.POST)
	    public String editReview( @ModelAttribute Rating review,@RequestParam Integer id, SessionStatus sessionStatus )
	    {
	    	Rating ids = entityManager.find(Rating.class, id);
	    	//System.out.println(ids.getId());
	    	Lawyer iddetails = ids.getLawyername();	
	    	Integer lawyerid = iddetails.getId();
	    	userDao.saveReview(review);
	    	sessionStatus.setComplete();
	        return "redirect:LawyerProfile.html?id=" +  lawyerid;  
	    }
		
		@RequestMapping(value = "/user/LawyerProfile.html")
		public String viewReview( @RequestParam Integer id,ModelMap models)
		{
			models.put( "view", userDao.getReviewById(id) );
			models.put("lawyerdetails", userDao.getLawyerById(id));
			return "user/LawyerProfile";
		}

	
	////Delete
	
		@RequestMapping(value = "/user/DeleteReview.html")
		public String DeleteReview(@ModelAttribute Rating review, @RequestParam Integer id)
		{
			Rating ids = userDao.getReviewId(id);
 
			Lawyer iddetails = ids.getLawyername();	
	    	Integer lawyerid = iddetails.getId();
	    	
			ids.setEnable(false);
			userDao.saveReview(ids);
			//return "user/LawyerProfile.html?id="+ lawyerid;
	  	return "redirect:LawyerProfile.html?id=" +  lawyerid;
	  	
	  	}
	
		////SearchReview
		
		@RequestMapping(value = "/user/SearchReview.html", method = RequestMethod.GET)
	    public String reviewSearch( ModelMap models )
	    {
	    models.put( "review", new Rating() );
	    return "user/SearchReview";
	    }
	    


	    @RequestMapping(value = "/user/SearchReview.html", method = RequestMethod.POST)
	    public String reviewSearch( @ModelAttribute("review") Rating review, ModelMap models)
	    {
	   
	    String query = "select id,email_id,lawyername_id,enable,knowledge,service,overall, ts_rank ( tsv, plainto_tsquery('"+ review.getTitle() +"')) as ranking ," +
	    "ts_headline (title,plainto_tsquery('"+ review.getTitle() +"')) as title," +
	    "ts_headline (message , plainto_tsquery('"+ review.getTitle() +"')) as message " +
	    "from ratings where tsv @@ plainto_tsquery('"+review.getTitle()+"') order by ranking desc";

	    @SuppressWarnings("unchecked")
	    List <Rating> reviews = entityManager.createNativeQuery(query, Rating.class).getResultList();
	    models.put("result", reviews );
	    
	    return "/user/ReviewResult";


	    }
	@RequestMapping(value = "/user/Login.html", method = RequestMethod.GET)
	public String loginuser(ModelMap model){

		model.put("login", new User());
		return "/user/Login";
	}
/*
	@RequestMapping(value = "/user/Login.html", method = RequestMethod.POST)
	public String loginuser(@ModelAttribute User userslog, HttpSession session){
	
		List<User> login= userDao.getUsersByName(userslog.getEmail(), userslog.getPassword());
		List<User> result = new ArrayList<User>();
		
		if(userslog.getEmail()!=null && userslog.getPassword()!=null) {
			for(User users : login) 
			{
				if(userslog.getEmail().equalsIgnoreCase(users.getEmail()) && userslog.getPassword().equalsIgnoreCase(users.getPassword())) {

					result.add(users);
					session.setAttribute("sessionuser", result.get(0) );
					return "redirect:SearchLawyer.html";
				}
			}
		}
		return "redirect:Login.html";
	}
*/
	@RequestMapping(value="/user/Logout.html")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:Index.html";

	}

	
	
	
	@RequestMapping(value = "/user/pic.html")
	public String ImageController( @RequestParam Integer id,ModelMap models, HttpServletResponse response) throws IOException
	{
		response.setHeader( "Content-Disposition", "inline; filename=hello.png");
		Lawyer lawyer= userDao.getLawyerById(id);
		byte[] file = lawyer.getImage();
		byte[] resize = scale(file, 112, 149);

		ByteArrayInputStream files = new ByteArrayInputStream(resize);
		OutputStream out = response.getOutputStream();
		byte buffer[] = new byte[2048];
		int bytesRead;
		while( (bytesRead = files.read( buffer )) > 0 )
			out.write( buffer, 0, bytesRead );
		files.close();
		return null;
	}
	@RequestMapping(value = "/user/pic1.html")

	public String ImageControllers( @RequestParam Integer id,ModelMap models, HttpServletResponse response) throws IOException
	{
		response.setHeader( "Content-Disposition", "inline; filename=hello.png");
		Lawyer lawyer= userDao.getLawyerById(id);
		byte[] file = lawyer.getImage();
		byte[] resize = scale(file, 66, 88);

		ByteArrayInputStream files = new ByteArrayInputStream(resize);
		OutputStream out = response.getOutputStream();
		byte buffer[] = new byte[2048];
		int bytesRead;
		while( (bytesRead = files.read( buffer )) > 0 )
			out.write( buffer, 0, bytesRead );
		files.close();
		return null;

	}
	public byte[] scale(byte[] fileData, int width, int height) throws IOException {
		ByteArrayInputStream in = new ByteArrayInputStream(fileData);

		BufferedImage img = ImageIO.read(in);
		if(height == 0) {
			height = (width * img.getHeight())/ img.getWidth(); 
		}
		if(width == 0) {
			width = (height * img.getWidth())/ img.getHeight();
		}
		Image scaledImage = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
		BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		imageBuff.getGraphics().drawImage(scaledImage, 0, 0, new Color(0,0,0), null);
		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		ImageIO.write(imageBuff, "jpg", buffer);
		return buffer.toByteArray();
	}

	
	
}




