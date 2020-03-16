package com.fund.model.back.service;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;

import org.hibernate.query.Query;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.Store;

public interface IBackService {
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
	public void updateMemberStatus(Integer memberId, Member member);
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
	public Integer getServiceMemberId(String mEmail);
	/**
	 * 查詢會員利用會員ID
	 * 
	 * @param memberId
	 * @return
	 */
	public List<Member> findMemberByMemberId(Integer memberId);
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
	public void updateStoreStatus(Integer storeId, Store store);
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
	public void updateMember(Member member);
	/**
	 * 利用storeId 查詢 store資料
	 */
	public void updateStore(Store store);
	
	/**
	 * 模糊查詢會員
	 * @return
	 */
	public List<Member> findMemberLike(String Inquire,Integer InquireSelect);
	
	/**
	 * 模糊查詢商家
	 * @return
	 */
	public List<Store> findStoreLike(String Inquire,Integer InquireSelect);
	
	/**
	 * 模糊查詢商品
	 * @return
	 */
	public List<Product> findProductLike(String Inquire,Integer InquireSelect);
	
	/**
	 * 模糊查詢募資訂單
	 * @return
	 */
	public List<FundOrder> findfundOrderLike(String Inquire,Integer InquireSelect);
		
	
	
	
	/**
	 * 刪除會員
	 * @param memberId
	 */
	public void deleteMember(int memberId);
	
	/**
	 * 刪除商店
	 * @param memberId
	 */
	public void deleteStore(int storeId);



	/**
	 * 查詢募資訂單
	 * @return
	 */
	public List<FundOrder> listFindFundOrder();
	/**
	 * 查詢商品訂單
	 * @return
	 */
	public List<OrderDetail> listFindOrderDetail();

	/**
	 * 模糊查詢商品訂單
	 * @return
	 */
	public List<OrderDetail> findOrderDetailLike(String Inquire, Integer InquireSelect);

	/**
	 * 新增店家商品明細poi
	 * 
	 * @return
	 */
	public void bAddProductDetailPoi(ServletOutputStream out, Date startDate, Date endDate);
	
	/**
	 * 新增店家募資明細poi
	 * 
	 * @return
	 */
	public void bAddFundOrderPoi(ServletOutputStream out, Date startDate, Date endDate);
	
	
	public List findOrderDetailSumToAPI();
	
	public List<FundSettle>  findFundSettleSumToAPI();

}
