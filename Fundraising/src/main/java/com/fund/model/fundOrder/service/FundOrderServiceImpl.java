package com.fund.model.fundOrder.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.Order;
import com.fund.model.eneity.Store;
import com.fund.model.fundOrder.dao.IFundOrderDao;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutBARCODE;
import ecpay.payment.integration.domain.AioCheckOutOneTime;

@Service
public class FundOrderServiceImpl implements IFundOrderService {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private IFundOrderDao fundOrderDaoImpl;

	public static AllInOne all;

	private static void initial() {
		all = new AllInOne(null);
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addFundOreder(FundOrder fundOrder, FundSettle fundSettle, FundProduct fundProduct, Member member,
			Store store) {
		fundOrder.setFundOrderStatus("已受理");
		Date date = new Date();
		fundOrder.setFundOrderDate(date);
		int price = fundOrder.getFundOrderPrice();
		int exprice = fundOrder.getFundOrderExtraPrice();
		fundOrder.setFundOrderTotal(exprice + price);
		fundOrder.setMember(member);
		fundOrder.setStore(store);
		fundOrder.setFundSettle(fundSettle);
		fundOrder.setFundProduct(fundProduct);
		fundOrderDaoImpl.addFundOrder(fundOrder);
	}

	@Override
	public List<FundOrder> findAllFundOrderByFundProductId(Integer fundProductId) {
		return fundOrderDaoImpl.findAllFundOrderByFundProductId(fundProductId);
	}

	@Override
	public Integer findFundSettleTotalByFundProductId(Integer fundProductId) {
		return fundOrderDaoImpl.findFundSettleTotalByFundProductId(fundProductId);
	}

	/*
	 * 透過memberId找出消費者贊助訂單。
	 */
	@Override
	public List<FundOrder> getFundOrdersByMemberId(Integer memberId) {
		return fundOrderDaoImpl.getFundOrdersByMemberId(memberId);
	}
	
    /*
	 * 透過storeId找出贊助訂單。
	 */
	@Override
	public List<FundOrder> getFundOrdersByStoreId(Integer storeId) {
		return fundOrderDaoImpl.getFundOrdersByStoreId(storeId);
	}

	/*
	 * 消費者完成訂單按鈕，點擊更新fundOrder訂單狀態。
	 */
	@Override
	public void clickToFinishFunsOrder(Integer fundOrderId) {
		String hql = "Update FundOrder fo set fo.fundOrderStatus =:foStatus WHERE fo.fundOrderId=:fundOrderId";
		Query query = getSession().createQuery(hql).setParameter("foStatus", "完成訂單").setParameter("fundOrderId",
				fundOrderId);
		fundOrderDaoImpl.updateStatus(query);
	}

	/*
	 * 商家更新訂單狀態
	 */
	@Override
	public void updateFundOrderStatus(FundOrder fundOrder, Integer fundOrderId) {
		String hql = "Update FundOrder fo set fo.fundOrderStatus =:foStatus WHERE fo.fundOrderId=:fundOrderId";
		Query query = getSession().createQuery(hql).setParameter("foStatus", fundOrder.getFundOrderStatus())
				.setParameter("fundOrderId", fundOrderId);
		fundOrderDaoImpl.updateStatus(query);
	}

	/*
	 * 商家更新運送方式狀態
	 */
	@Override
	public void updateFundOrderDelivery(FundOrder fundOrder, Integer fundOrderId) {
		String hql = "Update FundOrder fo set fo.fundOorderDeliveryName =:foName , fo.fundOrderDeliveryNumber=:foNumber WHERE fo.fundOrderId=:fundOrderId";
		Query query = getSession().createQuery(hql).setParameter("foName", fundOrder.getFundOorderDeliveryName())
				.setParameter("foNumber", fundOrder.getFundOrderDeliveryNumber())
				.setParameter("fundOrderId", fundOrderId);
		fundOrderDaoImpl.updateStatus(query);
	}

	/**
	 * FundOrder區間查詢
	 */
	@Override
	public List<FundOrder> getDateRangeFundOrder(Integer storeId, Date startDate, Date endDate) {
		return fundOrderDaoImpl.getDateRangeFundOrder(storeId, startDate, endDate);
	}

	/**
	 * 信用卡線上刷卡code
	 */
	@Override
	public String genAioCheckOutOneTimeToFundOrder(FundOrder fundOrder, Member member) {
		initial();
		AioCheckOutOneTime obj = new AioCheckOutOneTime();// 產生信用卡一次付清訂單物件

		Integer total = fundOrder.getFundOrderTotal();// 抓取總金額
		Integer id = member.getMemberId();// 取得會員 利用會員Id跟日期 創建訂單編號

		Date date = new Date();// 目前時間
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");// 設定日期格式 給訂單編號用
		String dateString = sdf.format(date);// 進行轉換
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 設定日期格式 給日期用
		String dateStringToMerchantTradeDate = sdf1.format(date);// 進行轉換
		String merchantTradeNo = id.toString() + dateString;// 合併訂單編號

		obj.setMerchantTradeNo(merchantTradeNo);// 合作特店交易編號
		obj.setMerchantTradeDate(dateStringToMerchantTradeDate);// 訂單日期
		obj.setTotalAmount(total.toString());// 繳費總額
		obj.setTradeDesc("募資網 購物");// 設定TradeDesc 交易描述
		obj.setItemName("募資網 購物");// 設定ItemName 商品名稱
		obj.setReturnURL("http://211.23.128.214:5000");// 設定ReturnURL 付款完成通知回傳網址-綠界畫面
		obj.setClientBackURL("http://localhost:8080/Fundraising/");// 返回路徑按鈕
		obj.setNeedExtraPaidInfo("N");// 設定OrderResultURL Client端回傳付款結果網址
		// obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		return form;
	}

	/**
	 * 超商繳費條碼
	 */
	@Override
	public String genAioCheckOutBARCODEToFundOrder(FundOrder fundOrder, Member member) {
		initial();
		AioCheckOutBARCODE obj = new AioCheckOutBARCODE();

		Integer total = fundOrder.getFundOrderTotal();// 抓取總金額
		Integer id = member.getMemberId();// 取得會員 利用會員Id跟日期 創建訂單編號

		Date date = new Date();// 目前時間
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");// 設定日期格式 給訂單編號用
		String dateString = sdf.format(date);// 進行轉換
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");// 設定日期格式 給日期用
		String dateStringToMerchantTradeDate = sdf1.format(date);// 進行轉換
		String merchantTradeNo = id.toString() + dateString;// 合併訂單編號

		obj.setMerchantTradeNo(merchantTradeNo);// 設定MerchantTradeNo 合作特店交易編號(由合作特店提供)，該交易編號不可重複
		obj.setMerchantTradeDate(dateStringToMerchantTradeDate);// 設定MerchantTradeDate 合作特店交易時間，請以 yyyy/MM/dd
																// HH:mm:ss格式帶入
		obj.setTotalAmount(total.toString());// 設定TotalAmount 交易金額
		obj.setTradeDesc("募資網 購物");// 設定TradeDesc 交易描述
		obj.setItemName("募資網 購物");// 設定ItemName 商品名稱
		obj.setReturnURL("http://211.23.128.214:5000");// 設定ReturnURL 付款完成通知回傳網址-綠界畫面
		obj.setClientBackURL("http://localhost:8080/Fundraising/");// 返回路徑按鈕
		obj.setNeedExtraPaidInfo("N");// 設定NeedExtraPaidInfo 是否需要額外的付款資訊
		obj.setStoreExpireDate("3");// 設定StoreExpireDate 超商繳費截止時間

		String form = all.aioCheckOut(obj, null);
		return form;
	}

	/**
	 * FundOrder排序
	 */
	@Override
	public List<FundOrder> getReverseFundOrder(Integer storeId) {
		return fundOrderDaoImpl.getReverseFundOrder(storeId);
	}

}
