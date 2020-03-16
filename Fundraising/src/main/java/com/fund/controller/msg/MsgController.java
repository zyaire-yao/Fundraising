package com.fund.controller.msg;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Msg;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Reply;
import com.fund.model.eneity.Store;
import com.fund.model.member.service.IMemberService;
import com.fund.model.msg.service.IMsgService;
import com.fund.model.product.service.IProductService;
import com.fund.model.reply.service.IReplyService;
import com.fund.model.store.service.IStoreService;

@Controller
public class MsgController {
	@Autowired
	private IMemberService memberServiceImpl;
	@Autowired
	private IMsgService msgServiceImpl;
	@Autowired
	private IProductService productServiceImpl;
	@Autowired
	private IStoreService storeServiceImpl;
	@Autowired
	private IReplyService replyService;
	

	/*
	 * 會員新增留言
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/addMsg", method = RequestMethod.POST)
	public String addMsg(HttpSession httpSession, @RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(name = "productId") Integer productId, Msg msg, HttpServletRequest request, Model model)
			throws Exception {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");
		Member getMember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
		if (null == memberSession) {
			System.out.println("未登入");
			return "MemberSystem/noLogin";
		} else if (file.getBytes().length > 3145728) {
			System.out.println("檔案超出大小限制3M");
			return "redirect:/getProductDetail";
		} else if (!file.getOriginalFilename().isEmpty()) {
			String addPic = msgServiceImpl.addMsgPic(file, request);// 新增商品圖片
			if (!addPic.equals("errorPic")) {
				msg.setMsgPic(addPic);
				msgServiceImpl.addMsg(msg, getMember, productId);
				System.out.println("留言成功");
				List<Product> Items = productServiceImpl.getoneProductService(productId);//??
				List<Msg> AllMsg = msgServiceImpl.getMsgByProductId(productId);
				Product product = Items.get(0);//??
				int Items2 = (int) productServiceImpl.getStoreService(productId).get(0);//??
				Store store = storeServiceImpl.findStoreById(Items2);//??
				List<Reply> reply = replyService.findReplyByProductId(productId);
				model.addAttribute("productDetail", product);//??
				model.addAttribute("store", store);//??
				model.addAttribute("reply", reply);
				model.addAttribute("MsgByProductId", AllMsg);
				return "Product/ProductDetail";
			} else {
				System.out.println("圖片存取失敗");
				return "redirect:/getProductDetail";
			}
		}else {
			msgServiceImpl.addMsg(msg, getMember, productId);
			System.out.println("留言成功");
			List<Product> Items = productServiceImpl.getoneProductService(productId);
			List<Msg> AllMsg = msgServiceImpl.getMsgByProductId(productId);
			List<Reply> reply = replyService.findReplyByProductId(productId);
			Product product = Items.get(0);//??
			int Items2 = (int) productServiceImpl.getStoreService(productId).get(0);//??
			Store store = storeServiceImpl.findStoreById(Items2);//??
			model.addAttribute("productDetail", product);//??
			model.addAttribute("store", store);//??
			model.addAttribute("reply", reply);
			model.addAttribute("MsgByProductId", AllMsg);
			return "Product/ProductDetail";
		}
	}

}
