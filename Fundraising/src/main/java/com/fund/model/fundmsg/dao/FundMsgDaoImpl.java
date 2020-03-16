package com.fund.model.fundmsg.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.FundMsg;
import com.fund.model.eneity.Msg;


@Repository
public class FundMsgDaoImpl implements IFundMsgDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	
	/**
	 * 新增募資留言
	 */
	@Override
	public void addFundMsg(FundMsg fundMsg) {
		getSession().save(fundMsg);
	}
	
	
	/**
	 *  針對商品查詢留言
	 */
	@Override
	public List<FundMsg> listFindFundMsgByFundProductId(Integer fundProductId){
		String hql="from FundMsg Where fund_product_id =:id";
		Query query=getSession().createQuery(hql).setParameter("id", fundProductId);
		List<FundMsg> fundMsgs = query.list();
		return fundMsgs;
	}
	
	public FundMsg findFundMsgByFundMsgId(Integer fundMsgId) {
		String hql="from FundMsg Where fundMsgId =: id";
		Query query=getSession().createQuery(hql).setParameter("id", fundMsgId);
		FundMsg fundMsg = (FundMsg) query.list().get(0);
		return fundMsg;
		
	}


	@Override
	public List<FundMsg> listFindAllFundMsgByStoreId(Integer storeId) {
		String hql="from FundMsg Where store_id =: id";
		Query query=getSession().createQuery(hql).setParameter("id", storeId);
		List<FundMsg> allFundMsg = query.list();
		return allFundMsg;
	}
}
