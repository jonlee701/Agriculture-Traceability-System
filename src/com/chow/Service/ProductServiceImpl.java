package com.chow.Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.chow.Bean.Product;
import com.chow.Dao.ProductDao;


@Component
public class ProductServiceImpl implements ProductService{

	@Resource
	ProductDao productDao;

	@Override
	public void add(Product product) {
		// TODO Auto-generated method stub
		product.setTotalPrice(product.getPrice()*product.getWeight());
		productDao.save(product);
	}

	@Override
	public List<Product> getAll(byte type) {
		// TODO Auto-generated method stub
		return productDao.getAll(type);
	}

	@Override
	public Product get(int id) {
		// TODO Auto-generated method stub
		return productDao.find(id);
	}

	@Override
	public String getQRcode() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(String id) {
		// TODO Auto-generated method stub
		if(id==null||id.equals(""))
			return;
		try {
			productDao.delete(Integer.parseInt(id.trim()));
		}catch (NumberFormatException e) {
			// TODO: handle exception
			return;
		}
	}

	@Override
	public void update(Product product,String id) {
		// TODO Auto-generated method stub
		product.setId(Integer.parseInt(id));
		productDao.update(product);
	}

	@Override
	public List<Product> seachByNameOrFarmer(String key,byte type) {
		// TODO Auto-generated method stub
		return productDao.seachByNameOrFarmer('%'+key+'%',type);
	}

	
	

}
