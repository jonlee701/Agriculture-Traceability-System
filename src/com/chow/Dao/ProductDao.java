package com.chow.Dao;

import java.util.List;

import com.chow.Bean.Product;

public interface ProductDao {
	
	public void save(Product product);
	
	public List<Product> getAll(byte type);
	
	public Product find(int id);
	
	public String getQRcode();

	public void delete(int id);
	
	public void update(Product product);
	
	public List<Product> seachByNameOrFarmer(String key,byte type);

}
