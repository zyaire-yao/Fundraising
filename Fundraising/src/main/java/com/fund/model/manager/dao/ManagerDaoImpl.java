package com.fund.model.manager.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.Announcement;
import com.fund.model.eneity.Manager;

@Repository
public class ManagerDaoImpl implements IManagerDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	// 獲取跟當前線程綁定的session
	private Session getSession() {
		return sessionFactory.getCurrentSession();
//		return sessionFactory.openSession();
	}
	
	
	/**
	 * @getMemberDao 取得會員資料
	 */
	@Override
	public List<Manager> getManagerByManagerAccount(String account) {
		String hqlstr = "From Manager WHERE managerAccount=:account";
		
			Query query = getSession().createQuery(hqlstr).setParameter("account", account);
			List<Manager> manager = query.list();	
			
			if(manager.size()==0) {
				return null;
			}else {
				return manager;
			}		
	}
	
	
    /**
     * @param 存入公告
     */
	@Override
	public String initAnnouncement(Announcement announcement) {
		try {
			String success = "存檔成功";
			getSession().save(announcement);
			return success;
		} catch (Exception e) {
			String error = "存檔失敗";
			e.printStackTrace();
			return error;
		}
	}
	
	/**
	 * @return 取得全部公告
	 */
	@Override
	public List<Announcement> getAnnouncement(){
		String hql = "From Announcement";
		Query query = getSession().createQuery(hql);
		List<Announcement> at= query.list();
		
		return at;
	}  
	
	/**
	 * @取得公告內容
	 */
	@Override
    public List<Announcement> getAnnouncementById(int id){
    	String hql = "From Announcement Where announcementId=:id";
    	Query query = getSession().createQuery(hql).setParameter("id", id);
    	List<Announcement> at= query.list();
		return at;
    }
	
	/**
	 * 刪除公告
	 * @param getAnnouncement
	 */
	@Override
	public void deleteAnnouncement(Announcement getAnnouncement) {
		try {
			getSession().delete(getAnnouncement);
			System.out.println("公告刪除成功");
		}catch (Exception e) {
			System.out.println("公告刪除失敗 -Dao");
			e.printStackTrace();
		}
	}

	/*
	 * 透過ID查公告
	 * */
	@Override
	public Announcement findAnnouncementById(Integer announcementId) {
		return getSession().get(Announcement.class,announcementId);
	}

}
