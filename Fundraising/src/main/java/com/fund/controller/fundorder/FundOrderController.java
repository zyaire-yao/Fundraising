package com.fund.controller.fundorder;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fund.controller.store.StoreController;
import com.fund.model.back.service.IFundSettleService;
import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProgram;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.Store;
import com.fund.model.fundOrder.service.IFundOrderService;
import com.fund.model.fundProduct.service.IFundProductService;
import com.fund.model.fundProgram.service.IFundProgramService;
import com.fund.model.member.service.IMemberService;
import com.fund.model.store.service.IStoreService;

@Controller
public class FundOrderController {

	@Autowired
	private IMemberService memberServiceImpl;

	@Autowired
	private IFundOrderService fundOrderServiceImpl;

	@Autowired
	private IFundProgramService fundProgramServiceImpl;

	@Autowired
	private IFundProductService fundProductServiceImpl;

	@Autowired
	private IFundSettleService fundSettleServiceImpl;

	@Autowired
	private IStoreService storeServiceImpl;
	

	@Autowired
	private StoreController storeController;

	/**
	 * 建立募資訂單
	 * 
	 * @param fundOrder
	 * @param httpSession
	 * @param model
	 * @param fundProgramId
	 * @return
	 */
	@RequestMapping(value = "/addFundOrder", method = RequestMethod.GET)
	public String addFundOrder(FundOrder fundOrder, HttpSession httpSession, Model model,
			@RequestParam(name = "fundProgramId") Integer fundProgramId,
			@RequestParam(name = "paymentToFund") Integer paymentToFund) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
		if (memberSession != null) {
			Member member = (Member) memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
			if (fundOrder.getFundOrderName().isEmpty()) {
				System.out.println("收件人不可以為空");
				model.addAttribute("errorName", "收件人不可以為空");
				return "FundProduct/checkPage";
			} else if (fundOrder.getFundOrderAddress().isEmpty()) {
				System.out.println("收件地址不可以為空");
				model.addAttribute("errorAddress", "收件地址不可以為空");
				return "FundProduct/checkPage";
			} else if (fundOrder.getFundOrderPhone().isEmpty()) {
				System.out.println("收件人電話不可以為空");
				model.addAttribute("errorPhone", "收件電話不可以為空");
				return "FundProduct/checkPage";
			} else {
				if (paymentToFund == 1) {// 信用卡付費
					System.out.println("TOTAL:" + fundOrder.getFundOrderTotal());
					System.out.println("FundOrderExtraPrice:" + fundOrder.getFundOrderExtraPrice());
					System.out.println("FundOrderPrice:" + fundOrder.getFundOrderPrice());
					

					FundProgram fundProgram = fundProgramServiceImpl.findFundProgramDetailByFundProgramId(fundProgramId);
					int fundProductId = fundProgram.getFundProduct().getFundProductId();
					FundProduct fundProduct = fundProductServiceImpl.findFundProductDetailByFundProductId(fundProductId).get(0);
					int fundProjectId = fundProduct.getFundProject().getFundProjectId();
					Store store = fundProductServiceImpl.findStoreByFundProductId(fundProductId).getStore();
					FundSettle fundSettle = fundSettleServiceImpl.findFundSettleByFundProjectId(fundProjectId);

					fundOrderServiceImpl.addFundOreder(fundOrder, fundSettle, fundProduct, member, store); // 新增一筆訂單

					Integer fundSettleTotal = fundOrderServiceImpl.findFundSettleTotalByFundProductId(fundProductId); // 抓取商品總募資金額
					fundSettleServiceImpl.updateFundSettleTotal(fundSettleTotal, fundSettle.getFundSettleId()); // 更新結案表單的總金額

					int fundProgramLast = fundProgram.getFundProgramLast(); // 抓出現在剩餘庫存
					fundProgram.setFundProgramLast(fundProgramLast - 1); // 減去現在購買的一個商品
					fundProgramServiceImpl.updateProgramLast(fundProgram, fundProgramId); // 更新方案剩餘數量
					String form = fundOrderServiceImpl.genAioCheckOutOneTimeToFundOrder(fundOrder, member);// 使用綠界金流系統
																											// 信用卡繳費
					model.addAttribute("form", form);// 將form 內容帶入jsp頁面
					return "green/green1";
				} else {
					
					System.out.println("TOTAL:" + fundOrder.getFundOrderTotal());
					System.out.println("TOTAL:" + fundOrder.getFundOrderExtraPrice());
					System.out.println("TOTAL:" + fundOrder.getFundOrderPrice());
					FundProgram fundProgram = fundProgramServiceImpl
							.findFundProgramDetailByFundProgramId(fundProgramId);
					int fundProductId = fundProgram.getFundProduct().getFundProductId();
					FundProduct fundProduct = fundProductServiceImpl.findFundProductDetailByFundProductId(fundProductId)
							.get(0);
					int fundProjectId = fundProduct.getFundProject().getFundProjectId();
					Store store = fundProductServiceImpl.findStoreByFundProductId(fundProductId).getStore();
					FundSettle fundSettle = fundSettleServiceImpl.findFundSettleByFundProjectId(fundProjectId);

					fundOrderServiceImpl.addFundOreder(fundOrder, fundSettle, fundProduct, member, store); // 新增一筆訂單

					Integer fundSettleTotal = fundOrderServiceImpl.findFundSettleTotalByFundProductId(fundProductId); // 抓取商品總募資金額
					fundSettleServiceImpl.updateFundSettleTotal(fundSettleTotal, fundSettle.getFundSettleId()); // 更新結案表單的總金額

					int fundProgramLast = fundProgram.getFundProgramLast(); // 抓出現在剩餘庫存
					fundProgram.setFundProgramLast(fundProgramLast - 1); // 減去現在購買的一個商品
					fundProgramServiceImpl.updateProgramLast(fundProgram, fundProgramId); // 更新方案剩餘數量
					String form = fundOrderServiceImpl.genAioCheckOutBARCODEToFundOrder(fundOrder, member);// 使用綠界金流系統
																											// 超商繳費
					model.addAttribute("form", form);// 將form 內容帶入jsp頁面
					return "green/green1";
				}

			}

		} else {
			return "MemberSystem/noLogin";
		}
	}

	/*
	 * 消費者完成訂單按鈕，點擊更新fundOrder訂單狀態。
	 */
	@RequestMapping(value = "/getFinish", method = RequestMethod.POST)
	public String clickToFinishFunsOrder(@RequestParam(name = "fundOrderId") Integer fundOrderId) {
		fundOrderServiceImpl.clickToFinishFunsOrder(fundOrderId);
		return "redirect:/findMemberFundOrder";
	}

	/*
	 * 商家更新貨物狀態
	 */
	@RequestMapping(value = "/updateFundOrder", method = RequestMethod.POST)
	public String updateFundOrder(FundOrder fundOrder, @PathParam(value = "status") String status,
			@PathParam(value = "deliveryName") String deliveryName,
			@RequestParam(name = "deliveryNumber") String deliveryNumber,
			@RequestParam(name = "fundOrderId") Integer fundOrderId) {

		// 針對訂單出貨狀態進行更改
		if (status.equals("prepare")) {
			fundOrder.setFundOrderStatus("備貨中");
			fundOrderServiceImpl.updateFundOrderStatus(fundOrder, fundOrderId);
			return "redirect:/findStoreFundOrder";
		}

		if (!status.equals("請選擇") && !deliveryName.equals("請選擇")) {

			// 針對訂單出貨狀態進行更改
			if (status.equals("ship")) {
				fundOrder.setFundOrderStatus("已出貨");
				fundOrderServiceImpl.updateFundOrderStatus(fundOrder, fundOrderId);

				// 針對貨物運送方式進行更改。
				if (deliveryName.equals("blackCatDelivery")) {
					fundOrder.setFundOorderDeliveryName("黑貓");
					fundOrder.setFundOrderDeliveryNumber(deliveryNumber);// 針對物流號碼進行更改
				} else {
					fundOrder.setFundOorderDeliveryName("郵局");
					fundOrder.setFundOrderDeliveryNumber(deliveryNumber);// 針對物流號碼進行更改
				}

				fundOrderServiceImpl.updateFundOrderDelivery(fundOrder, fundOrderId);
				return "redirect:/findStoreFundOrder";
			}
		}
		return "Order/orderDetailError";
	}

	 /**
		 * fundOrder區間查詢
		 * 
		 * @throws ParseException
		 */
		@RequestMapping(value = "/getRangeDate", method = RequestMethod.POST)
		public String getRangeDate(Model model, @RequestParam(name = "startDate") String startDate, HttpSession httpSession,
				@RequestParam(name = "endDate") String endDate) throws ParseException {

			Store getStoreSession = (Store) httpSession.getAttribute("storeSession");
			Store getStore = storeServiceImpl.findStoreById(getStoreSession.getStoreId());
			if (getStore != null) {
				if (!startDate.isEmpty() && !endDate.isEmpty()) {
					String dateStart = startDate.replace("-", "");// 除去日期中的符號
					int dStart = Integer.valueOf(dateStart);// 轉型為Integer
					String dateEnd = endDate.replace("-", "");// 除去日期中的符號
					int dEnd = Integer.valueOf(dateEnd);// 轉型為Integer
					int days = dEnd - dStart;// 用來判斷輸入日期是否合理，若結束時間-開始時間小於0則錯。

					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");// 將String轉為Date型態，並設定格式
					Date dateS = sdf.parse(startDate);// 進行轉換
					System.out.println(dateS);

					Date dateE = sdf.parse(endDate);// 進行轉換
					System.out.println(dateE);

					if (days >= 0) {
						List<FundOrder> result = fundOrderServiceImpl.getDateRangeFundOrder(getStore.getStoreId(), dateS,
								dateE);
						model.addAttribute("fundOrderList", result);
						return "StoreBackstage/fundOrderinformation";
					}else {
						model.addAttribute("errorFundOrderDetail", "日期區間輸入錯誤");
						return storeController.findStoreFundOrder(httpSession, model);
								
					}
				} else {
					model.addAttribute("errorFundOrderDetail", "日期區間不可空白");
					return storeController.findStoreFundOrder(httpSession, model);
				}
			}
			return "MemberSystem/noLogin";
		}
		
		/**
		 * order、orderDetail 逆向排序
		 */
		@RequestMapping(value = "/getReverseFundOrder")
		public String getReverseFundOrder(Model model, HttpSession httpSession,
				@RequestParam(name = "getLineUp") String lineUp) {
			Store getStoreSession = (Store) httpSession.getAttribute("storeSession");
			Store getStore = storeServiceImpl.findStoreById(getStoreSession.getStoreId());

			if (getStore != null) {
				if (lineUp.equals("reverse")) {// 使用者選擇逆向排序
					 List<FundOrder> fundOrderDetailList = fundOrderServiceImpl.getReverseFundOrder(getStore.getStoreId());
					 System.out.println("==============fundOrderDetailList=="+fundOrderDetailList);
					 Collections.reverse(fundOrderDetailList);// 反向排序
					System.out.println("==============reverse=="+fundOrderDetailList);
					model.addAttribute("fundOrderList", fundOrderDetailList);
					return "StoreBackstage/fundOrderinformation";
				} else {// 使用者選擇順向排序
					 List<FundOrder> fundOrderDetailList = fundOrderServiceImpl.getReverseFundOrder(getStore.getStoreId());
					model.addAttribute("fundOrderList", fundOrderDetailList);
					return "StoreBackstage/fundOrderinformation";
				}
			} else {
				return "MemberSystem/noLogin";
			}
		}
}
