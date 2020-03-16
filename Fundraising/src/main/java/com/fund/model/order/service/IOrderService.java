package com.fund.model.order.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.ProductReturn;

public interface IOrderService {

	
	/*
	 * 使用customerReturn.jsp所回傳的odId資料重新將orderDetail再取一次。
	 */
	public OrderDetail recheckOrderDetailByodId(Integer odId);


	/*
	 * 透過storeId 將商家所有OrderDetail找出來。
	 */
	public List<OrderDetail> getOrderDetailByStoreId(int storeId);

	/*
	 * 用前端傳回來的orderDetailId找出所屬的List<OrderDetail>。
	 */
	public List<OrderDetail> listOrderDetail(int orderDetailId);
	
	/*
	 * 消費者訂單完成按鈕
	 */
	public void finishOrder(Integer orderDetailId);
	

	/*
	 * 商家更新貨狀態，以利消費者追蹤查詢
	 */
	public void updateOrderStatus(Integer orderId, OrderDetail orderDetail);

	/*
	 * 退貨申請單系統，同步更新多張table狀態，將退貨資料存進Return table
	 */
	public void updateItemReturned(Integer orderDetailId, OrderDetail ordersDetail);

	public void addReturnItems(ProductReturn productReturn);

	/*
	 * 透過storeID將自己商店中所有的退貨都找出來
	 */
	public List<ProductReturn> checkReturnApplication(Integer storeId);

	/*
	 * 商家審核退貨系統，並同步更新productReturn 與 orderDetail 的狀態。
	 */
	public void replyReturnStatus(int productReturnId, ProductReturn productReturn, OrderDetail orderDetail);
	
	/**
	 * 利用memberId 查order
	 * 
	 * @param member
	 * @return
	 */
	public Map findOrder(Member member);
	
	/**
	 * 利用storeId 查order、orderDetail
	 */
	public List<OrderDetail> getOrderRangeDate(Integer storeId, Date startDate, Date endDate);
}
