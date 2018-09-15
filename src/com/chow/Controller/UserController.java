package com.chow.Controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.chow.Bean.User;
import com.chow.Service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	
	@Resource
	UserService userService;
	
	@RequestMapping(value="/add",method=RequestMethod.GET)
	public String add(String name,String phone){
		User user=new User();
		user.setName(name);
		user.setPhone(phone);
		userService.add(user);
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value="/get",method=RequestMethod.GET)
	public List<User> get(){
		return userService.getAll();
	}
	
	
	@RequestMapping(value="/register",method=RequestMethod.POST)
	public ModelAndView register(User user,@RequestParam("file") MultipartFile file,HttpServletRequest request){
		if(userService.exist(user.getIdentify())) {
			return new ModelAndView("register","message","识别号已经能存在！！");
		}
		File file1 = new File(request.getServletContext().getRealPath("upload"), System.currentTimeMillis()+file.getOriginalFilename());
		System.out.println(file1.getAbsolutePath());
		if(!file1.getParentFile().exists()){
			file1.getParentFile().mkdirs();
		}
		try {
			file1.createNewFile();
			file.transferTo(file1);
			String picture = request.getContextPath() + "/upload/" + file1.getName();
			user.setPicture(picture);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		userService.add(user);
		return new ModelAndView("login","message","");
	}
	
	@RequestMapping(value="/forget",method=RequestMethod.POST)
	public ModelAndView forget(String identify,HttpSession session) {
		User user=userService.forget(identify);
		Map<String, String> map=new HashMap<>();
		if(user!=null) {
			map.put("name", user.getName());
			map.put("answer", user.getAnswer());
			map.put("identify", identify);
			System.out.println("idddddddddddddddddd:"+user.getId());
			session.setAttribute("user", user);
			return new ModelAndView("changePass","map",map);
		}
		map.put("identify", identify);
		map.put("state", "此纳税人识别号不存在！！");
		return new ModelAndView("forget","map",map);
	}
	
	@RequestMapping(value="/changePass",method=RequestMethod.POST)
	public ModelAndView changePass(String password,String answer,HttpSession session){
		if(password.trim().equals(""))
			return new ModelAndView("changePass","state","密码不能为空！！");
		
		User user=(User) session.getAttribute("user");
		if(user==null)
			return new ModelAndView("login");
		
		if(userService.changePass(user.getId(), password, answer))
			return new ModelAndView("changeSucc");
		return new ModelAndView("changePass","state","答案错误！！");
	}
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public ModelAndView login(String identify,String password,HttpSession session) {
		User user=userService.login(identify, password);
		if(user!=null) {
			session.setAttribute("user", user);
			session.setAttribute("type", userService.getType(identify));
			return new ModelAndView("index");
		}
		Map<String, String> map=new HashMap<>();
		map.put("state","用户/密码错误！！");
		map.put("identify", identify);
		return new ModelAndView("login","map",map);
	}
	
	
	@RequestMapping(value="/showInfo",method=RequestMethod.GET)
	public ModelAndView showInfo(HttpSession session){
		User user=(User) session.getAttribute("user");
		if(user==null)
			return new ModelAndView("login");
		return new ModelAndView("showUserInfo","user",user);
	}
	
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.setAttribute("user", null);
		return "login";
	}
	

}
