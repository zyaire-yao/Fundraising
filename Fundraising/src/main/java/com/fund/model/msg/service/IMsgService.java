package com.fund.model.msg.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Msg;

public interface IMsgService {

	/**
	 * 新增留言
	 * @param msg
	 * @param member
	 * @param productId
	 */
	public void addMsg(Msg msg,Member member, Integer productId);
	
	/*
	 * 針對商品查詢留言
	 * */
	public List<Msg> getMsgByProductId(Integer productId);
	
	/*
	 * 針對商品查詢留言 StoreId
	 * */
	public List<Msg> getMsgByStoreId(Integer StoreId);
	
	/*
	 * 上傳圖片
	 * */
	public String addMsgPic(MultipartFile file, HttpServletRequest request);

}
