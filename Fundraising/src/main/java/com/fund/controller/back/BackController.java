package com.fund.controller.back;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fund.model.back.service.BackServiceImpl;
import com.fund.model.back.service.IBackService;
import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.Store;

@Controller
public class BackController {
	@Autowired
	private IBackService backServiceImpl;
	/**
	 * 抓取所有會員資料
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getBMember")
	public String listFindBMember(Model model) {
		List<Member> at = backServiceImpl.listFindMember();
		model.addAttribute("all", at);
		return "Back/bmember";
	}
	/**
	 * 抓取更改會員狀態
	 * @param httpSession
	 * @param model
	 * @param memberId
	 * @return
	 */
	@RequestMapping(value = "/getUpdateBMemberStatus", method = RequestMethod.GET)
	public String updateGetBMemberStatus(HttpSession httpSession, Model model,
			@RequestParam(name = "memberId") Integer memberId) {
		System.out.println("memberId:" + memberId);
		Member getMember = backServiceImpl.findUpdateGetMemberStatus(memberId);
		model.addAttribute("getMember", getMember);
		return "Back/UpdateMember";
	}
//
//	@RequestMapping(value = "/updateBMemberStatus", method = RequestMethod.POST)
//	public String updateBMemberStatus(Member member, HttpSession httpSession, Model model,
//			@PathParam(value = "status") String status, @RequestParam(name = "memberId") Integer memberId) {
//		if (status.equals("pass")) {
//			member.setMemberStatus("封鎖");
//			backServiceImpl.updateMemberStatus(memberId, member);
//			return "redirect:/getBMember";
//		} else {
//			member.setMemberStatus("正常");
//			backServiceImpl.updateMemberStatus(memberId, member);
//	
//
//			return "redirect:/getBMember";
//		}
//	}
	//TODO
	    /**
	     * 管理員修改會員資料及狀態
	     * @param httpSession
	     * @param member
	     * @param request
	     * @return 
	     * @throws Exception
	     */
		@RequestMapping(value = "/updateBMember", method = RequestMethod.POST) 
		public String updateBMember(HttpSession httpSession, Member member, HttpServletRequest request,Model model,@PathParam(value = "status") String status
				, @RequestParam(name = "memberId") Integer memberId) throws Exception {

	
			model.addAttribute("inputMember", member);//將原本輸入的值 在錯誤時 回傳至前端頁面
			if(member.getMemberFname().isEmpty()) {
				model.addAttribute("errorFname", "名子輸入不可為空");
				return "Back/UpdateMember";
			}else if(member.getMemberSname().isEmpty()) {
				model.addAttribute("errorSname", "暱稱輸入不可為空");
				return "Back/UpdateMember";
			}else if(member.getMemberTwid().isEmpty()) {
				model.addAttribute("errorTwid", "身分證字號輸入不可為空");
				return "Back/UpdateMember";
			}else if(member.getMemberHb().isEmpty()) {
				model.addAttribute("errorHb", "生日輸入不可為空");
				return "Back/UpdateMember";
			}else if(member.getMemberGd().isEmpty()) {
				model.addAttribute("errorGd", "性別輸入不可為空");
				return "Back/UpdateMember";
			}else if(member.getMemberCel().isEmpty()) {
				model.addAttribute("errorCel", "行動電話輸入不可為空");
				return "Back/UpdateMember";
			}else if (status.equals("pass")) {
				member.setMemberStatus("封鎖");
				backServiceImpl.updateMemberStatus(memberId, member);
			}else {
				member.setMemberStatus("正常");
				backServiceImpl.updateMemberStatus(memberId, member);
			}
			backServiceImpl.updateMember(member);
				return "redirect:/getBMember";
				}
		
//		
//		// 更改會員時抓取資料
//		@RequestMapping(value = "/getUpdateBMember", method = RequestMethod.GET)
//		public String updateGetBMember(HttpSession httpSession, Model model,
//				@RequestParam(name = "memberId") Integer memberId) { // 從前端的按鈕抓到memberId
//
//			List<Member> projects = backServiceImpl.findUpdateMemberByMemberId(memberId);
//			model.addAttribute("getMemberEmail", projects.get(0).getMemberEmail());
//			model.addAttribute("getMemberFname", projects.get(0).getMemberFname());
//			model.addAttribute("getMemberSname", projects.get(0).getMemberSname());
//			model.addAttribute("getMemberHb", projects.get(0).getMemberHb());
//			model.addAttribute("getMemberGd", projects.get(0).getMemberGd());
//			model.addAttribute("getMemberStatus", projects.get(0).getMemberStatus());
//			return "Back/UpdateMemberMember";
//		}
//
//		// 會員查詢
//		@RequestMapping(value = "/getBMember", method = RequestMethod.GET)
//		public String getBMember(HttpSession httpSession, Model model) {
//
//			Member memberSession = (Member) httpSession.getAttribute("memberSession");
//			Member member = (Member) backServiceImpl.findMemberByMemberId(memberSession.getMemberId());
//			int memberId = member.getMemberId();
//			if (memberId != 0) {
//				List<Member> projects = backServiceImpl.findMemberByMemberId(memberId);
//				model.addAttribute("test", projects);
//
//				return "Back/bmember";
//			} else {
//				model.addAttribute("nologin", "請先登入 3秒後跳至首頁");
//				return "MemberSystem/noLogin";
//			}
//		}
	/**
	 * 抓取所有商品
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getBProduct")
	public String listFindProduct(Model model) {
		List<Product> at = backServiceImpl.listFindProduct();
		model.addAttribute("all", at);
		return "Back/bproduct";
	}
	/**
	 * 抓取所有檢舉
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getBReport")
	public String listFindReport(Model model) {
		List<Report> at = backServiceImpl.listFindReport();
		Collections.reverse(at);//反向排序
		model.addAttribute("all", at);
		return "Back/breport";
	}
	/**
	 * 抓取所有商家資訊
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getBStore")
	public String listFindStore(Model model) {
		List<Store> at = backServiceImpl.listFindStore();
		model.addAttribute("all", at);
		return "Back/bstore";
	}
	/**
	 * 抓取所有募資專案
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getBFundProject")
	public String listFindFundProject(Model model) {
		List<FundProject> at = backServiceImpl.listFindFundProject();
		model.addAttribute("all", at);
		return "Back/bfundproject";
	}
	/**
	 * 抓取所有募資商品
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getBFundOrder")
	public String listFindFundOrder(Model model) {
		List<FundOrder> at = backServiceImpl.listFindFundOrder();
		model.addAttribute("all", at);
		return "Back/bfundorder";
	}
	/**
	 * 抓取所有商品訂單
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getBOrderDetail")
	public String listFindOrderDetail(Model model) {
		List<OrderDetail> at = backServiceImpl.listFindOrderDetail();
		model.addAttribute("all", at);
		return "Back/borderdetail";
	}
	//TODO
    /**
     * 管理員修改商家資料及狀態
     * @param httpSession
     * @param member
     * @param request
     * @return 
     * @throws Exception
     */
	@RequestMapping(value = "/updateBStore", method = RequestMethod.POST) 
	public String updateBStore(HttpSession httpSession, Store store, HttpServletRequest request,Model model,
			@PathParam(value = "status") String status, @RequestParam(name = "storeId") Integer storeId
			) throws Exception {


		model.addAttribute("inputStore", store);//將原本輸入的值 在錯誤時 回傳至前端頁面
		if(store.getStorePf().isEmpty()) {
			model.addAttribute("errorPf", "簡介輸入不可為空");
			return "Back/UpdateStore";
		}else if(store.getStoreTel().isEmpty()) {
			model.addAttribute("errorTel", "電話輸入不可為空");
			return "Back/UpdateStore";
		}else if(store.getStorePic().isEmpty()) {
			model.addAttribute("errorPic", "圖片輸入不可為空");
			return "Back/UpdateStore";
		}else if(store.getStoreAddress().isEmpty()) {
			model.addAttribute("errorAddress", "地址輸入不可為空");
			return "Back/UpdateStore";
		}else if(store.getStoreNumber().isEmpty()) {
			model.addAttribute("errorNumber", "號碼輸入不可為空");
			return "Back/UpdateStore";
		}else if(store.getStoreAccount().isEmpty()) {
			model.addAttribute("errorAccount", "帳戶輸入不可為空");
			return "Back/UpdateStore";
		}else if(store.getStorePiName().isEmpty()) {
			model.addAttribute("errorPiName", "負責人姓名輸入不可為空");
			return "Back/UpdateStore";
		}else if(store.getStorePiTwid().isEmpty()) {
			model.addAttribute("errorPiTwid", "負責人身分證輸入不可為空");
			return "Back/UpdateStore";
		}else if(store.getStorePiTel().isEmpty()) {
			model.addAttribute("errorPiTel", "負責人電話輸入不可為空");
			return "Back/UpdateStore";
		}else if(store.getStorePiAddress().isEmpty()) {
			model.addAttribute("errorPiAddress", "負責人地址輸入不可為空");
			return "Back/UpdateStore";
		}else if (status.equals("pass")) {
			store.setStoreStatus("封鎖");
			backServiceImpl.updateStoreStatus(storeId, store);
		} else {
			store.setStoreStatus("正常");
			backServiceImpl.updateStoreStatus(storeId, store);		
		}
		backServiceImpl.updateStore(store);
			return "redirect:/getBStore";
			}
	


