package com.fund.controller.fundReply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundReply;
import com.fund.model.eneity.Reply;
import com.fund.model.eneity.Store;
import com.fund.model.fundreply.service.IFundReplyService;
import com.fund.model.store.service.IStoreService;

@Controller
public class FundReplyController {
	
	
	@Autowired
	private IStoreService storeServiceImpl;
	
	@Autowired
	private IFundReplyService fundReplyServiceImpl;
	
	@RequestMapping(value = "/addFundReply",method = RequestMethod.POST)
	public String addFundReply(FundReply fundReply,HttpSession httpSession,
			@RequestParam(value = "file", required = false) MultipartFile file, 
			@RequestParam(value = "fundMsgId", required = false) Integer fundMsgId,
			@RequestParam(value = "fundProductId", required = false) Integer fundProductId,
			HttpServletRequest request) {
		System.out.println("----------------------"+fundReply.getFundReplyId()+"----"+fundReply.getFundReplyPf()+"----"+fundMsgId);
		Store storeSession = (Store) httpSession.getAttribute("storeSession");
		Store getStore = storeServiceImpl.findStoreById(storeSession.getStoreId());
		if(null != getStore) {
			if(!file.getOriginalFilename().isEmpty()) {//如有有上傳檔案
				String pic = fundReplyServiceImpl.addReplyPic(file, request);// 圖片存檔
			if (!pic.equals("errorPic")) {// 圖片存取正常
				fundReply.setFundReplyPic(pic);// 設定圖片路徑
				fundReplyServiceImpl.addFundReply(fundReply, getStore,fundMsgId,fundProductId);// 存入資料庫
				return "redirect:/FindFundMsg";
			} else {
				return "Reply/error";
			}
			}else {//沒上傳檔案直接存取資料庫
				fundReplyServiceImpl.addFundReply(fundReply, getStore,fundMsgId,fundProductId);// 存入資料庫
				return "redirect:/FindFundMsg";
			}		
		}else {
			return "Member/noLogin";
		}
	}
	
}
