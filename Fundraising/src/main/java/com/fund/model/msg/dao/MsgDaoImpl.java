package com.fund.model.msg.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.Msg;
import com.fund.model.eneity.Reply;
import com.fund.model.eneity.ShoppingCart;
@Repository
public class MsgDaoImpl implements IMsgDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	/* 
	  * 新增留言
	 */
	@Override
	public void addMsg(Msg msg) {
		try {
			getSession().save(msg);
			System.out.println("留言成功-Dao");
		} catch (Exception e) {
			System.out.println("留言失敗-Dao");
			e.printStackTrace();
		}
	}
	
	/*
	 * 針對商品查詢留言
	 * */
	@Override
	public List<Msg> getMsgByProductId(Integer productId) {
		String hqlstr = "From Msg where product_Id=:id";
		Query query = getSession().createQuery(hqlstr).setParameter("id", productId);
		List<Msg> AllMsg = query.list();
		if (AllMsg.size() > 0) {
			return AllMsg;
		} else {
			return null;
		}
	}
	
	/*
	 * 針對商品查詢留言 StoreId
	 * */
	@Override
	public List<Msg> getMsgByStoreId(Integer StoreId) {
		String hqlstr = "From Msg where store_Id=:id";
		Query query = getSession().createQuery(hqlstr).setParameter("id", StoreId);
		List<Msg> AllMsg = query.list();
		if (AllMsg.size() > 0) {
			return AllMsg;
		} else {
			return null;
		}
	}
	
	/**
	 * 查Msg BY msgId
	 * @param msgId
	 * @return
	 */
	@Override
	public Msg getMsgByMsgId(Integer msgId) {
		return getSession().get(Msg.class, msgId);
	}
	
	
	


	
}
