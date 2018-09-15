package com.chow.Service;

import java.util.List;

import com.chow.Bean.User;

public interface UserService {
	
	public void add(User user);
	
	public List<User> getAll();
	
	public User login(String identify,String password);
	
	public boolean changePass(int id,String password,String answer);
	
	public User forget(String identify);
	
	public byte getType(String identify);
	
	public boolean exist(String identify);
	
	public User getByName(String name);

	
}
