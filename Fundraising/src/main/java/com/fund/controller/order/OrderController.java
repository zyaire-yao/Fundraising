package com.fund.controller.order;

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
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.ProductReturn;
import com.fund.model.eneity.Store;
import com.fund.model.order.service.IOrderService;
import com.fund.model.store.service.IStoreService;
import com.fund.util.OrderStatus;

@Controller
public class OrderController {

	@Autowired
	private IOrderService orderServiceImpl;
	
	@Autowired
	private IStoreService storeServiceImpl;

	@Autowired
	private StoreController storeController;

	/*
	 * 商店更改訂單狀態
	 */

	@RequestMapping(value = "/updateDelivery", method = RequestMethod.POST)
	public String updateDeliveryStatus(OrderDetail orderDetail, Model model, @PathParam(value = "status") String status,
			@PathParam(value = "deliveryMethod") String deliveryMethod,
			@RequestParam(name = "deliveryNumber") String deliveryNumber,
			@RequestParam(name = "orderDetailId") Integer orderDetailId) {
		

		if (status.equals("prepare")) { // 若商家選擇"備貨狀態"，則更改物品狀態。
			orderDetail.setOrderDeliveryStatus("備貨中");
			orderServiceImpl.updateOrderStatus(orderDetailId, orderDetail);
			return "redirect:/findStoreOrder";
		}

		// 當商家未選擇選項或沒有填寫配送編號，系統將阻擋更新。
		if (!status.equals("請選擇") && !deliveryMethod.equals("請選擇") && !deliveryNumber.equals("請選擇")) {

			if (status.equals("ship")) {
				orderDetail.setOrderDeliveryStatus("已出貨");
			}

			if (deliveryMethod.equals("blackCatDelivery")) {
				orderDetail.setOrderDeliveryName("黑貓");
			}
			if (deliveryMethod.equals("postDelivery")) {
				orderDetail.setOrderDeliveryName("郵局");
			}

			orderDetail.setOrderDeliveryNumber(deliveryNumber);

			orderServiceImpl.updateOrderStatus(orderDetailId, orderDetail);

			return "redirect:/findStoreOrder";

		} else {
			return "Order/orderDetailError";
		}

	}

	/*
	 * 顧客申請退貨系統
	 */
	@RequestMapping(value = "/itemReturnedSystem", method = RequestMethod.POST)
	public String itemReturned(@RequestParam(name = "itemOrderId") int orderDetailId, Model model,
			HttpSession httpSession) {

		List<OrderDetail> getOrderDetail = orderServiceImpl.listOrderDetail(orderDetailId);

		if (getOrderDetail != null) {

			model.addAttribute("orderDetailId", orderDetailId);

			String itemName = getOrderDetail.get(0).getOrderDetailName();
			model.addAttribute("odItemName", itemName);

			Integer itemPrice = getOrderDetail.get(0).getOrderDetailPrice();
			model.addAttribute("odItemPrice", itemPrice);

			Integer itemAmount = getOrderDetail.get(0).getOrderDetailAmount();
			model.addAttribute("odItemAmount", itemAmount);

			return "Order/customerReturnApplication";
		}
		return "Order/customerReturnApplication";
	}

	/*
	 * 消費者訂單完成按鈕
	 */
	@RequestMapping(value = "/finishOrder", method = RequestMethod.POST)
	public String finishOrder(@RequestParam(name = "itemOrderId") int orderDetailId) {
		orderServiceImpl.finishOrder(orderDetailId);
		return "redirect:/findMemberOrder";
	}
	
	
	
	
	/*
	 * 退貨申請單填寫_後端(customerReturnApplication)
	 */
	@RequestMapping(value = "/updateItemReturned")
	public String updateItemReturned(Model model, OrderDetail ordersDetail, ProductReturn productReturn,
			@RequestParam(name = "orderDetailId") Integer orderDetailId,
			@PathParam(value = "returnMethod") String returnMethod, 
			@PathParam(value = "reason") String reason,
			@PathParam(value = "odItemName") String odItemName, 
			@PathParam(value = "odItemPrice") Integer odItemPrice,
			@PathParam(value = "odItemAmount") Integer odItemAmount) {
		
		//若使用者未選擇退貨原因or退貨方式，系統將自動導回此頁將資料傳回。
		model.addAttribute("errorOrdersDetail", ordersDetail);
		model.addAttribute("errorpProductReturn", productReturn);
		model.addAttribute("errorOrderDetailId", orderDetailId);
		model.addAttribute("errorReturnMethod", returnMethod);
		model.addAttribute("errorReason", reason);
		model.addAttribute("errorOdItemName", odItemName);
		model.addAttribute("errorOdItemPrice", odItemPrice);
		model.addAttribute("errorOdItemAmount", odItemAmount);
		model.addAttribute("errorodItemPriceMultiplyodItemAmount", odItemPrice * odItemAmount);
		
		if (!returnMethod.equals("請選擇") && !reason.equals("請選擇")) {
			productReturn.setProductReturnMethod(returnMethod);// set退款方式
			productReturn.setProductReturnDetailName(odItemName);// set退貨商品名稱
			productReturn.setProductReturnDetailPrice(odItemPrice);// set退貨金額
			productReturn.setProductReturnDetailAmount(odItemAmount);// set退貨件數
			int odItemTotal = odItemPrice * odItemAmount;

			productReturn.setProductReturnTotal(odItemTotal);// set退款總額

			Date date = new Date();
			productReturn.setProductReturnDate(date);// set今天日期

			// 用orderDetai_Id找出整筆OrderDetail。
			OrderDetail getOrderDetailByorderDetailId = orderServiceImpl.recheckOrderDetailByodId(orderDetailId);

			// 要塞入productReturn的FK
			productReturn.setStore(getOrderDetailByorderDetailId.getStore());
			productReturn.setProduct(getOrderDetailByorderDetailId.getProduct());
			productReturn.setOrdersDetail(getOrderDetailByorderDetailId);

			if (returnMethod.equals("creditCar")) {
				ordersDetail.setOrderDeliveryStatus(OrderStatus.RETURNING);// 同步更新orderdetail貨物狀態為退貨中
				productReturn.setProductReturnStatus(OrderStatus.RETURNING);
			}

			if (reason.equals("itemOld")) {// set退貨原因
				ordersDetail.setOrderDeliveryStatus(OrderStatus.RETURNING);// 同步更新orderdetail貨物狀態為退貨中
				productReturn.setProductReturnReason(OrderStatus.PRODUCTOLD);

			} else if (reason.equals("itemUnbelieve")) {
				ordersDetail.setOrderDeliveryStatus(OrderStatus.RETURNING);// 同步更新orderdetail貨物狀態為退貨中
				productReturn.setProductReturnReason(OrderStatus.PRODUCTUNBELIEVE);

			} else if (reason.equals("itemBuyWrong")) {
				ordersDetail.setOrderDeliveryStatus(OrderStatus.RETURNING);// 同步更新orderdetail貨物狀態為退貨中
				productReturn.setProductReturnReason(OrderStatus.PRODUCTBUYWRONG);

			}
			orderServiceImpl.updateItemReturned(orderDetailId, ordersDetail);
			orderServiceImpl.addReturnItems(productReturn);
		} else {

			model.addAttribute("error", "請填寫原因或退款方式");
			return "Order/customerReturnApplication";
		}

		return "redirect:/findMemberOrder";
	}

