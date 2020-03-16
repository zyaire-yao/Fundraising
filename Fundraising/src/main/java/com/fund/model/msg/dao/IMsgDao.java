package com.fund.model.msg.dao;

import java.util.List;

import com.fund.model.eneity.Msg;

public interface IMsgDao {

	/*
	 * 
	  * 新增留言
	 * */
	public void addMsg(Msg msg);
	
	/*
	 * 針對商品查詢留言
	 * */
	public List<Msg> getMsgByProductId(Integer productId);
	
	/*
	 * 針對商品查詢留言 StoreId
	 * */
	public List<Msg> getMsgByStoreId(Integer StoreId);
	
	/**
	 * 查Msg BY msgId
	 * @param msgId
	 * @return
	 */
	public Msg getMsgByMsgId(Integer msgId);
}
