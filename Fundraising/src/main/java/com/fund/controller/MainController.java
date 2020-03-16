package com.fund.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fund.model.back.service.IBackService;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.OrderDetail;

@Controller
public class MainController {
	
	@Autowired
	private IBackService backServiceImpl;
	
	/**
	 * @正式首頁
	 * @return
	 */
	@RequestMapping(path = "/")
	 public String homePage() {
	  return "HomePage/homePage";
	 }
	
//    /**
//     * @簡易首頁
//     */
//	@RequestMapping(path = "/")
//	public String homePage() {
//		return "home";
//	}
	
	/**
	 * @映射路徑到register
	 */
	@RequestMapping(path = "/register")
	public String register() {
		return "MemberSystem/register";
	}

	/**
	 * @映射路徑到loginSystem
	 */
	@RequestMapping(path = "/loginSystem")
	public String loginSystem() {
		return "MemberSystem/loginSystem";
	}
	
	/**
	 * @映射路徑到registerStore
	 */
	@RequestMapping(path = "/registerStore")
	public String registerStore() {
		return "Store/storeRegister";
	}
	
	/**
	 * @映射路徑到updatePwd
	 */
	@RequestMapping(path = "/updatePwd")
	public String updatePwd() {
		return "MemberSystem/updatePwd";
	}
	
	/**
	 * @映射路徑到addProduct
	 */                     
	@RequestMapping(path = "/linkinAddProduct")
	public String linkinAddProduct() {
		return "Product/addProduct";
	}
	
	/**
	 * @映射路徑到findPwd
	 */                     
	@RequestMapping(path = "/findPwd")
	public String findPwd() {
		return "MemberSystem/findPwd";
	}

	
	/**
	 * @映射路徑到updateFindPwd
	 */                     
	@RequestMapping(path = "/updateFindPwd")
	public String updateFindPwd() {
		return "MemberSystem/updateFindPwd";
	}
	
	/**
	 * @映射路徑到Fund
	 */
	@RequestMapping(path = "/fund")
	public String addFundProject() {
		return "FundProject/Fund";
	}
	
	/**
	 * @後臺測試用_後台首頁
	 */
	@RequestMapping(path ="/back" )
	public String back(Model model) {
		List<OrderDetail> orderDetailSum = backServiceImpl.findOrderDetailSumToAPI();
		model.addAttribute("orderDetailSum", orderDetailSum);
		
		List<FundSettle> fundSettleSum = backServiceImpl.findFundSettleSumToAPI();
		model.addAttribute("fundSettleSum", fundSettleSum);
		
		return "Back/back";
	}

	/**
	 * @後臺測試用_傳到登入頁面
	 */
	@RequestMapping(path = "/managerlogin")
	public String managerlogin() {
		return "Back/managerlogin";
	}
	
	/**
	  * @映射路徑到addFundProduct
	  */                     
	 @RequestMapping(path = "/linkinAddFundProduct")
	 public String linkinAddFundProduct() {
	  return "FundProduct/addFundProduct";
	 }
	
		/**
	  * @映射路徑到addreport
	  */                     
	 @RequestMapping(path = "/Addreport")
	 public String addreport(@RequestParam(name="productId")Integer productId,Model model) {
     model.addAttribute("productId", productId);
	 return "Product/report";
	 }
	 

		/**
		  * @映射路徑到fundProject
		  */                     
		 @RequestMapping(path = "/FundProject")
		 public String FundProject() {
		 return "StoreBackstage/fundProject";
		 }
		 
		 
			 
	
}
