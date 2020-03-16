package com.fund.model.back.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.query.Query;

import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.Store;

public interface IBackDao {

	/**
	 * 查詢會員
	 * 
	 * @return
	 */
	public List<Member> listFindMember();

	/**
	 * 更新會員
	 * 
	 * @param query
	 */
	public void updateMemberStatus(Query query);

	/**
	 * 查詢會員更新會員狀態
	 * 
	 * @param memberId
	 * @return
	 */
	public Member findUpdateGetMemberStatus(Integer memberId);

	/**
	 * 取得會員ID
	 * 
	 * @param mEmail
	 * @return
	 */
	public Integer getDaoMemberId(String mEmail);

	/**
	 * 更新會員
	 * 
	 * @param query
	 */
	public void updateMember(Query query);

	/**
	 * 查詢會員利用會員ID
	 * 
	 * @param memberId
	 * @return
	 */
	public List<Member> findMerberByMemberId(Integer memberId);

	/**
	 * 查詢會員利用會員更新用
	 * 
	 * @param memberId
	 * @return
	 */
	public List<Member> findUpdateMemberByMemberId(Integer memberId);

	/**
	 * 查詢募資商品回傳LIST型別
	 * 
	 * @return
	 */
	public List<Product> listFindProduct();

	/**
	 * 查詢募資專案回傳LIST型別
	 * 
	 * @return
	 */
	public List<Report> listFindReport();

	/**
	 * 查詢商店回傳LIST型別
	 * 
	 * @return
	 */
	public List<Store> listFindStore();

	/**
	 * 新增商店
	 * 
	 * @param store
	 */
	public void addStore(Store store);

	/**
	 * 更新商店狀態
	 * 
	 * @param query
	 */
	public void updateStoreStatus(Query query);

	/**
	 * 查詢商店 更新商店狀態用
	 * 
	 * @param storeId
	 * @return
	 */
	public Store findUpdateGetStoreStatus(Integer storeId);

	/**
	 * 查詢募資專案LIST型別
	 * 
	 * @return
	 */
	public List<FundProject> listFindFundProject();

	/**
	 * 利用memberId 查詢 member資料
	 */
	public Member findMemberByMemberId(Member member);

	/**
	 * 更新會員資料
	 */
	public void updateMember(Member member);

	/**
	 * 利用storeId 查詢 store資料
	 */
	public Store findStoreByStoreId(Store store);

	/**
	 * 更新商家資料
	 */
	public void updateStore(Store store);

	/**
	 * 模糊查詢會員 like:Id
	 * 
	 * @return
	 */
	public List<Member> findMemberLikeId(Integer Inquire);

	/**
	 * 模糊查詢會員 like:
	 * 
	 * @return
	 */
	public List<Member> findMemberLike(String Inquire);

	/**
	 * 模糊查詢商家 like:Id
	 * 
	 * @return
	 */
	public List<Store> findStoreLikeId(Integer Inquire);

	/**
	 * 模糊查詢商家 like:
	 * 
	 * @return
	 */
	public List<Store> findStoreLike(String Inquire);

	/**
	 * 模糊查詢商品 like:Id
	 * 
	 * @return
	 */
	public List<Product> findProductLikeId(Integer Inquire);

	/**
	 * 模糊查詢商品 like:
	 * 
	 * @return
	 */
	public List<Product> findProductLike(String Inquire);

	/**
	 * 模糊查詢募資訂單 like:Id
	 * 
	 * @return
	 */
	public List<FundOrder> findfundOrderLikeId(Integer Inquire);

	/**
	 * 模糊查詢募資訂單 like:
	 * 
	 * @return
	 */
	public List<FundOrder> findfundOrderLike(String Inquire);

	/**
	 * 刪除會員
	 * 
	 * @param getmember
	 */
	public void deleteMember(Member getmember);

	/*
	 * 透過ID查會員
	 */
	public Member findMemberById(Integer memberId);

	/**
	 * 刪除商家
	 * 
	 * @param getstore
	 */
	public void deleteStore(Store getstore);

	/*
	 * 透過ID查商家
	 */
	public Store findStoreById(Integer storeId);

	/**
	 * 查詢募資訂單
	 * @return
	 */
	public List<FundOrder> listFindFundOrder();

	/**
	 * 訂單ID查詢
	 * @param Inquire
	 * @return
	 */
	public List<OrderDetail> findOrderDetailLikeId(Integer Inquire);

	/**
	 * 訂單模糊查詢
	 * @param Inquire
	 * @return
	 */
	public List<OrderDetail> findOrderDetailLike(String Inquire);
	/**
	 * 查詢商品訂單
	 * @return
	 */
	public List<OrderDetail> listFindOrderDetail();
	
	/**
	 * 查詢全部訂單產生報表
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<OrderDetail> bFindOrderToPOI(Date startDate,Date endDate);

	/**
	 * 查詢全部募資調單產生報表
	 * @param storeId
	 * @param startDate
	 * @param endDate
	 * @return
	 */
	public List<FundOrder> bFindFundOrderToPOI(Date startDate,Date endDate);
	
	/**
	 * 取得商品訂單明細 給圖表API使用
	 */
	public List findOrderDetailSumToAPI();
	
	/**
	 * 取得商品訂單明細 給圖表API使用
	 */
	public List<FundSettle>  findFundSettleSumToAPI();

}
