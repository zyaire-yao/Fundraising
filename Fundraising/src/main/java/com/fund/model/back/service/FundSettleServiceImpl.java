package com.fund.model.back.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fund.model.back.dao.IFundSettleDao;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Store;



@Service
public class FundSettleServiceImpl implements IFundSettleService{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private IFundSettleDao fundSettleDaoImpl;
	
	// 獲取跟當前線程綁定的session
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addFundSettle(FundSettle fundSettle) {
		fundSettleDaoImpl.addFundSettle(fundSettle);
	}
	@Override
	public void updateProjectStatus(Integer fundProjectId, FundProject fundProject) {
		System.out.println("fundProjectId:" + fundProjectId);
		System.out.println("fundProjectStatus:" +fundProject.getFundProjectStatus());
		String hql = "update FundProject fp set fp.fundProjectStatus=:fpStatus where fp.fundProjectId=:fpId";
		Query query = getSession().createQuery(hql).setParameter("fpId", fundProjectId);
		query.setParameter("fpStatus", fundProject.getFundProjectStatus());
		fundSettleDaoImpl.updateProjectStatus(query);
	}
	@Override
	public FundProject findUpdateGetFundProjectStatus(Integer fundProjectId) {
		return fundSettleDaoImpl.findUpdateGetFundProjectStatus(fundProjectId);
	}
	@Override
	public List<FundSettle> findAllFundSettle() {

		System.out.println("Settle Service");
		List<FundSettle> projects = fundSettleDaoImpl.findAllFundProject();

		return projects;

	}
	@Override
	public FundSettle findFundSettleByFundProjectId(Integer fundProjectId) {
		return fundSettleDaoImpl.findFundSettleByFundProjectId(fundProjectId);
	}
	@Override
	public void updateFundSettleTotal(Integer fundSettleTotal,Integer fundSettleId) {
		String hql="update FundSettle fs set fs.fundSettleTotal =:total Where fs.fundSettleId =: id";
		Query query=getSession().createQuery(hql).setParameter("total", fundSettleTotal).setParameter("id", fundSettleId);
		fundSettleDaoImpl.updateFundSettleTotal(query);
	}
	
	/**
	 * 模糊查詢募資提案
	 * @return
	 */
	@Override
	public List<FundProject> findFundProjectLike(String Inquire) {
		
			return fundSettleDaoImpl.findFundProjectLike(Inquire);

	}
	
	

}
