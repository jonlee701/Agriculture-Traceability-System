package com.chow.Service;

import java.util.List;

import com.chow.Bean.Product;

public interface ProductService {
	
	public void add(Product product);
	
	public List<Product> getAll(byte type);
	
	public Product get(int id);
	
	public String getQRcode();
	
	public void delete(String id);
	
	public void update(Product product,String id);
	
	public List<Product> seachByNameOrFarmer(String key,byte type);
	
}
