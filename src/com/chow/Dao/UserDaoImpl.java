package com.chow.Dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;

import com.chow.Bean.User;


@Component
public class UserDaoImpl implements UserDao{
	
	
	@Resource
	HibernateTemplate template;
	
	@Resource
	SessionFactory sessionFactory;

	@Override
	public void add(User user) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.save(user);
	}

	public HibernateTemplate getTemplate() {
		return template;
	}

	public void setTemplate(HibernateTemplate template) {
		this.template = template;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<User> get() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User");
		return query.getResultList();
	}

	@Override
	public User get(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		return session.get(User.class, id);
	}

	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		session.update(user);
	}
	
	public User getByIdentify(String identify) {
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User u where u.identify=?");
		query.setParameter(0, identify);
		if(query.getResultList().size()==0)
			return null;
		return (User) query.getSingleResult();
	}
	
	public boolean exist(String identify){
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User u where u.identify=?");
		query.setParameter(0, identify);
		if(query.getResultList().size()>=1)
			return true;
		return false;
	}

	@Override
	public User getByName(String name) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		Query query=session.createQuery("from User u where u.name=?");
		query.setParameter(0, name);
		List<User> users=query.getResultList();
		if(users.size()>=1) {
			return users.get(0);
		}
		return null;
	}
	

}
