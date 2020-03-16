package com.fund.model.fundProduct.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.query.Query;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.Store;

public interface IFundProductService {
	
	/**
	 * @新增商品
	 */
	public void addFundProduct(FundProduct fundProduct, HttpSession httpSession);

	/**
	 * @更新募資商品
	 */
	public void updateFundProduct(FundProduct fundProduct);

	/**
	 ** 
	 */
	public FundProduct findUpdateFundProductByFundProjectId(Integer fundProjectId);

	/**
	 * @Servic 存入照片
	 * @param file
	 * @param request
	 * @return
	 */
	public String addFundProductPic(MultipartFile file, HttpServletRequest request);

	/**
	 * @用storeId找projectId
	 */
	public FundProject findFundProjectByStoreId(Store store);

	/**
	 * @Service 刪除照片
	 */
	public boolean deletePorductPic(Integer fundProductId, HttpServletRequest request);

	/**
	 * @Service 抓取店家所有募資商品
	 */
	public List<FundProduct> findAllFundProductByStoreId(Integer storeId);

	/**
	 * @Service 抓取所有募資商品供消費者選購
	 */
	public List<FundProduct> getAllProductService();

	/**
	 * @Service 用fundproductId 抓取fundProductDetail
	 */
	public List<FundProduct> findFundProductDetailByFundProductId(Integer fundProductId);

	/**
	 * @Service 用fundprojectId 抓取fundProductDetail
	 */
	public List<FundProduct> findFundProductDetailByFundProjectId(Integer fundProjectId);
	
	/**
	 * @Service 用fundproductId 抓取 storeId
	 * @Return 存進訂單
	 */
	public FundProduct findStoreByFundProductId(Integer fundProductId);

	public List getStoreService(Integer fundProductId);
	
	/**
	 * 模糊查詢商品
	 * @return
	 */
	public List<FundProduct> findFundProductLike(String Inquire);

}
