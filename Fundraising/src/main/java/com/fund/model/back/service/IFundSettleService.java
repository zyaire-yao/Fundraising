package com.fund.model.back.service;

import java.util.List;

import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Store;

public interface IFundSettleService {

	public void addFundSettle(FundSettle fundSettle);

	public void updateProjectStatus(Integer fundProjectId, FundProject fundProject);

	public FundProject findUpdateGetFundProjectStatus(Integer fundProjectId);

	public List<FundSettle> findAllFundSettle();

	public FundSettle findFundSettleByFundProjectId(Integer fundProjectId);
	
	public void updateFundSettleTotal(Integer fundSettleTotal,Integer fundSettleId);
	
	/**
	 * 模糊查詢募資提案
	 * @return
	 */
	public List<FundProject> findFundProjectLike(String Inquire);
	
}
