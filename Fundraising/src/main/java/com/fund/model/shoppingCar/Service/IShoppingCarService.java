package com.fund.model.shoppingCar.Service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Order;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.ShoppingCart;

public interface IShoppingCarService {

	/*
	 * 新增購物車
	 */
	public void addShoppingCart(ShoppingCart shoppingCart, Member member, Integer productId);

	/**
	 * 查詢購物車
	 * @param memberId
	 * @return
	 */
	public List<ShoppingCart> getMemberShoppingCart(Integer memberId);
	
	/**
	 * 查詢會員購物車 回傳entity
	 * @param memberId
	 * @return
	 */
	public ShoppingCart getMemberShoppingCartByMemberId(Integer memberId);
	
	/**
	 * 更新購物車
	 * @param shoppingCart
	 */
	public void updateCartCounts(ShoppingCart shoppingCartInput);
	
	/**
	 * 刪除單品購物車
	 * @param shoppingCartId
	 */
	public void deleteShoppingCart(int shoppingCartId);
			
	/**
	 * 刪除購物車
	 * @param memberId
	 */
	public void deleteShoppingCartAll(Member getMember);
	
	/**
	 * 找購物車用shoppingcartId
	 * @param shoppingcartId
	 * @return
	 */
	public ShoppingCart findShoppingCartById (Integer shoppingcartId);
	
	
	/**
	 * 新增訂單明細
	 */
	public void addOrderDeatil(HttpSession httpSession,OrderDetail orderDetail);

	
	/**
	 * 新增訂單
	 */
	public void addOrder(HttpSession httpSession,Order order);
	
	/*
	 * 信用卡繳費
	 */
	public  String genAioCheckOutOneTime1(Order order,Member members);
	
	/**
	 * 超商繳費
	 * @param order
	 * @param member
	 * @return
	 */
	public String genAioCheckOutBARCODE(Order order,Member member);

	/**
	 *  新增購物車 當商品ID一樣時 更新購物車 累加counts
	 * @param shoppingCartInput
	 * @param counts
	 */
	public void updateCartCountsToAdd(ShoppingCart shoppingCartInput,Integer memberId,Integer productId);
	
	/*
	 * 查出會員購物車的商品數量
	 * */
	public List<ShoppingCart> FindMemberCartItemsCounts(Member member);
}
