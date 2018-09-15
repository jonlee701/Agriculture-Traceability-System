package com.chow.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.chow.Bean.Product;
import com.chow.Bean.User;
import com.chow.Service.ProductService;
import com.chow.Service.UserService;

@Controller
@RequestMapping(value = "/product")
public class ProductController {

	@Resource
	ProductService productService;
	
	@Resource
	UserService userService;

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String add(Product product,HttpSession session) {
		User user=(User) session.getAttribute("user");
		if(user==null)
			return "login";
		int identify=Integer.parseInt(user.getIdentify());
		if(identify%2!=0) {
			product.setCategory((byte)2);
		}else {
			product.setCategory((byte)1);
		}
		product.setFarmer(user.getName());
		productService.add(product);
		return "index";
	}

	//获取全部的产品
	@RequestMapping(value = "/getAll", method = RequestMethod.GET)
	public ModelAndView getAll(HttpSession session) {
		User user=(User) session.getAttribute("user");
		if(user==null)
			return new ModelAndView("login");
		byte type=(byte) session.getAttribute("type");
		List<Product> products = productService.getAll(type);
		return new ModelAndView("index", "products", products);
	}

	
	//根据Id获得产品信息
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public ModelAndView get(String id) {
		if (id == null || id.equals(""))
			return null;
		int iid = -1;
		try {
			iid = Integer.parseInt(id.trim());
		} catch (NumberFormatException e) {
			// TODO: handle exception
			return null;
		}
		Product product = productService.get(iid);
		if(product==null) {
			return null;
		}
		User user=userService.getByName(product.getFarmer());
		Map<String, Object> map=new HashMap<>();
		map.put("product", product);
		map.put("user", user);
		return new ModelAndView("showSingle", "map", map);

	}
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(String id) {
		productService.delete(id);
		return "index";
	}
	@RequestMapping(value = "/toEdit", method = RequestMethod.GET)
	public ModelAndView toEdit(String id) {
		if (id == null || id.equals(""))
			return null;
		int iid = -1;
		try {
			iid = Integer.parseInt(id.trim());
		} catch (NumberFormatException e) {
			// TODO: handle exception
			return null;
		}
		Product product = productService.get(iid);
		System.out.println("lng:"+product.getLng());
		return new ModelAndView("add", "product", product);
	}
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String edit(Product product,String id) {
		productService.update(product,id);
		return "index";
	}
	
	@RequestMapping(value = "/searchByNameOrFarmer", method = RequestMethod.GET)
	public ModelAndView seachByNameOrFarmer(String key,HttpSession session) {
		// TODO Auto-generated method stub
		byte type=(byte) session.getAttribute("type");
		System.out.println("type:"+type);
		List<Product> products = productService.seachByNameOrFarmer(key,type);
		
		return new ModelAndView("index", "products", products);
	}
	
	
	

}
