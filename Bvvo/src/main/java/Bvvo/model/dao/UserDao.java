package Bvvo.model.dao;
import java.util.List;

import Bvvo.model.Admin;
import Bvvo.model.Lawyer;
import Bvvo.model.Rating;
import Bvvo.model.User;



public interface UserDao {

	User getUserById( Integer id );
	
	///Rating delRevById(Integer id);
	
	Rating getReviewId( Integer id );
	
	List<User> getUserByName( String email);
	
	List<Lawyer> getLawyerByName( String email,String password );

	List<User> getUsers();

	List<Rating> getReviews();

	User saveUser( User user );

	Rating saveReview( Rating review );

	Lawyer getLawyerById( Integer id );

	List<Lawyer> getLawyers();

	List<Rating> getReviewById(Integer id);

	User saveLawyer( Lawyer lawyer );
	

	User saveAdmin( Admin admin );

}
