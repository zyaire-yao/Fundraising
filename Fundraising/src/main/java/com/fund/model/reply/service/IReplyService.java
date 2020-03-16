package com.fund.model.reply.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Reply;
import com.fund.model.eneity.Store;

public interface IReplyService {

	/**
	 * 新增回覆留言
	 * @param reply
	 */
	public void appReply(Reply reply,Store getStore,Integer msgId,Integer productId);
	
	/**
	 * @Servic 存入照片
	 * @param file
	 * @param request
	 * @return
	 */
	public String addReplyPic(MultipartFile file, HttpServletRequest request);
	
	
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
