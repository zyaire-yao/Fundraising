package com.fund.model.back.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.Announcement;
import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.ShoppingCart;
import com.fund.model.eneity.Store;


@Repository
public class BackDaoImpl implements IBackDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
		
	}

	@Override
	public List<Member> listFindMember(){
		String hql = "From Member";
		Query query = getSession().createQuery(hql);
		List<Member> at = query.list();
		return at;		
	}


	@Override
	public void updateMemberStatus(Query query) {
		query.executeUpdate();
	}
	@Override
	public Member findUpdateGetMemberStatus(Integer memberId) {
		return getSession().get(Member.class, memberId);
	}
	@Override
	public Integer getDaoMemberId(String mEmail) {

		String hqlStr = "select memberId from Member where memberEmail=:email  ";
		Query query = getSession().createQuery(hqlStr).setParameter("email", mEmail);
		List result = query.list();
		int resultMemberId = (Integer) result.get(0);
		System.out.println("memberId=" + resultMemberId);
		if (resultMemberId == 0) {
			return null;
		}

		return resultMemberId;
	}
	
	@Override
	public void updateMember(Query query) {
		query.executeUpdate();
	}
	
	@Override
	public List<Member> findMerberByMemberId(Integer memberId) {
		String hqlstr = "From  Member Where member_id=:id"; 
		Query query = getSession().createQuery(hqlstr).setParameter("id", memberId);
		
		List<Member> members = query.list();


		return members;

	}
	
	
	@Override
	public List<Member> findUpdateMemberByMemberId(Integer memberId){
		
		
		String hqlstr = "From  Member Where memberId=:id"; 
		Query query = getSession().createQuery(hqlstr).setParameter("id", memberId);
		
		List<Member> members = query.list();
		
		return members;
		
	}



	@Override
	public List<Product> listFindProduct() {
		String hql = "From Product";
		Query query = getSession().createQuery(hql);
		List<Product> at = query.list();
		return at;
		
	}
	@Override
	public List<Report> listFindReport() {
		String hql = "From Report";
		Query query = getSession().createQuery(hql);
		List<Report> at = query.list();
		return at;
		
	}
	@Override
	public List<Store> listFindStore() {
		String hql = "From Store";
		Query query = getSession().createQuery(hql);
		List<Store> at = query.list();
		return at;
		
	}
	@Override
	public void addStore(Store store) {
		getSession().save(store);
	}

	@Override
	public void updateStoreStatus(Query query) {
		query.executeUpdate();
	}
	@Override
	public Store findUpdateGetStoreStatus(Integer storeId) {
		return getSession().get(Store.class, storeId);
	}
	@Override
	public List<FundProject> listFindFundProject() {
		String hql = "From FundProject";
		Query query = getSession().createQuery(hql);
		List<FundProject> at = query.list();
		return at;
		
	}
	@Override
	public List<FundOrder> listFindFundOrder() {
		String hql = "From FundOrder";
		Query query = getSession().createQuery(hql);
		List<FundOrder> at = query.list();
		return at;
		
	}
	@Override
	public List<OrderDetail> listFindOrderDetail() {
		String hql = "From OrderDetail";
		Query query = getSession().createQuery(hql);
		List<OrderDetail> at = query.list();
		return at;
		
	}
	
	/**
	 * 利用memberId 查詢 member資料
	 */
	@Override
	public Member findMemberByMemberId(Member member) {
		Member getMember = getSession().get(Member.class, member.getMemberId());
		return getMember;
	}
	
	
	/**
	 * 更新會員資料
	 */
	@Override
    public void updateMember(Member member) {
    	getSession().update(member);
    }
	/**
	 * 利用storeId 查詢 store資料
	 */
	@Override
	public Store findStoreByStoreId(Store store) {
		Store getStore = getSession().get(Store.class, store.getStoreId());
		return getStore;
	}
	
	
	/**
	 * 更新商家資料
	 */
	@Override
    public void updateStore(Store store) {
    	getSession().update(store);
    }


	/**
	 * 模糊查詢會員 like:Id
	 *  
	 * @return
	 */
	@Override
	public List<Member> findMemberLikeId(Integer Inquire) {		
	   String hql = "from Member as mb where mb.memberId =:id";
       Query query =  getSession().createQuery(hql).setParameter("id", Inquire);
       List<Member> listMember = query.list();      
		return listMember;
	}
	
	/**
	 * 模糊查詢會員 like:
	 *  
	 * @return
	 */
	@Override
	public List<Member> findMemberLike(String Inquire) {		
	   String hql = "from Member as mb where mb.memberEmail like:email or mb.memberFname like:name or mb.memberTwid like:Twid";
       Query query =  getSession().createQuery(hql);
       query.setParameter("email", "%"+Inquire+"%");
       query.setParameter("name", "%"+Inquire+"%");
       query.setParameter("Twid", "%"+Inquire+"%");
       List<Member> listMember = query.list();      
		return listMember;
	}

	/**
	 * 模糊查詢商家 like:Id
	 *  
	 * @return
	 */
	@Override
	public List<Store> findStoreLikeId(Integer Inquire) {		
	   String hql = "from Store as st where st.storeId =:id";
       Query query =  getSession().createQuery(hql).setParameter("id", Inquire);
       List<Store> listStore = query.list();      
		return listStore;
	}
	
	/**
	 * 模糊查詢商家 like:
	 *  
	 * @return
	 */
	@Override
	public List<Store> findStoreLike(String Inquire) {		
	   String hql = "from Store as st where  st.storeName like:name or st.storePiTwid like:Twid";
       Query query =  getSession().createQuery(hql);
       query.setParameter("name", "%"+Inquire+"%");
       query.setParameter("Twid", "%"+Inquire+"%");
       List<Store> listStore = query.list();      
		return listStore;
	}
	

	/**
	 * 模糊查詢商品 like:Id
	 *  
	 * @return
	 */
	@Override
	public List<Product> findProductLikeId(Integer Inquire) {		
	   String hql = "from Product as pd where pd.productId =:id";
       Query query =  getSession().createQuery(hql).setParameter("id", Inquire);
       List<Product> listProduct = query.list();      
		return listProduct;
	}
	
	/**
	 * 模糊查詢商品 like:
	 *  
	 * @return
	 */
	@Override
	public List<Product> findProductLike(String Inquire) {		
	   String hql = "from Product as pd where  pd.productName like:name or pd.productItemNO like:ItemNO";
       Query query =  getSession().createQuery(hql);
       query.setParameter("name", "%"+Inquire+"%");
       query.setParameter("ItemNO", "%"+Inquire+"%");
       List<Product> listProduct = query.list();      
		return listProduct;
	}

	/**
	 * 模糊查詢商品 like:Id
	 *  
	 * @return
	 */
	@Override
	public List<FundOrder> findfundOrderLikeId(Integer Inquire) {		
	   String hql = "from FundOrder as fo where fo.fundOrderId =:id";
       Query query =  getSession().createQuery(hql).setParameter("id", Inquire);
       List<FundOrder> listFundOrder = query.list();      
		return listFundOrder;
	}
	
	/**
	 * 模糊查詢商品 like:
	 *  
	 * @return
	 */
	@Override
	public List<FundOrder> findfundOrderLike(String Inquire) {		
	   String hql = "from FundOrder as fo where  fo.fundOrderProductName like:pname or fo.fundOrderName like:name or fo.fundOrderPhone like:Phone";
       Query query =  getSession().createQuery(hql);
       query.setParameter("name", "%"+Inquire+"%");
       query.setParameter("pname", "%"+Inquire+"%");
       query.setParameter("Phone", "%"+Inquire+"%");

       List<FundOrder> listFundOrder = query.list();      
		return listFundOrder;
	}
	

	/**
	 * 模糊查詢商品 like:Id
	 *  
	 * @return
	 */
	@Override
	public List<OrderDetail> findOrderDetailLikeId(Integer Inquire) {		
	   String hql = "from OrderDetail as od where od.orderDetailId =:id";
       Query query =  getSession().createQuery(hql).setParameter("id", Inquire);
       List<OrderDetail> listOrderDetail = query.list();      
		return listOrderDetail;
	}
	
	/**
	 * 模糊查詢商品 like:
	 *  
	 * @return
	 */
	@Override
	public List<OrderDetail> findOrderDetailLike(String Inquire) {		
	   String hql = "from OrderDetail as od where  od.order.orderName like:oname  or od.orderDeliveryName like:pname or od.orderDetailName like:name or od.orderDeliveryNumber like:Number";
       Query query =  getSession().createQuery(hql);
       query.setParameter("name", "%"+Inquire+"%");
       query.setParameter("pname", "%"+Inquire+"%");
       query.setParameter("Number", "%"+Inquire+"%");
       query.setParameter("oname", "%"+Inquire+"%");

       List<OrderDetail> listOrderDetail = query.list();      
		return listOrderDetail;
	}
	/**
	 * 刪除會員
	 * @param getmember
	 */
	@Override
	public void deleteMember(Member getmember) {
		try {
			getSession().delete(getmember);
			System.out.println("會員刪除成功");
		}catch (Exception e) {
			System.out.println("會員刪除失敗 -Dao");
			e.printStackTrace();
		}
	}

	/*
	 * 透過ID查會員
	 * */
	@Override
	public Member findMemberById(Integer memberId) {
		return getSession().get(Member.class,memberId);
	}
	
	/**
	 * 刪除商家
	 * @param getstore
	 */
	@Override
	public void deleteStore(Store getstore) {
		try {
			getSession().delete(getstore);
			System.out.println("商家刪除成功");
		}catch (Exception e) {
			System.out.println("商家刪除失敗 -Dao");
			e.printStackTrace();
		}
	}

	/*
	 * 透過ID查商家
	 * */
	@Override
	public Store findStoreById(Integer storeId) {
		return getSession().get(Store.class,storeId);
	}
	
	/**
	 * 取得商家全部訂單明細
	 * @returnand order.orderDate 
	 */
	@Override
	public List<OrderDetail> bFindOrderToPOI(Date startDate,Date endDate){
		//查詢區間訂單明細
		String hql = "From OrderDetail where  order.orderDate>=:startDate and order.orderDate<=:endDate ";
		Query query = getSession().createQuery(hql);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		List<OrderDetail> getListOrderDetail = query.list();
		return getListOrderDetail;
	}	
	
	/**
	 * 取得募資全部訂單明細
	 * @returnand order.orderDate 
	 */
	@Override
	public List<FundOrder> bFindFundOrderToPOI(Date startDate,Date endDate){
		//查詢區間訂單明細
		String hql = "From FundOrder where fund_order_date>=:startDate and fund_order_date<=:endDate ";
		Query query = getSession().createQuery(hql);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		List<FundOrder> getListFundOrder = query.list();
		return getListFundOrder;
	}
	
	/**
	 * 取得商品訂單明細 給圖表API使用
	 */
	@Override
	public List<OrderDetail>  findOrderDetailSumToAPI(){
		String sql = "SELECT orderDetailName, SUM(orderDetailPrice) FROM OrderDetail GROUP BY orderDetailName";
		Query query = getSession().createQuery(sql);
		List<OrderDetail> orderDetailSum = query.list();
		return orderDetailSum;
	}
	
	/**
	 * 取得商品訂單明細 給圖表API使用
	 */
	@Override
	public List<FundSettle>  findFundSettleSumToAPI(){
		String sql = "FROM FundSettle";
		Query query = getSession().createQuery(sql);
		List<FundSettle> fundSettleSum = query.list();
		return fundSettleSum;
	}

}
