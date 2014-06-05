package Bvvo.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import Bvvo.model.Admin;
import Bvvo.model.Lawyer;
import Bvvo.model.Rating;
import Bvvo.model.User;
import Bvvo.model.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	public Lawyer getLawyerById( Integer id )
	{
		return entityManager.find( Lawyer.class, id );
	}


	@Override
	public List<User> getUserByName( String email)
	{
		List<User> userlog = entityManager.createQuery( "from User where user_type='generaluser' and email = :email", User
				.class).setParameter("email", email).getResultList();
		return userlog;
	}

	
	@Override
	public List<Lawyer> getLawyerByName( String email,String password )
	{
		List<Lawyer> userlog1 = entityManager.createQuery( "from Lawyer where user_type='lawyers' and email = :email and password =:password", Lawyer.class).setParameter("email", email).setParameter("password", password).getResultList();
		return userlog1;
	}
	@Override

	public List<Lawyer> getLawyers()
	{
		return entityManager.createQuery( "from Lawyer", Lawyer.class )
				.getResultList();

	}

	@Override
	@Transactional
	public User saveLawyer( Lawyer lawyer )
	{
		return entityManager.merge( lawyer );
	}


	@Override
	public User getUserById( Integer id )
	{
		return entityManager.find( User.class, id );
	}


	@Override
	public Rating getReviewId( Integer id )
	{
		return entityManager.find( Rating.class, id );
	}

	@Override

	public List<User> getUsers()
	{
		return entityManager.createQuery( "from User where user_type='generaluser'", User.class )
				.getResultList();

	}



	@Override
	public List<Rating> getReviews()
	{
		return entityManager.createQuery( "from Rating where user_type='lawyers'", Rating.class )
				.getResultList();
	}

	@Override
	public List<Rating> getReviewById(Integer id)
	{
		return entityManager.createQuery( "from Rating where lawyername.id=:id", Rating.class ).setParameter("id", id)
				.getResultList();
	}



	@Override
	@Transactional
	public User saveUser( User user )
	{
		return entityManager.merge( user );
	}

	@Override
	@Transactional
	public Rating saveReview( Rating review )
	{
		return entityManager.merge( review );
	}

	
	@Transactional
	public User saveAdmin( Admin admin )
	{
		return entityManager.merge( admin );
	}


}

