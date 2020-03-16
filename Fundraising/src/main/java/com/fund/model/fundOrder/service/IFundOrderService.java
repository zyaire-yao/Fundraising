package com.fund.model.fundOrder.service;

import java.util.Date;
import java.util.List;

import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.Store;

public interface IFundOrderService {

	public void addFundOreder(FundOrder fundOrder, FundSettle fundSettle, FundProduct fundProduct, Member member, Store store);

	public List<FundOrder> findAllFundOrderByFundProductId(Integer fundProductId);
	
	public Integer findFundSettleTotalByFundProductId(Integer fundProductId);
	
	/*
	 * 透過memberId找出消費者贊助訂單。
	 */
	public List<FundOrder> getFundOrdersByMemberId(Integer memberId);

	/*
	 * 消費者完成訂單按鈕，點擊更新fundOrder訂單狀態。
	 */
	public void clickToFinishFunsOrder(Integer fundOrderId);

	/*
	 * 商家更新訂單狀態
	 */
	public void updateFundOrderStatus(FundOrder fundOrder, Integer fundOrderId);

	/*
	 * 商家更新運送方式狀態
	 */
	public void updateFundOrderDelivery(FundOrder fundOrder, Integer fundOrderId);
	
	public List<FundOrder> getDateRangeFundOrder(Integer storeId,Date startDate,Date endDate);
	
	/**
	 * 綠界信用卡付款_募資
	 * @param fundOrder
	 * @param member
	 * @return
	 */
	public String genAioCheckOutOneTimeToFundOrder(FundOrder fundOrder,Member member);
	
	/**
	 * 綠界超商繳費_募資
	 * @param fundOrder
	 * @param member
	 * @return
	 */
	public String genAioCheckOutBARCODEToFundOrder(FundOrder fundOrder,Member member);

	/**
	 * fundOrder排序
	 * @param storeId
	 * @return
	 */
	public List<FundOrder> getReverseFundOrder(Integer storeId);
	
	/*
	 * 透過storeId找出贊助訂單。
	 */
	public List<FundOrder> getFundOrdersByStoreId(Integer storeId);
}
