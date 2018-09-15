package com.chow.Dao;

import java.util.List;

import com.chow.Bean.User;

public interface UserDao {
	
	public void add(User user);
	
	public List<User> get();
	
	public User get(int id);
	
	public void update(User user);
	
	public User getByIdentify(String identify);
	
	public boolean exist(String identify);
	
	public User getByName(String name);
	
	

}
