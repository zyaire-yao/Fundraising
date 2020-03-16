package com.fund.model.manager.dao;

import java.util.List;

import com.fund.model.eneity.Announcement;
import com.fund.model.eneity.Manager;

public interface IManagerDao {
	
	/**
	 * @getMemberDao 取得會員資料
	 */
	public List<Manager> getManagerByManagerAccount(String account);
	
	
    /**
     * @param 存入公告
     */
	public String initAnnouncement(Announcement announcement);
	
	/**
	 * @return 取得全部公告
	 */
	public List<Announcement> getAnnouncement();
	
	/**
	 * @取得公告內容
	 */
    public List<Announcement> getAnnouncementById(int id);
	
	/**
	 * 刪除公告
	 * @param getAnnouncement
	 */
	public void deleteAnnouncement(Announcement getAnnouncement);

	/*
	 * 透過ID查公告
	 * */
	public Announcement findAnnouncementById(Integer announcementId);

}
