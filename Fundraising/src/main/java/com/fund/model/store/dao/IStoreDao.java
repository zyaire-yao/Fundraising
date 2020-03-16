package com.fund.model.store.dao;

import com.fund.model.eneity.Store;


public interface IStoreDao {


	
	/**
	 * @Dao 註冊商家
	 */
	public void addStore(Store store); 
	
	/**
	 *@Dao 查詢店家 用StoreName
	 */
	public Store findStoreByStoreName(String storeName);
	
	
	/**
	 *@Dao 查詢商店資料
	 */
	public Store findStoreById(Integer storeId);
	
	/**
	 *@Dao 更改商家資料
	 */
	public void updateStore(Store store);

}
