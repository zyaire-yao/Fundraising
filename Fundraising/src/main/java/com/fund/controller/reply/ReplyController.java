package com.fund.controller.reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Reply;
import com.fund.model.eneity.Store;
import com.fund.model.reply.service.IReplyService;
import com.fund.model.store.service.IStoreService;

@Controller
public class ReplyController {

	@Autowired
	private IReplyService replyService;
	
	@Autowired
	private IStoreService storeServiceImpl;
	
	/**
	 * 新增回覆留言
	 * @param reply
	 */
	@RequestMapping(value = "addReply" ,method = RequestMethod.POST)
	public String addReply(Reply reply,HttpSession httpSession,
			@RequestParam(value = "file", required = false) MultipartFile file, 
			@RequestParam(value = "msgId", required = false) Integer msgId,
			@RequestParam(value = "productId", required = false) Integer productId,
			HttpServletRequest request) {
		System.out.println("----------------------"+reply.getReplyId()+"----"+reply.getReplyPf()+"----"+msgId);
		Store storeSession = (Store) httpSession.getAttribute("storeSession");
		Store getStore = storeServiceImpl.findStoreById(storeSession.getStoreId());
		if(null != getStore) {
			if(!file.getOriginalFilename().isEmpty()) {//如有有上傳檔案
				String pic = replyService.addReplyPic(file, request);// 圖片存檔
			if (!pic.equals("errorPic")) {// 圖片存取正常
				reply.setReplyPic(pic);// 設定圖片路徑
				replyService.appReply(reply, getStore,msgId,productId);// 存入資料庫
				return "redirect:/ProductMsg";
			} else {
				return "Reply/error";
			}
			}else {//沒上傳檔案直接存取資料庫
				replyService.appReply(reply, getStore,msgId,productId);// 存入資料庫
				return "redirect:/ProductMsg";
			}		
		}else {
			return "Member/noLogin";
		}
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
