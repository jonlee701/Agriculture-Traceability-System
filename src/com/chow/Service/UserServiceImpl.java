package com.chow.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.chow.Bean.User;
import com.chow.Dao.UserDao;

@Component(value = "userService")
public class UserServiceImpl implements UserService {

	@Resource
	UserDao userDao;

	@Override
	public void add(User user) {
		// TODO Auto-generated method stub
		userDao.add(user);
	}

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userDao.get();
	}

	@Override
	public User login(String identify, String password) {
		// TODO Auto-generated method stub
		User user = userDao.getByIdentify(identify);
		if (user!=null&&!password.equals("") && password.equals(user.getPassword()))
			return user;
		return null;
	}

	@Override
	public boolean changePass(int id, String password, String answer) {
		// TODO Auto-generated method stub
		User user = userDao.get(id);
		if (!answer.equals("") && answer.equals(user.getAnswer())) {
			user.setPassword(password);
			userDao.update(user);
			return true;
		}
		return false;
	}

	@Override
	public User forget(String identify) {
		// TODO Auto-generated method stub
		return userDao.getByIdentify(identify);
	}
	
	@Override
	public byte getType(String identify){
		String c=identify.substring(identify.length()-1);
		int i=Integer.parseInt(c);
		if(i%2==0) {
			return 1;
		}else {
			return 2;
		}
	}

	@Override
	public boolean exist(String identify) {
		// TODO Auto-generated method stub
		return userDao.exist(identify);
	}

	@Override
	public User getByName(String name) {
		// TODO Auto-generated method stub
		return userDao.getByName(name);
	}


}
