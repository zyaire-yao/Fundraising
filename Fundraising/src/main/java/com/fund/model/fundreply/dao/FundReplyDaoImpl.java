package com.fund.model.fundreply.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.FundReply;

@Repository
public class FundReplyDaoImpl implements IFundReplyDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	/**
	 * 新增回覆
	 */
	public void addFundReply(FundReply fundReply) {
		getSession().save(fundReply);
	}
	
	/**
	 * 店家查詢所有回覆
	 */
	public List<FundReply> findAllFundReplyByStoreId(Integer storeId){
		String hql="From FundReply Where store_id =: id";
		Query query=getSession().createQuery(hql).setParameter("id", storeId);
		List<FundReply> allFundReply = query.list();
		return allFundReply;
		
	}

	@Override
	public List<FundReply> listFindFundReplyByFundProductId(Integer fundProductId) {
		String hql="From FundReply Where fund_product_id =: id";
		Query query=getSession().createQuery(hql).setParameter("id", fundProductId);
		List<FundReply> allFundReply = query.list();
		return allFundReply;
	}
}
