package com.fund.model.manager.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.fund.model.eneity.Announcement;
import com.fund.model.eneity.Manager;

public interface IManagerService {
	
	/**
	 * @param 取得管理員資料
	 */
	public List<Manager> getManagerByManagerAccount(String account);
	
	/**
	 * @param 存入公告
	 */
	public String initAnnouncement(Announcement announcement,HttpSession httpSession);
	
    /**
     * @查詢公告
     */
	public List<Announcement> getAnnouncement();
	
	/**
	 * @查詢公告內容
	 */
	public List<Announcement> getAnnouncementById(int id);
	
	/**
	 * 刪除公告
	 * @param announcementId
	 */
	public void deleteAnnouncement(int announcementId);

}
