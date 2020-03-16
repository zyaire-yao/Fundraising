package com.fund.model.order.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Order;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.ProductReturn;

@Repository
public class OrderDaoImpl implements IOrderDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/*
	 * 使用customerReturn.jsp所回傳的odId資料重新將orderDetail再取一次。
	 */
	@Override
	public OrderDetail recheckOrderDetailByodId(Integer odId) {
		return getSession().get(OrderDetail.class, odId);
	}



	/*
	 * 透過storeId 將商家所有OrderDetail找出來。
	 */
	@Override
	public List<OrderDetail> getOrderDetailByStoreId(int storeId) {
		String hql = "From OrderDetail WHERE store_Id=:sId";
		Query query = getSession().createQuery(hql).setParameter("sId", storeId);
		List<OrderDetail> getOrderDetailByStoreId = query.list();
		return getOrderDetailByStoreId;
	}

	/*
	 * 用前端傳回來的orderDetailId找出所屬的List<OrderDetail>。
	 */
	@Override
	public List<OrderDetail> listOrderDetail(int orderDetailId) {
		String hql = "From OrderDetail  WHERE orderDetailId=:odId";
		Query query = getSession().createQuery(hql).setParameter("odId", orderDetailId);
		List<OrderDetail> listOrderDetail = query.list();
		return listOrderDetail;
	}

	/*
	 * 商家更新貨運狀態
	 */
	@Override
	public void updateOrderStatus(Query query, Query query2) {
		query.executeUpdate();
		query2.executeUpdate();
	}

	/*
	 * 更新狀態使用
	 */
	@Override
	public void updateStatus(Query query) {
		query.executeUpdate();
	}

	/*
	 * 商家審核退貨系統，可以得知被退貨商品等細項，進而審核。
	 */
	@Override
	public void replyReturnStatus(Query query, Query query2) {
		query.executeUpdate();
		query2.executeUpdate();
	}

	/*
	 * 將消費者的退貨申請單存入productReturn。
	 */
	@Override
	public void addReturnItems(ProductReturn productReturn) {
		getSession().save(productReturn);
	}

	/*
	 * 透過storeId將該商店所有的退貨品項全數取出。
	 */
	@Override
	public List<ProductReturn> checkReturnApplication(Integer storeId) {
		String hql = "From ProductReturn WHERE store_Id=:storeId";
		Query query = getSession().createQuery(hql).setParameter("storeId", storeId);
		List<ProductReturn> customerReturn = query.list();
		return customerReturn;
	}

	/**
	 * 利用memberId 查order
	 * 
	 * @param member
	 * @return
	 */
	@Override
	public Map findOrder(Member member) {
		String hqlOeder = "From Order Where member_id =: memberId";
		Query quert = getSession().createQuery(hqlOeder).setParameter("memberId", member.getMemberId());
		List<Order> listOrder = quert.list();
		Iterator it = listOrder.iterator();
		List all = new ArrayList();

		while (it.hasNext()) {
			Order rows = (Order) it.next();
			System.out.println("rows" + rows.getOrderId());
			int idd = rows.getOrderId();
			System.out.println("idd = " + idd);
			String hqlOrderDetail = "From OrderDetail Where order_id =: orderId";
			Query quert2 = getSession().createQuery(hqlOrderDetail).setParameter("orderId", idd);
			List<OrderDetail> listOrderDetail = quert2.list();
			System.out.println("================size===============" + listOrderDetail.size());

			System.out.println("OrderDetail = " + listOrderDetail);
			all.add(listOrderDetail);
		}
		HashMap allmap = new HashMap();
		allmap.put("listOrder", listOrder);
		allmap.put("listOrderDetail", all);
		return allmap;

	}
	
	/**
	 * 透過storeId找出該商家所有order、orderDetail
	 */
	@Override
	public  List<OrderDetail> getOrderRangeDate(Integer storeId,Date startDate,Date endDate) {
		String hql = "From OrderDetail WHERE store_Id=:sId and order.orderDate>=:startDate and order.orderDate<=:endDate";
		Query query = getSession().createQuery(hql).setParameter("sId", storeId).setParameter("startDate", startDate).setParameter("endDate", endDate);
		List<OrderDetail> getOrderDetailByStoreId = query.list();
		return getOrderDetailByStoreId;
	}


}
