package com.fund.model.product.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.Stock;
import com.fund.model.eneity.Store;

@Repository
public class ProductDaoImpl implements IProductDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * @新增商品
	 */
	@Override
	public void addProduct(Product product) {
		getSession().save(product);
	}

	/**
	 * @新增庫存
	 */
	@Override
	public void addStock(Stock stock) {
		getSession().save(stock);
	}

	
	/**
	 * @查商品_透過ID
	 * @param productId
	 * @return
	 */
	@Override
	public Product findProductById(Integer productId) {
		return getSession().get(Product.class, productId);
	}
	
	
	/**
	 * @用貨號查詢商品
	 */
	@Override
	public Product findProductByProductItemNO(Product product) {
		String hql = "FROM Product WHERE productItemNO=:ItemNO";
		Query query = getSession().createQuery(hql).setParameter("ItemNO", product.getProductItemNO());
		if (query.list().size() > 0) {
			return (Product) query.list().get(0);
		} else {
			return null;
		}
	}

	/**
	 * @Dao 更新帳號資料 
	 */
    @Override
	public void updateProduct(Product product) {
    	try {
			getSession().clear();
			getSession().update(product);
			System.out.println("update 完成");
		} catch (Exception e) {
			System.out.println("update 失敗 -Dao");
			e.printStackTrace();
		}
	}
	
	@Override
	public void deletProduct(Product product) {
		try {
			getSession().delete(product);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	


	@Override
	public List<Product> getAllProductDao() {
		String hqlstr = "From Product";
		Query query = getSession().createQuery(hqlstr);
		List<Product> AllItems = query.list();
		return AllItems;
	}

	@Override
	public List<Product> getoneProductDao(Integer productId) {
		String hqlstr = "From Product  where productId=:id ";
		Query query = getSession().createQuery(hqlstr).setParameter("id", productId);
		List<Product> Items = query.list();
		return Items;
	}
	
	/*
	  * Dao隨機撈出一筆商品資料
	  * */
	 @Override
	 public List<Product> getrandomProductDao() {
	  String hqlstr = "FROM Product ORDER BY newid()";  
	  Query query = getSession().createQuery(hqlstr);
	  List<Product> randomItems = query.setMaxResults(1).list();
	  System.out.println("randomItems=" +randomItems);
	  return randomItems;
	 }

	@Override
	public List getStoreDao(Integer productId) {
		String hqlstr = "select st.storeId  from Store st left join Product pd on(st.storeId=pd.store)where pd.productId=:id";
		Query query = getSession().createQuery(hqlstr).setParameter("id", productId);
		List Items = query.list();
		return Items;
	}

	@Override
	public void updateProduct(Query query1) {
		query1.executeUpdate();

	}
	
	/**
	  * @找商家商品 回傳Entity
	  * @param store
	  * @return
	  */
	 @Override
	 public Product findProductByStoreId(Store store) {
	 int id = store.getStoreId();
	 String hql = "FROM Product Where store_id =:storeId";
	 Query query = getSession().createQuery(hql).setParameter("storeId", id);
	 List Listproduct = query.list();
	 if(Listproduct.size()>0) {
	 Product getProduct = (Product) Listproduct.get(0);
	 return getProduct;
	 }else {
	 return null;
	 }
	 }
	 
	 
	 /**
	  * @找商家商品 回傳LIST
	  * @param store
	  * @return
	  */
	 @Override
	 public List<Product> listFindProductByStoreId(Store store) {
	 int id = store.getStoreId();
	 String hql = "FROM Product Where store_id =:storeId";
	 Query query = getSession().createQuery(hql).setParameter("storeId", id);
	 List Listproduct = query.list();
	 return Listproduct;
	 }

	 
	 /**
	  * @新增檢舉
	  * @param Report
	  * @return
	  */
	@Override
	public void Report(Report report) {
		getSession().save(report);		
	}
	
	
	/**
	 * 查詢商家商品全部留言
	 * @return
	 */
	@Override
	public List getProductMsg(List<Product> getProductToStore) {
		
		return getProductToStore;
		
	}

	/**
	 * 模糊查詢商品 like:
	 *  
	 * @return
	 */
	@Override
	public List<Product> findProductLike(String Inquire) {		
	   String hql = "from Product as pd where  pd.productName like:name";
       Query query =  getSession().createQuery(hql);
       query.setParameter("name", "%"+Inquire+"%");
       List<Product> listProduct = query.list();      
		return listProduct;
	}
	 

	
}