	/*
	 * 商家審核退貨系統。
	 */
	@RequestMapping(value = "/replyReturnStatus", method = RequestMethod.POST)
	public String replyReturnStatus(Model model, HttpSession httpSession, ProductReturn productReturn,
			OrderDetail orderDetail, @PathParam(value = "returnSelect") String returnSelect,
			@RequestParam(name = "productReturnId") int productReturnId) {
		if (!returnSelect.equals("請選擇")) {
			if (returnSelect.equals("yes")) {
				productReturn.setProductReturnStatus("允許退貨");
				orderDetail.setOrderDeliveryStatus("允許退貨");

				orderServiceImpl.replyReturnStatus(productReturnId, productReturn, orderDetail);
				return "redirect:/findStoreReturn";
			} else {
				productReturn.setProductReturnStatus("拒絕退貨");
				orderDetail.setOrderDeliveryStatus("拒絕退貨");

				orderServiceImpl.replyReturnStatus(productReturnId, productReturn, orderDetail);
				return "redirect:/findStoreReturn";
			}
		}
		return "redirect:/findStoreReturn";
	}

	/**
	 * Order區間查詢
	 * 
	 * @throws ParseException
	 */
	@RequestMapping(value = "/getOrderRangeDate", method = RequestMethod.POST)
	public String getOrderRangeDate(Model model, @RequestParam(name = "startDate") String startDate, HttpSession httpSession,
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
					List<OrderDetail> storeOrderDetailList = orderServiceImpl.getOrderRangeDate(getStore.getStoreId(), dateS, dateE);
					model.addAttribute("getOrderDetail", storeOrderDetailList);
					return "StoreBackstage/orderinformation";
				}else {
					model.addAttribute("errorOrderDetail", "日期區間輸入錯誤");
					return storeController.findStoreOrder(httpSession, model);
				}
			} else {
				model.addAttribute("errorOrderDetail", "日期區間不可為空白");
				return storeController.findStoreOrder(httpSession, model);
			}
		}
		return "redirect:/findStoreOrder";
	}
	
	/**
	 * order、orderDetail 排序
	 */
	@RequestMapping(value = "/getReverseOrder")
	public String getOrderReverse(Model model, HttpSession httpSession,
			@RequestParam(name = "getLineUp") String lineUp) {
		Store getStoreSession = (Store) httpSession.getAttribute("storeSession");
		Store getStore = storeServiceImpl.findStoreById(getStoreSession.getStoreId());

		if (getStore != null) {
			if (lineUp.equals("reverse")) {// 使用者選擇逆向排序
				List<OrderDetail> orderDetailList = orderServiceImpl.getOrderDetailByStoreId(getStore.getStoreId());
				Collections.reverse(orderDetailList);// 反向排序
				model.addAttribute("getOrderDetail", orderDetailList);
				return "StoreBackstage/orderinformation";
			} else {// 使用者選擇順向排序
				List<OrderDetail> orderDetailList = orderServiceImpl.getOrderDetailByStoreId(getStore.getStoreId());
				model.addAttribute("getOrderDetail", orderDetailList);
				return "StoreBackstage/orderinformation";
			}
		} else {
			return "MemberSystem/noLogin";
		}
	}
}
