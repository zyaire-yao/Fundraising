package com.fund.model.store.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Store;
import com.fund.model.store.dao.StoreDaoImpl;


public interface IStoreService {

	/**
	 * @Service 註冊商家時 設定商家狀態
	 */
	public String addStore(Store store,HttpSession httpSession);
	
	/**
	 * @Service 查詢Store
	 */
	public Store findStoreByStoreName(String storeName);
	
	
	/**
	 *@Service 查詢商店資料
	 */
	public Store findStoreById(Integer storeId);
	
	/**
	 * @Servic 存入照片
	 */
	public String addStorePic(MultipartFile file, HttpServletRequest request);

	
	/**
	 * @Service 刪除照片
	 */
	public boolean deleteStorePic(Integer storeId, HttpServletRequest request);
	
	/**
	 * @Service 更改商家資料
	 */
	public void updateStore(Store store,HttpSession httpSession);
	
}
