package com.fund.model.reply.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.fund.model.eneity.Reply;

public interface IReplyDao {
	
	/**
	 * 新增回覆留言
	 * @param reply
	 */
	public void appReply(Reply reply);
	
	/**
	 * 查詢商家全部回覆
	 * @return
	 */
	public List<Reply> findAllReply(Integer storeId);
	
	
    /**
     * 查詢Reply By productId
     * @param productId
     * @return
     */
	public List<Reply> findReplyByProductId(Integer productId);
	

}
