package com.fund.model.fundProgram.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProgram;

@Repository
public class FundProgramDaoImpl implements IFundProgramDao{

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	/**
	 * Dao 新增fundProgram
	 * @param fundProgram
	 */
	@Override
	public  void addFundProgram(FundProgram fundProgram) {
		getSession().save(fundProgram);
	}
	
	/**
	 * @Dao 用fundProductId抓取所有fundProgram
	 * @新增/查詢fundProgram
	 */
	@Override
	public List<FundProgram> findAllFundProgramByFundProductId(Integer fundProductId) {
		System.out.println("fundProductId Dao:" + fundProductId);
		String hql = "from FundProgram Where fund_product_id=:id";
		Query query = getSession().createQuery(hql).setParameter("id", fundProductId);
		List<FundProgram> fundPrograms = query.list();
		return fundPrograms;
	}
	
	/**
	 * @Dao 用fundProjectId抓取fundProduct
	 * @新增/查詢fundProgram
	 */
	@Override
	public FundProduct findFundProductByFundProjectId(Integer fundProjectId) {
		System.out.println("fundProjectId Dao:" + fundProjectId);
		String hql = "from FundProduct Where fund_project_id=:id";
		Query query = getSession().createQuery(hql).setParameter("id", fundProjectId);
		FundProduct fundProduct = (FundProduct) query.list().get(0);
		return fundProduct;
	}
	
	/**
	 * @Dao 用fundProgramId抓取fundProgramDetail
	 * @return結帳頁面
	 */
	@Override
	public FundProgram fundFundProgramDetailByFundProgramId(Integer fundProgramId) {
		String hql = "from FundProgram Where fund_program_id=:id";
		Query query = getSession().createQuery(hql).setParameter("id", fundProgramId);
		FundProgram fundProgram = (FundProgram) query.list().get(0);
		return fundProgram;
	}

	/**
	 * @Dao 贊助成功後改變fundProgram剩餘數量
	 * @return結帳頁面
	 */
	@Override
	public void updateProgramLast(Query query) {
		System.out.println("updateProgramLast Dao");
//		getSession().update();
		query.executeUpdate();
	}
	
	
	
	
}
