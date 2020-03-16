package com.fund.model.product.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.fund.model.eneity.Product;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.Stock;
import com.fund.model.eneity.Store;
public interface IProductDao  {


	/**
	 * @新增商品
	 */
	public void addProduct(Product product);

	/**
	 * @新增庫存
	 */
	public void addStock(Stock stock);

	
	/**
	 * @查商品_透過ID
	 * @param productId
	 * @return
	 */
	public Product findProductById(Integer productId);
	
	
	/**
	 * @用貨號查詢商品
	 */
	public Product findProductByProductItemNO(Product product);

	/**
	 * @Dao 更新帳號資料 
	 */
	public void updateProduct(Product product);
	

	public void deletProduct(Product product);
	

	public List<Product> getAllProductDao();


	public List<Product> getoneProductDao(Integer productId);


	public List getStoreDao(Integer productId);


	public void updateProduct(Query query1);
	
	/**
	  * @找商家商品 回傳Entity
	  * @param store
	  * @return
	  */
	 public Product findProductByStoreId(Store store);
	 
	 
	 /**
	  * @找商家商品 回傳LIST
	  * @param store
	  * @return
	  */
	 public List<Product> listFindProductByStoreId(Store store);
	 
	 /**
	  * @新增檢舉
	  * @param Report
	  * @return
	  */
	public void Report(Report report);
	
	
	/**
	 * 查詢商家商品全部留言
	 * @return
	 */
	public List getProductMsg(List<Product> getProductToStore);
	
	/*
	 * 隨機查詢所有商品中的其中一項
	 * */
	List<Product> getrandomProductDao();
	
	/**
	 * 模糊查詢商品 like:
	 * 
	 * @return
	 */
	public List<Product> findProductLike(String Inquire);
	
	

}
