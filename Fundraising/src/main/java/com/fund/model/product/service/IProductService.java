package com.fund.model.product.service;


import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Msg;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.Stock;
import com.fund.model.eneity.Store;

public interface IProductService {

	/**
	 * @新增商品
	 */
	public void addProduct(Product product, String sddPic, Store store);

	/**
	 * @新增庫存
	 */
	public void addStock(Product product, Stock stock);

	/**
	 * @查商品_透過ID
	 * @param productId
	 * @return
	 */
	public Product findProductById(Integer productId);
	
	/**
	 * @利用或號查詢是否有商品
	 * @param product
	 * @return
	 */
	public Product findProductByProductItemNO(Product product);

	/**
	 * @Servic 存入照片
	 * @param file
	 * @param request
	 * @return
	 */
	public String addProductPic(MultipartFile file, HttpServletRequest request);

	
	public List<Product> getAllProductService();


	
	/**
	 * @ServiceImpl更新商品資料
	 */
	public void updateProduct(Product product);
	
	/**
	 * @Service 刪除照片
	 */
	public boolean deletePorductPic(int productId, HttpServletRequest request);


	public List<Product> getoneProductService(Integer productId);


	public List getStoreService(Integer productId);
	
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
	  *查詢所有商品中的其中一項 
	  * */
	 List<Product> getrandomProductService();
	
	
	/**
	 * 模糊查詢商品
	 * @return
	 */
	public List<Product> findProductLike(String Inquire);
		
}