	@RequestMapping(value = "/getUpdateBStoreStatus", method = RequestMethod.GET)
	public String updateGetBStoreStatus(HttpSession httpSession, Model model,
			@RequestParam(name = "storeId") Integer storeId) {
		Store getStore = backServiceImpl.findUpdateGetStoreStatus(storeId);
		model.addAttribute("getStore", getStore);
		return "Back/UpdateStore";
	}

//	@RequestMapping(value = "/updateBStoreStatus", method = RequestMethod.POST)
//	public String updateBStoreStatus(Store store, HttpSession httpSession, Model model,
//			@PathParam(value = "status") String status, @RequestParam(name = "storeId") Integer storeId) {
//		if (status.equals("pass")) {
//			store.setStoreStatus("封鎖");
//			backServiceImpl.updateStoreStatus(storeId, store);
//			return "redirect:/getBStore";
//		} else {
//			store.setStoreStatus("正常");
//			backServiceImpl.updateStoreStatus(storeId, store);
//	
//
//			return "redirect:/getBStore";
//		}
//	}

	/**
	 * 模糊查詢會員
	 * @return
	 */
	@RequestMapping(value = "/memberEmailLike")
	public String findMemberLike(@RequestParam(name = "Inquire")String Inquire,
			@RequestParam(name = "InquireSelect")Integer InquireSelect,
			Model model) {
		List<Member> listMember = backServiceImpl.findMemberLike(Inquire,InquireSelect);
		model.addAttribute("listMember", listMember);//回傳查詢結果至jsp
		model.addAttribute("Inquire", Inquire);//將原本輸入值回傳jsp
		model.addAttribute("InquireSelect", InquireSelect);//將原本輸入值回傳jsp
		return "Back/bmember";	
	}
	/**
	 * 模糊查詢商家
	 * @return
	 */
	@RequestMapping(value = "/storeLike")
	public String findStoreLike(@RequestParam(name = "Inquire")String Inquire,
			@RequestParam(name = "InquireSelect")Integer InquireSelect,
			Model model) {
		List<Store> listStore = backServiceImpl.findStoreLike(Inquire,InquireSelect);
		model.addAttribute("listStore", listStore);//回傳查詢結果至jsp
		model.addAttribute("Inquire", Inquire);//將原本輸入值回傳jsp
		model.addAttribute("InquireSelect", InquireSelect);//將原本輸入值回傳jsp
		return "Back/bstore";	
	}
	/**
	 * 模糊查詢商品
	 * @return
	 */
	@RequestMapping(value = "/productLike")
	public String findProductLike(@RequestParam(name = "Inquire")String Inquire,
			@RequestParam(name = "InquireSelect")Integer InquireSelect,
			Model model) {
		List<Product> listProduct = backServiceImpl.findProductLike(Inquire,InquireSelect);
		model.addAttribute("listProduct", listProduct);//回傳查詢結果至jsp
		model.addAttribute("Inquire", Inquire);//將原本輸入值回傳jsp
		model.addAttribute("InquireSelect", InquireSelect);//將原本輸入值回傳jsp
		return "Back/bproduct";	
	}
	/**
	 * 模糊查詢募資訂單
	 * @return
	 */
	@RequestMapping(value = "/bfundOrderLike")
	public String findfundOrderLike(@RequestParam(name = "Inquire")String Inquire,
			@RequestParam(name = "InquireSelect")Integer InquireSelect,
			Model model) {
		List<FundOrder> listFundOrder = backServiceImpl.findfundOrderLike(Inquire,InquireSelect);
		model.addAttribute("listFundOrder", listFundOrder);//回傳查詢結果至jsp
		model.addAttribute("Inquire", Inquire);//將原本輸入值回傳jsp
		model.addAttribute("InquireSelect", InquireSelect);//將原本輸入值回傳jsp
		return "Back/bfundorder";	
	}
	/**
	 * 模糊查詢商品訂單
	 * @return
	 */
	@RequestMapping(value = "/bOrderDetailLLike")
	public String findOrderDetailLike(@RequestParam(name = "Inquire")String Inquire,
			@RequestParam(name = "InquireSelect")Integer InquireSelect,
			Model model) {
		List<OrderDetail> listOrderDetail = backServiceImpl.findOrderDetailLike(Inquire,InquireSelect);
		model.addAttribute("listOrderDetail", listOrderDetail);//回傳查詢結果至jsp
		model.addAttribute("Inquire", Inquire);//將原本輸入值回傳jsp
		model.addAttribute("InquireSelect", InquireSelect);//將原本輸入值回傳jsp
		return "Back/borderdetail";	
	}
	
	
//	/**
//	 * 
//	 * @param 刪除會員
//	 * @param memberId
//	 * @return
//	 */
//	@RequestMapping(value = "/deleteBMember",method = RequestMethod.POST)
//	public String deleteMember(HttpSession htppHttpSession,@RequestParam(name = "memberId")Integer memberId) {
//
//		backServiceImpl.deleteMember(memberId);
//		return "redirect:/getBMember";
//		}
//	
//	/**
//	 * 
//	 * @param 刪除商家
//	 * @param storeId
//	 * @return
//	 */
//	@RequestMapping(value = "/deleteBStore",method = RequestMethod.POST)
//	public String deleteStore(HttpSession htppHttpSession,@RequestParam(name = "storeId")Integer storeId) {
//
//		backServiceImpl.deleteStore(storeId);
//		return "redirect:/getBStore";
//		}
	
