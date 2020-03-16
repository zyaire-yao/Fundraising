package com.fund.model.fundOrder.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.query.Query;

import com.fund.model.eneity.FundOrder;

public interface IFundOrderDao {

	public void addFundOrder(FundOrder fundOrder);

	public List<FundOrder> findAllFundOrderByFundProductId(Integer fundProductId);

	public Integer findFundSettleTotalByFundProductId(Integer fundProductId);
	/*
	 * 透過memberId找出消費者贊助訂單。
	 */
	public List<FundOrder> getFundOrdersByMemberId(Integer memberId);

	/*
	 * 更新狀態使用
	 */
	public void updateStatus(Query query);
	
	public List<FundOrder> getDateRangeFundOrder(Integer storeId,Date startDate,Date endDate);
	
	/**
	 * FundOrder 排序
	 * @param storeId
	 * @return
	 */
	public List<FundOrder> getReverseFundOrder(Integer storeId);
	
	/*
	 * 透過storeId找出贊助訂單。
	 */
	public List<FundOrder> getFundOrdersByStoreId(Integer storeId);
}
