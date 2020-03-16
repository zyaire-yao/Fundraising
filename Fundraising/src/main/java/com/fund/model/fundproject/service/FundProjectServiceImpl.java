package com.fund.model.fundproject.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.Store;
import com.fund.model.fundproject.dao.IFundProjectDao;

@Service
public class FundProjectServiceImpl implements IFundProjectService{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private IFundProjectDao fundProjectDaoImpl;

	// 獲取跟當前線程綁定的session
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}


    @Override
	public void addFundProject(FundProject fundProject, Integer storeId) {
		if (fundProject != null) {
			System.out.println("storeId:" + storeId);
			String hql = "From Store Where storeId=:id";
			Query query = getSession().createQuery(hql).setParameter("id", storeId);
			List<Store> aa = query.list();
			fundProject.setFundProjectStatus("審核中");
			fundProject.setStore(aa.get(0));
			fundProjectDaoImpl.addFundProject(fundProject);
		}
	}
    
    @Override
	public void updateFundProject(FundProject fundProject) {
		int id = fundProject.getFundProjectId();

		System.out.println("fundProjectId Service:" + id);
		if (fundProject.getFundProjectProject() != null) {
			String hqlstr = "update FundProject fp set fp.fundProjectTitle=:fpTitle,fp.fundProjectPf=:fpPf,"
					+ "fp.fundProjectTotal=:fpTotal,fp.fundProjectDate=:fpData,fp.fundProjectProject=:fpProjec where fp.fundProjectId=:fpId";
			Query query = getSession().createQuery(hqlstr).setParameter("fpId", id);
			query.setParameter("fpTitle", fundProject.getFundProjectTitle());
			query.setParameter("fpPf", fundProject.getFundProjectPf());
			query.setParameter("fpTotal", fundProject.getFundProjectTotal());
			query.setParameter("fpData", fundProject.getFundProjectDate());
			query.setParameter("fpProjec", fundProject.getFundProjectProject());
			fundProjectDaoImpl.updateFundProject(query);
		} else {
			String hqlstr = "update FundProject fp set fp.fundProjectTitle=:fpTitle,fp.fundProjectPf=:fpPf,"
					+ "fp.fundProjectTotal=:fpTotal,fp.fundProjectDate=:fpData where fp.fundProjectId=:fpId";
			Query query = getSession().createQuery(hqlstr).setParameter("fpId", id);
			query.setParameter("fpTitle", fundProject.getFundProjectTitle());
			query.setParameter("fpPf", fundProject.getFundProjectPf());
			query.setParameter("fpTotal", fundProject.getFundProjectTotal());
			query.setParameter("fpData", fundProject.getFundProjectDate());

			fundProjectDaoImpl.updateFundProject(query);
		}
	}

    @Override
	public List<FundProject> findFundProjectBystoreId(Integer storeId) {

		List<FundProject> projects = fundProjectDaoImpl.findFundProjectBystoreId(storeId);
		return projects;
	}

    @Override
	public List<FundProject> findUpdateFundProjectByfundProjectId(Integer fundProjectId) {

//		System.out.println("fundProjectId Service:" + fundProjectId);
		List<FundProject> getFundProjectProject = fundProjectDaoImpl
				.findUpdateFundProjectByfundProjectId(fundProjectId);
		return getFundProjectProject;
	}
	
	
	
	/**
	 ** Service 上傳募資文案 抓取FundProjectId
	 */
    @Override
	public FundProject findFundProjectByfundProjectId(Integer fundProjectId) {
		return fundProjectDaoImpl.findFundProjectByfundProjectId(fundProjectId);
	}

	/**
	 * @Service 刪除照片
	 */
    @Override
	public boolean deleteMemberPic(int fundProjectId, HttpServletRequest request) {
		List<FundProject> fundProject = fundProjectDaoImpl.findUpdateFundProjectByfundProjectId(fundProjectId);
		String fpProject = fundProject.get(0).getFundProjectProject();
		String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/");
		String fileName = filePath + fpProject;
		File file = new File(fileName);
		if (file.isFile() && file.exists()) {
			file.delete();// "刪除單個檔案"+name+"成功！"
			return true;
		} // "刪除單個檔案"+name+"失敗！"
		return false;
	}
}
