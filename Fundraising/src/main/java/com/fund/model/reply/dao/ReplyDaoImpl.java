package com.fund.model.reply.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.Reply;

@Repository
public class ReplyDaoImpl implements IReplyDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	/**
	 * 新增回覆留言
	 * @param reply
	 */
	@Override
	public void appReply(Reply reply) {
		try {
			getSession().save(reply);
		} catch (Exception e) {
            System.out.println("新增回覆失敗");
			e.printStackTrace();
		}
	}
	
	/**
	 * 查詢商家全部回覆
	 * @return
	 */
	@Override
	public List<Reply> findAllReply(Integer storeId){
		String hql = "From Reply where store_id =:id";
		Query query = getSession().createQuery(hql).setParameter("id", storeId);
		List<Reply> listReply = query.list();
		return listReply;		
	}
	
	
    /**
     * 查詢Reply By productId
     * @param productId
     * @return
     */
	@Override
	public List<Reply> findReplyByProductId(Integer productId){
		String hql = "From Reply where product_id =:id";
		Query query = getSession().createQuery(hql).setParameter("id", productId);
		List<Reply> listReply = query.list();
		return listReply;
	}
	
}
