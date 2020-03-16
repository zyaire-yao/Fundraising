package com.fund.model.fundProgram.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProgram;

public interface IFundProgramDao {

	/**
	 * Dao 新增fundProgram
	 * @param fundProgram
	 */
	public  void addFundProgram(FundProgram fundProgram);
	
	/**
	 * @Dao 用fundProductId抓取所有fundProgram
	 * @新增/查詢fundProgram
	 */
	public List<FundProgram> findAllFundProgramByFundProductId(Integer fundProductId);
	
	/**
	 * @Dao 用fundProjectId抓取fundProduct
	 * @新增/查詢fundProgram
	 */
	public FundProduct findFundProductByFundProjectId(Integer fundProjectId);
	
	/**
	 * @Dao 用fundProgramId抓取fundProgramDetail
	 * @return結帳頁面
	 */
	public FundProgram fundFundProgramDetailByFundProgramId(Integer fundProgramId);

	/**
	 * @Dao 贊助成功後改變fundProgram剩餘數量
	 * @return結帳頁面
	 */
	public void updateProgramLast(Query query);
}
