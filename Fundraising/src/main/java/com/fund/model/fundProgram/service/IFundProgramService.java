package com.fund.model.fundProgram.service;

import java.util.List;

import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProgram;

public interface IFundProgramService {

	/**
	 * @Service 新增fundProgram
	 * @param fundProgram
	 */
	public void addFundProgram(FundProgram fundProgram);

	/**
	 * @Service 用fundProductId抓取所有fundProgram
	 * @新增/查詢fundProgram
	 */
	public List<FundProgram> findAllFundProgramByFundProductId(Integer fundProductId);

	/**
	 * @Service 用fundProjectId抓取fundProduct
	 * @param fundProgram
	 */
	public FundProduct findFundProductByFundProjectId(Integer fundProjectId);
	
	/**
	 * @Service 用fundProgramId抓取fundProgramDetail
	 * @return結帳頁面
	 */
	public FundProgram findFundProgramDetailByFundProgramId(Integer fundProgramId);
	
	/**
	 * @Service 贊助成功後改變fundProgram剩餘數量
	 * @return結帳頁面
	 */
	public void updateProgramLast(FundProgram fundProgram,Integer fundProgramId);
}
