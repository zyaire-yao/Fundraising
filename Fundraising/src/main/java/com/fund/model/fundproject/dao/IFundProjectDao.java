package com.fund.model.fundproject.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.fund.model.eneity.FundProject;


public interface IFundProjectDao {

	/*
	 * 建立新增方法
	 */
	public void addFundProject(FundProject fundProject);

	/*
	 * 建立新增更新
	 */
	public void updateFundProject(Query query);

	/*
	 *  利用商家storeId抓提案企劃
	 */
	public List<FundProject> findFundProjectBystoreId(Integer  storeId);

	/**
	 * 利用商家storeId抓提案企劃
	 * @param fundProjectId
	 * @return
	 */
	public List<FundProject> findUpdateFundProjectByfundProjectId(Integer fundProjectId);

	public FundProject findFundProjectByfundProjectId(Integer fundProjectId);
}
