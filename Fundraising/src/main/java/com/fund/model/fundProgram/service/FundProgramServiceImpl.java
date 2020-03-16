package com.fund.model.fundProgram.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProgram;
import com.fund.model.fundProgram.dao.IFundProgramDao;

@Service
public class FundProgramServiceImpl implements IFundProgramService{

	@Autowired
	private IFundProgramDao fundProgramDaoImpl;

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * @Service 新增fundProgram
	 * @param fundProgram
	 */
	@Override
	public void addFundProgram(FundProgram fundProgram) {
		fundProgramDaoImpl.addFundProgram(fundProgram);

	}

	/**
	 * @Service 用fundProductId抓取所有fundProgram
	 * @新增/查詢fundProgram
	 */
	@Override
	public List<FundProgram> findAllFundProgramByFundProductId(Integer fundProductId) {
		System.out.println("fundProductId Service:" + fundProductId);
		return fundProgramDaoImpl.findAllFundProgramByFundProductId(fundProductId);
	}

	/**
	 * @Service 用fundProjectId抓取fundProduct
	 * @param fundProgram
	 */
	@Override
	public FundProduct findFundProductByFundProjectId(Integer fundProjectId) {
		System.out.println("fundProjectId Service:" + fundProjectId);
		return fundProgramDaoImpl.findFundProductByFundProjectId(fundProjectId);
	}
	
	/**
	 * @Service 用fundProgramId抓取fundProgramDetail
	 * @return結帳頁面
	 */
	@Override
	public FundProgram findFundProgramDetailByFundProgramId(Integer fundProgramId) {
		System.out.println("fundProgramId Service:" + fundProgramId);
		return fundProgramDaoImpl.fundFundProgramDetailByFundProgramId(fundProgramId);
	}
	
	/**
	 * @Service 贊助成功後改變fundProgram剩餘數量
	 * @return結帳頁面
	 */
	@Override
	public void updateProgramLast(FundProgram fundProgram,Integer fundProgramId) {
		System.out.println("updateProgramLast Service");
		String hql = "update FundProgram fprogram set fprogram.fundProgramLast=:updateLast Where fprogram.fundProgramId =: id";
		Query query=getSession().createQuery(hql).setParameter("id", fundProgramId).setParameter("updateLast", fundProgram.getFundProgramLast());
		fundProgramDaoImpl.updateProgramLast(query);
	}
	
}
