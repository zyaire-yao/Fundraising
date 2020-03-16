package com.fund.model.order.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.hibernate.query.Query;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.ProductReturn;

public interface IOrderDao {
	
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
	 * 商家更新貨運狀態
	 */

	public void updateOrderStatus(Query query, Query query2);

	/*
	 * 更新狀態使用
	 */
	public void updateStatus(Query query);

	/*
	 * 商家審核退貨系統，可以得知被退貨商品等細項，進而審核。
	 */
	public void replyReturnStatus(Query query, Query query2);

	/*
	 * 將消費者的退貨申請單存入productReturn。
	 */
	public void addReturnItems(ProductReturn productReturn);

	/*
	 * 透過storeId將該商店所有的退貨品項全數取出。
	 */
	public List<ProductReturn> checkReturnApplication(Integer storeId);

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
