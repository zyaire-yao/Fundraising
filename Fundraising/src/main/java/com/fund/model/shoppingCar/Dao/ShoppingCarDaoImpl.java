package com.fund.model.shoppingCar.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Order;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.ShoppingCart;

@Repository
public class ShoppingCarDaoImpl implements IShoppingCarDao{

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
//		return sessionFactory.openSession();
	}

	/**
	 * 新增購物車
	 * 
	 * @param shoppingCart
	 */
	@Override
	public void addShoppingCart(ShoppingCart shoppingCart) {
		getSession().save(shoppingCart);
		System.out.println("儲存完成");
	}

	/**
	 * 查詢會員購物車
	 */
	@Override
	public List<ShoppingCart> getMemberShoppingCart(Integer memberId) {
		String hqlstr = "From ShoppingCart where member_Id=:id";
		Query query = getSession().createQuery(hqlstr).setParameter("id", memberId);
		List<ShoppingCart> AllCarts = query.list();
		if (AllCarts.size() > 0) {
			return AllCarts;
		} else {
			return null;
		}
	}
	
	/**
	 * 更新購物車
	 * @param shoppingCart
	 */
	@Override
	public void updateCartCounts(ShoppingCart shoppingCart) {
		try {
			getSession().update(shoppingCart);
			System.out.println("購物車數量已更新");
		}catch (Exception e) {
			System.out.println("購物車數量更新失敗 -Dao");
			e.printStackTrace();
		}
	}
	
	/**
	 * 刪除購物車單品項
	 * @param getshoppingCart
	 */
	@Override
	public void deleteShoppingCart(ShoppingCart getshoppingCart) {
		try {
			getSession().delete(getshoppingCart);
			System.out.println("購物車刪除成功");
		}catch (Exception e) {
			System.out.println("購物車刪除失敗 -Dao");
			e.printStackTrace();
		}
	}

	/*
	 * 透過ID查購物車
	 * */
	@Override
	public ShoppingCart findShoppingCartById(Integer shoppingcartId) {
		return getSession().get(ShoppingCart.class,shoppingcartId);
	}

	
	/**
	 * 刪除全部購物車
	 * @param getshoppingCart
	 */
	@Override
	public void deleteShoppingCartAll(Member getMember ) {
		String hql = "Delete FROM ShoppingCart  where member_id =: id";
		Query query = getSession().createQuery(hql).setParameter("id", getMember.getMemberId());
		query.executeUpdate() ;
	}
	
	/**
	 * 新增訂單明細
	 */
	@Override
	public void addOrderDeatil(OrderDetail orderDetail) {
		try {
			getSession().clear();
			getSession().save(orderDetail);

		} catch (Exception e) {
			System.out.println("新增 orderDetail 失敗");
			e.printStackTrace();
		}
	}
	
	/**
	 * 新增訂單
	 */
	@Override
	public void addOrder(Order order) {
		try {
			getSession().save(order);
		} catch (Exception e) {
			System.out.println("新增 Order 失敗");
			e.printStackTrace();
		}
	}
	
	/**
	 * 用member查詢Order LIST型別
	 * @param member
	 * @return
	 */
	@Override
	public List<Order> listFindOrder(Member member){
		String hql = "From Order Where member_Id =: id";
		Query query = getSession().createQuery(hql).setParameter("id", member.getMemberId());
		List<Order> listOrder = query.list();
		return listOrder;
	}
	/*
	 * 查出會員購物車的商品數量
	 * */
	@Override
	public List<ShoppingCart> FindMemberCartItemsCounts(Member member) {
		String strhql = "Select sum(counts) FROM Shopping_car Where member_Id=:id";
		Query query = getSession().createSQLQuery(strhql).setParameter("id", member.getMemberId());
		List<ShoppingCart> counts = query.list();
		System.out.println("counts-Dao" +counts);
		return counts;
	}

}
