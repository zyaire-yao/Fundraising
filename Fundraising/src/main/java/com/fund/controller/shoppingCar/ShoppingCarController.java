package com.fund.controller.shoppingCar;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Order;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.ShoppingCart;
import com.fund.model.member.service.IMemberService;
import com.fund.model.shoppingCar.Service.IShoppingCarService;

@Controller
public class ShoppingCarController {

	@Autowired
	private IMemberService memberServiceImpl;

	@Autowired
	private IShoppingCarService shoppingCarServiceImpl;


	/**
	 * 新增購物車
	 * 
	 * @param shoppingCart
	 * @param productId
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value = "/addShoppingCart")
	public String addShoppingCart(ShoppingCart shoppingCart, @RequestParam(name = "productId") Integer productId,
			HttpSession httpSession) {  
		Member memberSession = (Member) httpSession.getAttribute("memberSession");//取得memberSession
		Member getMember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());//查資料庫看是否有此筆會員資料
		if (getMember == null) {// 如果沒有登入
			System.out.println("session 遺失 ");
			return "MemberSystem/noLogin";
		} else {// 如果有登入
			List<ShoppingCart> listMemberCarts = shoppingCarServiceImpl.getMemberShoppingCart(getMember.getMemberId());//查詢會員購物車
			if (listMemberCarts != null) {// 如果購物車存在
				@SuppressWarnings("rawtypes")
				Iterator mcrt = listMemberCarts.iterator();
				while (mcrt.hasNext()) {
					ShoppingCart sCart = (ShoppingCart) mcrt.next();
					int cartProduct = sCart.getProduct().getProductId();//取得購物車內全部的商品ID
					if (cartProduct == productId) {// 如果新增商品ID跟購物車內商品ID一樣                                               
						shoppingCarServiceImpl.updateCartCountsToAdd(shoppingCart,getMember.getMemberId(),productId);//進行累加
			
						// 使用 Service 內的 updateCartCountsToAdd 方法     //(shoppingCart,getMember.getMemberId(),productId) 括號內的參數 是傳到service updateCartCountsToAdd 方法裡面
						return "redirect:/getAllProduct";
					}
				}
				shoppingCarServiceImpl.addShoppingCart(shoppingCart, getMember, productId);
			    return "redirect:/getAllProduct";
			}else {
				shoppingCarServiceImpl.addShoppingCart(shoppingCart, getMember, productId);
			    return "redirect:/getAllProduct";
			}			
		}
	}

	/**
	 * 查購物車內容
	 * 
	 * @param shoppingCart
	 * @param memberId
	 * @param httpSession
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/FindMemberShoppingCart")
	public String FindMemberShoppingCart(ShoppingCart shoppingCart, HttpSession httpSession, Model model) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");
		if (null != memberSession) {
			Member getMember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
			List<ShoppingCart> AllCarts = shoppingCarServiceImpl.getMemberShoppingCart(getMember.getMemberId());
			if (null != AllCarts) {
				model.addAttribute("memberCarts", AllCarts);
				return "Cart/shoppingCart";
			} else {
				return "Cart/shoppingCart";
			}

		} else
			System.out.println("session 遺失 ");
		return "MemberSystem/noLogin";
	}

	/**
	 * 更新購物車ByID
	 * 
	 * @param httpSession
	 * @param request
	 * @param model
	 * @param shoppingCart
	 * @return
	 */
	@RequestMapping(value = "/updateShoppingCartCounts", method = RequestMethod.POST)
	public String updateShoppingCartCounts(@RequestParam(name = "counts") Integer counts, HttpServletRequest request,
			Model model, ShoppingCart shoppingCartInput) {
		shoppingCarServiceImpl.updateCartCounts(shoppingCartInput);
		return "redirect:/FindMemberShoppingCart";
	}

	/**
	 * 刪除購物車單品
	 * 
	 * @param shoppingCartInput
	 * @return
	 */
	@RequestMapping(value = "/deleteMemberShoppingCart", method = RequestMethod.POST)
	public String deleteShoppingCart(HttpSession htppHttpSession,
			@RequestParam(name = "shoppingcartId") Integer shoppingcartId) {
		if (null != htppHttpSession.getAttribute("memberSession")) {// 判斷會員是否登入
			shoppingCarServiceImpl.deleteShoppingCart(shoppingcartId);
			return "redirect:/FindMemberShoppingCart";
		} else {
			System.out.println("session 遺失 ");
			return "MemberSystem/noLogin";
		}

	}


	/**
	 * 查購物車內容_結帳頁面
	 * 
	 * @param shoppingCart
	 * @param memberId
	 * @param httpSession
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/findMemberShoppingCartToCheckout")
	public String FindMemberShoppingCartToCheckout(HttpSession httpSession, Model model) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");
		if (null != memberSession) {
			Member getMember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
			List<ShoppingCart> AllCarts = shoppingCarServiceImpl.getMemberShoppingCart(getMember.getMemberId());

			if (null != AllCarts) {
				Integer allTotal = 0;
				@SuppressWarnings("rawtypes")
				Iterator allCarts = AllCarts.iterator();
				while (allCarts.hasNext()) {
					ShoppingCart rows = (ShoppingCart) allCarts.next();
					int price = rows.getProductPrice();
					int counts = rows.getCounts();
					int total = price * counts;
					allTotal = allTotal + total;
				}

				model.addAttribute("allTotal", allTotal);
				model.addAttribute("memberCarts", AllCarts);
				return "Cart/shoppingCartDetail";
			} else {
				return "Cart/shoppingCart";
			}

		} else
			System.out.println("session 遺失 ");
		return "MemberSystem/noLogin";
	}

	/**
	 * 轉成訂單明細
	 * 
	 * @return
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = "/addOrderAll")
	public String addOrderDetail(HttpSession httpSession, OrderDetail orderDetail, Order order,
			@RequestParam(name = "payment") Integer payment, Model model) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得會員Session
		Member getMember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());// 確認該會員存在於資料庫
		if (memberSession != null) {// 如果有登入
			if (payment == 1) {// 信用卡付費
				shoppingCarServiceImpl.addOrder(httpSession, order);// 存入訂單
				shoppingCarServiceImpl.addOrderDeatil(httpSession, orderDetail);// 存入訂單明細
				String form = shoppingCarServiceImpl.genAioCheckOutOneTime1(order, getMember);// 使用綠界金流系統 信用卡
				model.addAttribute("form", form);// 將form 內容帶入jsp頁面
				shoppingCarServiceImpl.deleteShoppingCartAll(getMember);// 刪除購物車

				return "green/green1";
			} else {// 超商繳費
				shoppingCarServiceImpl.addOrder(httpSession, order);// 存入訂單
				shoppingCarServiceImpl.addOrderDeatil(httpSession, orderDetail);// 存入訂單明細
				String form = shoppingCarServiceImpl.genAioCheckOutBARCODE(order, getMember);// 使用綠界金流系統 超商繳費
				model.addAttribute("form", form);// 將form 內容帶入jsp頁面
				shoppingCarServiceImpl.deleteShoppingCartAll(getMember);// 刪除購物車

				return "green/green1";
			}

		} else
			System.out.println("session 遺失 ");
		return "MemberSystem/noLogin";
	}

}
