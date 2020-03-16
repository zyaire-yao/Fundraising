package com.fund.model.fundProduct.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Store;

@Repository
public class FundProductDaoImpl implements IFundProductDao{

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * @新增募資商品
	 */
	@Override
	public void addFundProduct(FundProduct fundProduct) {
		System.out.println("Dao");
		getSession().save(fundProduct);
	}

	/**
	 * @更新募資商品
	 */
	@Override
	public void updateFundProduct(Query query) {
		query.executeUpdate();
	}

	/**
	 * @用抓取更新時的資料
	 */
	@Override
	public List<FundProduct> findUpdateFundProductByFundProductId(Integer fundProductId) {
		String hql = "from FundProduct Where fundProductId=:id";
		Query query = getSession().createQuery(hql).setParameter("id", fundProductId);
		List<FundProduct> fundProduct = query.list();
		return fundProduct;
	}

	/**
	 * @用StoreID抓取查詢店家上傳募資商品
	 */
	@Override
	public List<FundProduct> findAllFundProductByStoreId(Integer storeId) {

		String hqlstr = "From  FundProduct Where store_Id=:id";
		Query query = getSession().createQuery(hqlstr).setParameter("id", storeId);

		List<FundProduct> fundProducts = query.list();

		return fundProducts;
	}

	/**
	 * @查商品_透過ID
	 * @param productId
	 * @return
	 */
	@Override
	public FundProduct findFundProductPicByFundProductId(Integer fundProductId) {
		return getSession().get(FundProduct.class, fundProductId);

	}

	@Override
	public List<FundProduct> getAllProductDao() {
		String hqlstr = "From FundProduct";
		Query query = getSession().createQuery(hqlstr);
		List<FundProduct> AllItems = query.list();
		return AllItems;
	}

	@Override
	public List<FundProduct> findFundProductDetailByFundProductId(Integer fundProductId) {
		String hqlstr = "From FundProduct  where fundProductId=:id ";
		Query query = getSession().createQuery(hqlstr).setParameter("id", fundProductId);
		List<FundProduct> Items = query.list();
		return Items;
	}

	@Override
	public List<FundProduct> findFundProductDetailByFundProjectId(Integer fundProjectId) {
		System.out.println("Dao");
		String hqlstr = "From FundProduct  where fund_Project_Id=:id ";
		Query query = getSession().createQuery(hqlstr).setParameter("id", fundProjectId);
		List<FundProduct> Items = query.list();
		return Items;
	}

	@Override
	public List getStoreDao(Integer fundProductId) {
		String hqlstr = "select st.storeId  from Store st left join FundProduct fpd on(st.storeId=fpd.store)where fpd.fundProductId=:id";
		Query query = getSession().createQuery(hqlstr).setParameter("id", fundProductId);
		List Items = query.list();
		return Items;
	}

	/**
	 * @用fundProjectId抓取更新時的資料
	 */
	@Override
	public FundProduct findUpdateFundProductByFundProjectId(Integer fundProjectId) {
		System.out.println("fundProjectId Dao:" + fundProjectId);
		String hql = "from FundProduct Where fund_project_id=:id";
		Query query = getSession().createQuery(hql).setParameter("id", fundProjectId);
		FundProduct fundProduct = (FundProduct) query.list().get(0);
		return fundProduct;
	}
	/**
	 * @用fundProducttId抓取storeId 存進訂單
	 */
	@Override
	public FundProduct findStoreByFundProductId(Integer fundProductId) {
		System.out.println("fundProjectId Dao:" + fundProductId);
		String hql = "from FundProduct Where fundProductId=:id";
		Query query = getSession().createQuery(hql).setParameter("id", fundProductId);
		FundProduct fundProduct = (FundProduct) query.list().get(0);
		return fundProduct;
	}
	
	/**
	 * 模糊查詢商品 like:
	 *  
	 * @return
	 */
	@Override
	public List<FundProduct> findFundProductLike(String Inquire) {		
	   String hql = "from FundProduct as pd where  pd.fundProductName like:name";
       Query query =  getSession().createQuery(hql);
       query.setParameter("name", "%"+Inquire+"%");
       List<FundProduct> listFundProduct = query.list();      
		return listFundProduct;
	}

}