	/**
	 * 新增全部商品明細poi
	 * @return
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@SuppressWarnings("unused")
	@RequestMapping(path = "/getBOrderDetailPoi" , method = RequestMethod.POST)
	public String addProductDetailPoi(HttpServletResponse response,
			HttpSession httpSession,Model model,
			@RequestParam(name = "startDate") String startDate,
			@RequestParam(name = "endDate") String endDate) throws IOException, ParseException
		 {

			if(!startDate.isEmpty() && !endDate.isEmpty()) {
							String dateStart =startDate.replace("-", "");//除去日期中的符號
			int dStart=Integer.valueOf(dateStart);//轉型為Integer	
			String dateEnd =endDate.replace("-", "");//除去日期中的符號
			int dEnd=Integer.valueOf(dateEnd);//轉型為Integer
			int days=dEnd-dStart;//用來判斷輸入日期是否合理，若結束時間-開始時間小於0則錯。
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//將String轉為Date型態，並設定格式
			Date dateS = sdf.parse(startDate);//進行轉換
			Date dateE = sdf.parse(endDate);//進行轉換
			
			if(days>=0) {
			    response.setContentType("application/x-excel");//這裡設定的檔案格式是application/x-excel
		        response.setHeader("Content-Disposition", "attachment;filename=" +new String("使用者列表.xls".getBytes(), "ISO-8859-1"));
				ServletOutputStream outputStream = response.getOutputStream();
				backServiceImpl.bAddProductDetailPoi(outputStream,dateS,dateE);
				if (outputStream != null)
					
					outputStream.close();
				
		        return "redirect:/findOrderDetailLike";
			}else {
				model.addAttribute("errorDate", "時間輸入錯誤");
				return "redirect:/findOrderDetailLike";
			}
			}else {
				model.addAttribute("errorDate2", "請輸入時間");
				return "redirect:/findOrderDetailLike";
			}
		}
		
	
	
	/**
	 * 新增全部募資明細poi
	 * @return
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@SuppressWarnings("unused")
	@RequestMapping(path = "/getBFundOrderPoi" , method = RequestMethod.POST)
	public String addFundOrderPoi(HttpServletResponse response,
			HttpSession httpSession,Model model,
			@RequestParam(name = "startDate") String startDate,
			@RequestParam(name = "endDate") String endDate) throws IOException, ParseException
		 {
		
			if(!startDate.isEmpty() && !endDate.isEmpty()) {
							String dateStart =startDate.replace("-", "");//除去日期中的符號
			int dStart=Integer.valueOf(dateStart);//轉型為Integer	
			String dateEnd =endDate.replace("-", "");//除去日期中的符號
			int dEnd=Integer.valueOf(dateEnd);//轉型為Integer
			int days=dEnd-dStart;//用來判斷輸入日期是否合理，若結束時間-開始時間小於0則錯。
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//將String轉為Date型態，並設定格式
			Date dateS = sdf.parse(startDate);//進行轉換
			Date dateE = sdf.parse(endDate);//進行轉換
			
			if(days>=0) {
			    response.setContentType("application/x-excel");//這裡設定的檔案格式是application/x-excel
		        response.setHeader("Content-Disposition", "attachment;filename=" +new String("使用者列表.xls".getBytes(), "ISO-8859-1"));
				ServletOutputStream outputStream = response.getOutputStream();
				backServiceImpl.bAddFundOrderPoi(outputStream,dateS,dateE);
				if (outputStream != null)
					
					outputStream.close();
				
		        return "redirect:/listFindFundOrder"; 
			}else {
				model.addAttribute("errorDate", "時間輸入錯誤");
				return "redirect:/listFindFundOrder";
			}
			}else {
				model.addAttribute("errorDate2", "請輸入時間");
				return "redirect:/listFindFundOrder";
			}
		}
		
		
	}

