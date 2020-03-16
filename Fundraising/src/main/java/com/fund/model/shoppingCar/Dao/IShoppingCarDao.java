package com.fund.model.shoppingCar.Dao;

import java.util.List;

import org.hibernate.query.Query;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Order;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.ShoppingCart;

public interface IShoppingCarDao {
	
	/**
	 * 新增購物車
	 * 
	 * @param shoppingCart
	 */
	public void addShoppingCart(ShoppingCart shoppingCart);

	/*
	 * *查詢會員購物車
	 */
	public List<ShoppingCart> getMemberShoppingCart(Integer memberId);
	
	/**
	 * 更新購物車
	 * @param shoppingCart
	 */
	public void updateCartCounts(ShoppingCart shoppingCart);
		
	/**
	 * 刪除購物車單品項
	 * @param getshoppingCart
	 */
	public void deleteShoppingCart(ShoppingCart getshoppingCart);

	/*
	 * 透過ID查購物車
	 * */
	public ShoppingCart findShoppingCartById(Integer shoppingcartId);
	
	/**
	 * 刪除全部購物車
	 * @param getshoppingCart
	 */
	public void deleteShoppingCartAll(Member getMember );
	
	/**
	 * 新增訂單明細
	 */
	public void addOrderDeatil(OrderDetail orderDetail);
	
	/**
	 * 新增訂單
	 */
	public void addOrder(Order order);
	
	/**
	 * 用member查詢Order LIST型別
	 * @param member
	 * @return
	 */
	public List<Order> listFindOrder(Member member);
	
	/*
	 * 查出會員購物車的商品數量
	 * */
	public List<ShoppingCart> FindMemberCartItemsCounts(Member member);
}
