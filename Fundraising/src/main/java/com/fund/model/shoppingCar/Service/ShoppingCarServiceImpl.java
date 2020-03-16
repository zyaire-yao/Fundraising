package com.fund.model.shoppingCar.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Order;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.ShoppingCart;
import com.fund.model.member.dao.IMemberDao;
import com.fund.model.member.service.IMemberService;
import com.fund.model.product.service.IProductService;
import com.fund.model.shoppingCar.Dao.IShoppingCarDao;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutBARCODE;
import ecpay.payment.integration.domain.AioCheckOutOneTime;



@Service
public class ShoppingCarServiceImpl implements IShoppingCarService {

	public static AllInOne all;
	
	private static void initial() {
		all = new AllInOne(null);
	}
	
	@Autowired
	private IShoppingCarDao shoppingCarDao;

	@Autowired
	private IProductService productServiceImpl;

	@Autowired
	private IMemberService memberServiceImpl;

	@Autowired
	private IMemberDao memberDaoImpl;
	


	/*
	 * 新增購物車
	 */
	@Override
	public void addShoppingCart(ShoppingCart shoppingCart, Member member, Integer productId) {
		Product getProduct = productServiceImpl.findProductById(productId);
		shoppingCart.setMember(member);
		shoppingCart.setProduct(getProduct);
		shoppingCart.setCounts(shoppingCart.getCounts());
		shoppingCarDao.addShoppingCart(shoppingCart);
		
	}

	/**
	 * 查詢購物車
	 * 
	 * @param memberId
	 * @return
	 */
	@Override
	public List<ShoppingCart> getMemberShoppingCart(Integer memberId) {
		return shoppingCarDao.getMemberShoppingCart(memberId);
	}

	/**
	 * 查詢會員購物車 回傳entity
	 * 
	 * @param memberId
	 * @return
	 */
	@Override
	public ShoppingCart getMemberShoppingCartByMemberId(Integer memberId) {
		return shoppingCarDao.findShoppingCartById(memberId);
	}

	/**
	 * 更新購物車
	 * 
	 * @param shoppingCart
	 */
	@Override
	public void updateCartCounts(ShoppingCart shoppingCartInput) {
		try {
			System.out.println("counts = " + shoppingCartInput.getCounts());
			ShoppingCart getshoppingCart = shoppingCarDao.findShoppingCartById(shoppingCartInput.getShoppingcartId());
			getshoppingCart.setCounts(shoppingCartInput.getCounts());
			shoppingCarDao.updateCartCounts(getshoppingCart);
		} catch (Exception e) {
			System.out.println("更新購物車數量失敗 -Service");
			e.printStackTrace();
		}
	}
	
	/**
	 * 新增購物車 當商品ID一樣時 更新購物車 累加counts
	 * 
	 * @param shoppingCart   
	 */
	@Override
	public void updateCartCountsToAdd(ShoppingCart shoppingCartInput,Integer memberId,Integer productId) {
		try {
			List<ShoppingCart> getListCarts = shoppingCarDao.getMemberShoppingCart(memberId);//利用會員ID 查詢購物車
			int size = getListCarts.size();//查看LIST大小 3
			for(int i = 0;i<=size;i++) {
				int pId = getListCarts.get(i).getProduct().getProductId();//查購物車內全部的商品ID
				if(pId == productId) {//如果新增的商品ID 跟 購物車內商品ID相同
					int addcounts = getListCarts.get(i).getCounts()+shoppingCartInput.getCounts();//將原本商品數 加上 新增商品數
					getListCarts.get(i).setCounts(addcounts);//將商品加總數量 設定
					shoppingCarDao.updateCartCounts(getListCarts.get(i));//回傳至DAO 更新
				}
			}
		} catch (Exception e) {
			System.out.println("更新購物車數量失敗 -Service");
			e.printStackTrace();
		}
	}
	

	/**
	 * 刪除單品購物車
	 * 
	 * @param shoppingCartId
	 */
	@Override
	public void deleteShoppingCart(int shoppingCartId) {
		try {
			ShoppingCart getShoppingCart = shoppingCarDao.findShoppingCartById(shoppingCartId);
			shoppingCarDao.deleteShoppingCart(getShoppingCart);
		} catch (Exception e) {
			System.out.println("刪除購物車數量 -Service");
			e.printStackTrace();
		}

	}

	/**
	 * 刪除購物車
	 * 
	 * @param memberId
	 */
	@Override
	public void deleteShoppingCartAll(Member getMember) {
		try {
			shoppingCarDao.deleteShoppingCartAll(getMember);
		} catch (Exception e) {
			System.out.println("刪除購物車數量 -Service");
			e.printStackTrace();
		}
	}

	/**
	 * 找購物車用shoppingcartId
	 * 
	 * @param shoppingcartId
	 * @return
	 */
	@Override
	public ShoppingCart findShoppingCartById(Integer shoppingcartId) {
		return shoppingCarDao.findShoppingCartById(shoppingcartId);
	}

