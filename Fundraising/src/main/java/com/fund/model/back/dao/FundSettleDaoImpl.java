package com.fund.model.back.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.Store;

@Repository
public class FundSettleDaoImpl implements IFundSettleDao{

	@Autowired
	private SessionFactory sessionFactory;

	// 獲取跟當前線程綁定的session
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addFundSettle(FundSettle fundSettle) {
		getSession().save(fundSettle);
	}
	@Override
	public void updateProjectStatus(Query query) {
		query.executeUpdate();
	}
	@Override
	public FundProject findUpdateGetFundProjectStatus(Integer fundProjectId) {
		return getSession().get(FundProject.class, fundProjectId);
	}
	@Override
	public List<FundSettle> findAllFundProject() {
		System.out.println("Settle Dao");
		String hqlStr = "from FundProject";
		Query query = getSession().createQuery(hqlStr);
		List<FundSettle> projects = query.list();

		return projects;

	}
	@Override
	public FundSettle findFundSettleByFundProjectId(Integer fundProjectId) {
		String hql = "from FundSettle Where fund_project_id =: id";
		Query query = getSession().createQuery(hql).setParameter("id", fundProjectId);
		FundSettle fundSettle = (FundSettle) query.list().get(0);
		return fundSettle;
	}
	@Override
	public void updateFundSettleTotal(Query query) {
		query.executeUpdate();
	}

	
	/**
	 * 模糊查詢募資提案 like:
	 *  
	 * @return
	 */
	@Override
	public List<FundProject> findFundProjectLike(String Inquire) {		
	   String hql = "from FundProject as fs where  fs.fundProjectTitle like:title or fs.fundProjectPf like:Pf";
       Query query =  getSession().createQuery(hql);
       query.setParameter("title", "%"+Inquire+"%");
       query.setParameter("Pf", "%"+Inquire+"%");
       List<FundProject> listFundProject = query.list();      
		return listFundProject;
	}
	
	/**
	 * 取得商家全部訂單明細
	 * @returnand order.orderDate 
	 */
	public List<OrderDetail> findOrder(Date startDate,Date endDate){
		//查詢區間訂單明細
		String hql = "From OrderDetail where  order.orderDate>=:startDate and order.orderDate<=:endDate ";
		Query query = getSession().createQuery(hql);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		List<OrderDetail> getListOrderDetail = query.list();
		return getListOrderDetail;
	}

}
