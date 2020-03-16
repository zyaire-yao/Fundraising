package com.fund.model.fundProduct.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.fund.model.eneity.FundProduct;

public interface IFundProductDao {

	/**
	 * @新增募資商品
	 */
	public void addFundProduct(FundProduct fundProduct);

	/**
	 * @更新募資商品
	 */
	public void updateFundProduct(Query query);

	/**
	 * @用抓取更新時的資料
	 */
	public List<FundProduct> findUpdateFundProductByFundProductId(Integer fundProductId);

	/**
	 * @用StoreID抓取查詢店家上傳募資商品
	 */
	public List<FundProduct> findAllFundProductByStoreId(Integer storeId);

	/**
	 * @查商品_透過ID
	 * @param productId
	 * @return
	 */
	public FundProduct findFundProductPicByFundProductId(Integer fundProductId);

	public List<FundProduct> getAllProductDao();

	public List<FundProduct> findFundProductDetailByFundProductId(Integer fundProductId);

	public List<FundProduct> findFundProductDetailByFundProjectId(Integer fundProjectId);

	public List getStoreDao(Integer fundProductId);

	/**
	 * @用fundProjectId抓取更新時的資料
	 */
	public FundProduct findUpdateFundProductByFundProjectId(Integer fundProjectId);
	/**
	 * @用fundProducttId抓取storeId 存進訂單
	 */
	public FundProduct findStoreByFundProductId(Integer fundProductId);
	
	/**
	 * 模糊查詢商品 like:
	 * 
	 * @return
	 */
	public List<FundProduct> findFundProductLike(String Inquire);

}