	/**
	 * 新增訂單明細
	 */
	@Override
	public void addOrderDeatil(HttpSession httpSession, OrderDetail orderDetail) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");
		Member getMember = memberDaoImpl.findMemberByMemberId(memberSession.getMemberId());
		List<Order> listOrder = shoppingCarDao.listFindOrder(getMember);
		List<ShoppingCart> getCart = getMemberShoppingCart(memberSession.getMemberId());
		@SuppressWarnings("rawtypes")
		Iterator cart = getCart.iterator();
		while (cart.hasNext()) {
			ShoppingCart rows = (ShoppingCart) cart.next();
			System.out.println("rows.getProductName() == " + rows.getProductName());
			orderDetail.setOrderDetailName(rows.getProductName());
			System.out.println("rows.getCounts() == " + rows.getCounts());
			orderDetail.setOrderDetailAmount(rows.getCounts());
			orderDetail.setOrderDetailPrice(rows.getProductPrice());
			orderDetail.setOrderDeliveryMethod(orderDetail.getOrderDeliveryMethod());
			orderDetail.setOrderDeliveryStatus("已受理");
			orderDetail.setProduct(rows.getProduct());
			orderDetail.setStore(rows.getProduct().getStore());
			orderDetail.setOrder(listOrder.get(listOrder.size() - 1));
			shoppingCarDao.addOrderDeatil(orderDetail);
		}

	}

	/**
	 * 新增訂單
	 */
	@Override
	public void addOrder(HttpSession httpSession, Order order) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");
		Member getMember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
		order.setMember(getMember);
		order.setOrderDate(new Date());
		order.setOrderStatus("已受理");
		shoppingCarDao.addOrder(order);
	}
	
	/**
	 * 信用卡線上刷卡code
	 */
	@Override
	public  String genAioCheckOutOneTime1(Order order,Member member) {
		initial() ;
		AioCheckOutOneTime obj = new AioCheckOutOneTime();//產生信用卡一次付清訂單物件
		
		Integer total = order.getOrderTotal();//抓取總金額
		Integer id = member.getMemberId();//取得會員 利用會員Id跟日期 創建訂單編號

		Date date = new Date();//目前時間		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");//設定日期格式	給訂單編號用	
		String dateString = sdf.format(date);//進行轉換
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//設定日期格式  給日期用		
		String dateStringToMerchantTradeDate = sdf1.format(date);//進行轉換	
		String merchantTradeNo = id.toString()+dateString;//合併訂單編號
		
		obj.setMerchantTradeNo(merchantTradeNo);//合作特店交易編號
		obj.setMerchantTradeDate(dateStringToMerchantTradeDate);//訂單日期
		obj.setTotalAmount(total.toString());//繳費總額
		obj.setTradeDesc("募資網 購物");//設定TradeDesc 交易描述
		obj.setItemName("募資網 購物");//設定ItemName 商品名稱
		obj.setReturnURL("http://211.23.128.214:5000");//設定ReturnURL 付款完成通知回傳網址-綠界畫面
		obj.setClientBackURL("http://localhost:8080/Fundraising/");//返回路徑按鈕
		obj.setNeedExtraPaidInfo("N");//設定OrderResultURL Client端回傳付款結果網址
		//obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
	
	
	/**
	 * 超商繳費條碼
	 */
	@Override
	public String genAioCheckOutBARCODE(Order order,Member member) {
		initial() ;
		AioCheckOutBARCODE obj = new AioCheckOutBARCODE();
		
		Integer total = order.getOrderTotal();//抓取總金額
		Integer id = member.getMemberId();//取得會員 利用會員Id跟日期 創建訂單編號

		Date date = new Date();//目前時間		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");//設定日期格式	給訂單編號用	
		String dateString = sdf.format(date);//進行轉換
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//設定日期格式  給日期用		
		String dateStringToMerchantTradeDate = sdf1.format(date);//進行轉換	
		String merchantTradeNo = id.toString()+dateString;//合併訂單編號
		
		obj.setMerchantTradeNo(merchantTradeNo);//設定MerchantTradeNo 合作特店交易編號(由合作特店提供)，該交易編號不可重複
		obj.setMerchantTradeDate(dateStringToMerchantTradeDate);//設定MerchantTradeDate 合作特店交易時間，請以 yyyy/MM/dd HH:mm:ss格式帶入
		obj.setTotalAmount(total.toString());//設定TotalAmount 交易金額
		obj.setTradeDesc("募資網 購物");//設定TradeDesc 交易描述
		obj.setItemName("募資網 購物");//設定ItemName 商品名稱
		obj.setReturnURL("http://211.23.128.214:5000");//設定ReturnURL 付款完成通知回傳網址-綠界畫面
		obj.setClientBackURL("http://localhost:8080/Fundraising/");//返回路徑按鈕
		obj.setNeedExtraPaidInfo("N");//設定NeedExtraPaidInfo 是否需要額外的付款資訊 
		obj.setStoreExpireDate("3");//設定StoreExpireDate 超商繳費截止時間
		
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	@Override
	public List<ShoppingCart> FindMemberCartItemsCounts(Member member) {		
		return shoppingCarDao.FindMemberCartItemsCounts(member);
	}


}
