package com.fund.model.fundOrder.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProduct;

@Repository
public class FundOrderDaoImpl implements IFundOrderDao{

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addFundOrder(FundOrder fundOrder) {
		getSession().save(fundOrder);
	}
	@Override
	public List<FundOrder> findAllFundOrderByFundProductId(Integer fundProductId) {
		String hql = "From FundOrder Where fund_product_id =: id";
		Query query = getSession().createQuery(hql).setParameter("id", fundProductId);
		return query.list();
	}
	@Override
	public Integer findFundSettleTotalByFundProductId(Integer fundProductId) {
		String hql = "select sum(fundOrderTotal) from FundOrder Where fund_product_id =:id";
		Query query = getSession().createQuery(hql).setParameter("id", fundProductId);
		long fundSettleTotal = (long) query.list().get(0);
		return  (int) fundSettleTotal;

	}
	/*
	 * 透過memberId找出消費者贊助訂單。
	 */
	@Override
	public List<FundOrder> getFundOrdersByMemberId(Integer memberId) {
		String hql = "From FundOrder where member_Id=:memberId";
		Query query = getSession().createQuery(hql).setParameter("memberId", memberId);
		List<FundOrder> getFundOrdersByMemberId = query.list();
		return getFundOrdersByMemberId;
	}
	
	/*
	 * 透過storeId找出贊助訂單。
	 */
	@Override
	public List<FundOrder> getFundOrdersByStoreId(Integer storeId) {
		String hql = "From FundOrder where store_Id=:storeId";
		Query query = getSession().createQuery(hql).setParameter("storeId", storeId);
		List<FundOrder> getFundOrdersByStoreId = query.list();
		return getFundOrdersByStoreId;
	}

	/*
	 * 更新狀態使用
	 */
	@Override
	public void updateStatus(Query query) {
		query.executeUpdate();
	}
	
	/**
	 * FundOrder區間查詢
	 */
	@Override
	public List<FundOrder> getDateRangeFundOrder(Integer storeId,Date startDate,Date endDate){
		String hql="From FundOrder where store_id =:id and  fundOrderDate>=:startDate and fundOrderDate<=:endDate";
		Query query=getSession().createQuery(hql).setParameter("id", storeId).setParameter("startDate", startDate).setParameter("endDate", endDate);
		List<FundOrder> resultFundOrder = query.list();
		return resultFundOrder;
	}
	
	/**
	 * FundOrder排序
	 */
	@Override
	public List<FundOrder> getReverseFundOrder(Integer storeId){
		String hql="From FundOrder where store_id =:id";
		Query query=getSession().createQuery(hql).setParameter("id", storeId);
		List<FundOrder> resultFundOrder = query.list();
		return resultFundOrder;
	}

}
