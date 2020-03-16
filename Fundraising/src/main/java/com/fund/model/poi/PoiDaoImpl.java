package com.fund.model.poi;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.OrderDetail;


@Repository
public class PoiDaoImpl {
	

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	/**
	 * 取得商家全部訂單明細
	 * @returnand order.orderDate 
	 */
	public List<OrderDetail> findOrderToPOI(Integer storeId,Date startDate,Date endDate){
		//查詢區間訂單明細
		String hql = "From OrderDetail where store_Id =: id and  order.orderDate>=:startDate and order.orderDate<=:endDate ";
		Query query = getSession().createQuery(hql);
		query.setParameter("id", storeId);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		List<OrderDetail> getListOrderDetail = query.list();
		return getListOrderDetail;
	}
	
	
	/**
	 * 取得商家全部訂單明細
	 * @returnand order.orderDate 
	 */
	public List<FundOrder> findFundOrderToPOI(Integer storeId,Date startDate,Date endDate){
		//查詢區間訂單明細
		String hql = "From FundOrder where store_Id =: id and  fund_order_date>=:startDate and fund_order_date<=:endDate ";
		Query query = getSession().createQuery(hql);
		query.setParameter("id", storeId);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		List<FundOrder> getListOrderDetail = query.list();
		return getListOrderDetail;
	}

}
