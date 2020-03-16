package com.fund.model.manager.service;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fund.model.eneity.Announcement;
import com.fund.model.eneity.Manager;
import com.fund.model.manager.dao.IManagerDao;


@Service
public class ManagerServiceImpl implements IManagerService{
	
	@Autowired
	private IManagerDao managerDaoImpl;
	
	/**
	 * @param 取得管理員資料
	 */
	@Override
	public List<Manager> getManagerByManagerAccount(String account){
		List<Manager> manager = managerDaoImpl.getManagerByManagerAccount(account);
		return manager;
	}
	
	/**
	 * @param 存入公告
	 */
	@Override
	public String initAnnouncement(Announcement announcement,HttpSession httpSession) {
		String account = (String) httpSession.getAttribute("account");
		List<Manager> manager = managerDaoImpl.getManagerByManagerAccount(account);
		announcement.setManager(manager.get(0));
		announcement.setAnnouncementStatus("正常");
		announcement.setAnnouncementDate(new Date());
		String status = managerDaoImpl.initAnnouncement(announcement);
		return status;
	}
	
    /**
     * @查詢公告
     */
	@Override
	public List<Announcement> getAnnouncement(){
		List<Announcement> at = managerDaoImpl.getAnnouncement();
		return at;
	}
	
	/**
	 * @查詢公告內容
	 */
	@Override
	public List<Announcement> getAnnouncementById(int id){
		List<Announcement> at = managerDaoImpl.getAnnouncementById(id);
		return at;
	}
	
	/**
	 * 刪除公告
	 * @param announcementId
	 */
	public void deleteAnnouncement(int announcementId) {
		try {
			Announcement getAnnouncement = managerDaoImpl.findAnnouncementById(announcementId);
			managerDaoImpl.deleteAnnouncement(getAnnouncement);
		}catch (Exception e) {
			System.out.println("刪除商家數量 -Service");
			e.printStackTrace();
		}
			
	}
}
