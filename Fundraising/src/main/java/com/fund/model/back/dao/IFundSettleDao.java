package com.fund.model.back.dao;

import java.util.List;

import org.hibernate.query.Query;

import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Store;

public interface IFundSettleDao {

	public void addFundSettle(FundSettle fundSettle);

	public void updateProjectStatus(Query query);

	public FundProject findUpdateGetFundProjectStatus(Integer fundProjectId);
	
	public List<FundSettle> findAllFundProject();

	public FundSettle findFundSettleByFundProjectId(Integer fundProjectId);

	public void updateFundSettleTotal(Query query);


	/**
	 * 模糊查詢募資提案 like:
	 * 
	 * @return
	 */
	public List<FundProject> findFundProjectLike(String Inquire);

}
