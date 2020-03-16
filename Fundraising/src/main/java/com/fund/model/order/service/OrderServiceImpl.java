package com.fund.model.order.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.ProductReturn;
import com.fund.model.order.dao.IOrderDao;

@Service
public class OrderServiceImpl implements IOrderService{

	@Autowired
	private IOrderDao orderDaoImpl;

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
		return orderDaoImpl.recheckOrderDetailByodId(odId);
	}


	/*
	 * 透過storeId 將商家所有OrderDetail找出來。
	 */
	@Override
	public List<OrderDetail> getOrderDetailByStoreId(int storeId) {
		return orderDaoImpl.getOrderDetailByStoreId(storeId);
	}

	/*
	 * 用前端傳回來的orderDetailId找出所屬的List<OrderDetail>。
	 */
	@Override
	public List<OrderDetail> listOrderDetail(int orderDetailId) {
		return orderDaoImpl.listOrderDetail(orderDetailId);
	}
	
	/*
	 * 消費者訂單完成按鈕
	 */
	@Override
	public void finishOrder(Integer orderDetailId) {
		
		String hql="Update OrderDetail od set od.orderDeliveryStatus=:odStatus WHERE od.orderDetailId=:orderDetailId";
		Query query =getSession().createQuery(hql).setParameter("odStatus", "完成訂單").setParameter("orderDetailId", orderDetailId);
		orderDaoImpl.updateStatus(query);
	}
	

	/*
	 * 商家更新貨狀態，以利消費者追蹤查詢
	 */
	@Override
	public void updateOrderStatus(Integer orderId, OrderDetail orderDetail) {

		String hql = "Update OrderDetail od set od.orderDeliveryStatus=:odStatus WHERE od.orderDetailId=:oId";
		Query query = getSession().createQuery(hql).setParameter("oId", orderId).setParameter("odStatus",
				orderDetail.getOrderDeliveryStatus());

		String hqlDeliveryNumber = "Update OrderDetail od set od.orderDeliveryNumber=:odDeliveryNumber,od.orderDeliveryName=:orderDeliveryName WHERE od.orderDetailId=:oId";
		Query queryDeliveryNumber = getSession().createQuery(hqlDeliveryNumber).setParameter("oId", orderId)
				.setParameter("odDeliveryNumber", orderDetail.getOrderDeliveryNumber())
				.setParameter("orderDeliveryName", orderDetail.getOrderDeliveryName());

		orderDaoImpl.updateOrderStatus(query, queryDeliveryNumber);
	}

	/*
	 * 退貨申請單系統，同步更新多張table狀態，將退貨資料存進Return table
	 */
	@Override
	public void updateItemReturned(Integer orderDetailId, OrderDetail ordersDetail) {

		String hql = "Update OrderDetail od set od.orderDeliveryStatus=:odStatus WHERE od.orderDetailId=:orderDetailId";
		Query query = getSession().createQuery(hql).setParameter("odStatus", ordersDetail.getOrderDeliveryStatus())
				.setParameter("orderDetailId", orderDetailId);
		orderDaoImpl.updateStatus(query);
	}

	@Override
	public void addReturnItems(ProductReturn productReturn) {
		orderDaoImpl.addReturnItems(productReturn);
	}

	/*
	 * 透過storeID將自己商店中所有的退貨都找出來
	 */
	@Override
	public List<ProductReturn> checkReturnApplication(Integer storeId) {
		return orderDaoImpl.checkReturnApplication(storeId);
	}

	/*
	 * 商家審核退貨系統，並同步更新productReturn 與 orderDetail 的狀態。
	 */
	@Override
	public void replyReturnStatus(int productReturnId, ProductReturn productReturn, OrderDetail orderDetail) {

		ProductReturn productReturn1 = getSession().get(ProductReturn.class, productReturnId);
		int getOrderDetailId = productReturn1.getOrdersDetail().getOrderDetailId();
		String hql = "Update OrderDetail od set od.orderDeliveryStatus=:odStatus WHERE od.orderDetailId=:getOrderDetailId";
		Query query = getSession().createQuery(hql).setParameter("odStatus", orderDetail.getOrderDeliveryStatus())
				.setParameter("getOrderDetailId", getOrderDetailId);

		String hql2 = "Update ProductReturn pr set pr.productReturnStatus=:prStatus WHERE pr.productReturnId=:productReturnId";
		Query query2 = getSession().createQuery(hql2).setParameter("prStatus", productReturn.getProductReturnStatus())
				.setParameter("productReturnId", productReturnId);

		orderDaoImpl.replyReturnStatus(query, query2);

	}

	/**
	 * 利用memberId 查order
	 * 
	 * @param member
	 * @return
	 */
	@Override
	public Map findOrder(Member member) {
		return orderDaoImpl.findOrder(member);
	}
	
	/**
	 * 透過storeId找出該商家所有order、orderDetail
	 */
	@Override
	public  List<OrderDetail> getOrderRangeDate(Integer storeId,Date startDate,Date endDate) {
		return orderDaoImpl.getOrderRangeDate(storeId, startDate, endDate);
	}
	

}
