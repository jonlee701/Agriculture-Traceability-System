package com.chow.Dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Component;

import com.chow.Bean.Product;

//存储层，负责增删改查，调用hibernate的接口存储数据
@Component
public class ProductDaoImpl implements ProductDao{

	
	@Resource
	SessionFactory sessionFactory;

	@Override
	public void save(Product product) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		session.save(product);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAll(byte type) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Product p where p.category=?");
		query.setParameter(0, type);
		return query.getResultList();
	}

	@Override
	public Product find(int id) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		return session.get(Product.class, id);
		
	}

	@Override
	public String getQRcode() {
		// TODO Auto-generated method stub
		return null;
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Product product=find(id);
		session.delete(product);
	}

	@Override
	public void update(Product product) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		session.update(product);
		
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> seachByNameOrFarmer(String key,byte type) {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		Query query=session.createQuery("from Product p where p.category=? and (p.name like ? or p.farmer like ?) ");
		query.setParameter(0, type);
		query.setParameter(1, key);
		query.setParameter(2, key);
		List<Product> list=query.getResultList();
		return list;
	}
	
	

}
