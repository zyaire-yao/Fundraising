package com.fund.model.fundproject.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.fund.model.eneity.FundProject;

public interface IFundProjectService {

	public void addFundProject(FundProject fundProject, Integer storeId);

	public void updateFundProject(FundProject fundProject);

	public List<FundProject> findFundProjectBystoreId(Integer storeId);

	public List<FundProject> findUpdateFundProjectByfundProjectId(Integer fundProjectId);
	
	
	
	/**
	 ** Service 上傳募資文案 抓取FundProjectId
	 */
	public FundProject findFundProjectByfundProjectId(Integer fundProjectId);

	/**
	 * @Service 刪除照片
	 */
	public boolean deleteMemberPic(int fundProjectId, HttpServletRequest request);
}

