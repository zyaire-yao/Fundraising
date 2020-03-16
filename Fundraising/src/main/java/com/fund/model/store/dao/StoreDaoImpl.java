package com.fund.model.store.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.Store;

@Repository
public class StoreDaoImpl implements IStoreDao{

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
//		return sessionFactory.openSession();
	}
	
	/**
	 * @Dao 註冊商家
	 */
    @Override
	public void addStore(Store store) {
		try {
			getSession().save(store);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *@Dao 查詢店家 用StoreName
	 */
    @Override
	public Store findStoreByStoreName(String storeName){
		String hqlstr = "From Store WHERE storeName=:Name";
		Query quert = getSession().createQuery(hqlstr).setParameter("Name",storeName);
		List<Store> listStore= quert.list();
		if(listStore.size() != 0) {
			Store getStore = listStore.get(0);
			return getStore;
		}else {
			return null;
		}
	}
	
	
	/**
	 *@Dao 查詢商店資料
	 */
    @Override
	public Store findStoreById(Integer storeId) {	
		return getSession().get(Store.class, storeId);
	}
	
	/**
	 *@Dao 更改商家資料
	 */
    @Override
	public void updateStore(Store store) {
		if( null != findStoreById(store.getStoreId()) ) {
		    getSession().clear();
			getSession().update(store);
		}
	}

}
