package com.fund.model.fundproject.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.FundProject;

@Repository
public class FundProjectDaoImpl implements IFundProjectDao {

	@Autowired
	private SessionFactory sessionFactory;

	// 獲取跟當前線程綁定的session
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public void addFundProject(FundProject fundProject) {
		try {
			System.out.println("fundProject" + fundProject);

			getSession().save(fundProject);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateFundProject(Query query) {
		query.executeUpdate();
	}

	@Override
	public List<FundProject> findFundProjectBystoreId(Integer storeId) {

		
		String hqlstr = "From  FundProject Where store_id=:id"; 
		Query query = getSession().createQuery(hqlstr).setParameter("id", storeId);
		
		List<FundProject> projects = query.list();


		return projects;

	}
	
	
	@Override
	public List<FundProject> findUpdateFundProjectByfundProjectId(Integer fundProjectId){		
		String hqlstr = "From  FundProject Where fundProjectId=:id"; 
		Query query = getSession().createQuery(hqlstr).setParameter("id", fundProjectId);
		
		List<FundProject> projects = query.list();
		
		return projects;
	}
	
	
	@Override
	public FundProject findFundProjectByfundProjectId(Integer fundProjectId) {
		String hql="from FundProject Where fundProjectId =:id";
		Query query=getSession().createQuery(hql).setParameter("id", fundProjectId);
		FundProject fundProject = (FundProject) query.list().get(0);
		return fundProject;
		
	}

}
