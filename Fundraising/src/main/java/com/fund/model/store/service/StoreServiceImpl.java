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
import com.fund.model.store.dao.IStoreDao;
import com.fund.model.store.dao.StoreDaoImpl;

@Service
public class StoreServiceImpl implements IStoreService{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private IStoreDao storeDaoImpl;
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
//		return sessionFactory.openSession();
	}
	

	

	/**
	 * @return 
	 * @Service 註冊商家時 設定商家狀態
	 */
	@Override
	public String addStore(Store store,HttpSession httpSession) {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != store  &&null != memberSession) {//如果有輸入資料 且 memberSession 存在
				store.setStoreStatus("正常"); //狀態改為正常
				store.setMember(memberSession);//設定Store裡的Member
				storeDaoImpl.addStore(store);
				return null;
			} else {
				return "error"; //途中如果Session遺失 返回"error"
			}

	}
	
	/**
	 * @Service 查詢Store
	 */
	@Override
	public Store findStoreByStoreName(String storeName){
		return storeDaoImpl.findStoreByStoreName(storeName);
	}
	
	
	/**
	 *@Service 查詢商店資料
	 */
	@Override
	public Store findStoreById(Integer storeId) {	
		return storeDaoImpl.findStoreById(storeId);
	}
	
	/**
	 * @Servic 存入照片
	 * @param file
	 * @param request
	 * @return
	 */
	@Override
	public String addStorePic(MultipartFile file, HttpServletRequest request) {
		if (!file.getOriginalFilename().isEmpty()) {
			String fileType = file.getContentType(); // 獲得檔案型別
			if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {
				String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉四個“-”
				String ext = FilenameUtils.getExtension(file.getOriginalFilename());// 獲取檔案的副檔名
				String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/images/storePic");// 設定圖片上傳路徑
				try {
					file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
				} catch (Exception e) {
					e.printStackTrace();
				}
				String path = "images/storePic/" + name + "." + ext;// 把圖片儲存路徑儲存到資料庫
				return path;
			} else {
				String errorPic = "errorPic";
				return errorPic;
			}
		} else {
			String presetPic = "images/storePic/T1213121.jpg";// 如果沒有傳圖片 存預設圖片路徑
			return presetPic;
		}
	}

	
	/**
	 * @Service 刪除照片
	 */
	@Override
	public boolean deleteStorePic(Integer storeId, HttpServletRequest request) {
		Store store = storeDaoImpl.findStoreById(storeId);
		String storePic = store.getStorePic();
		if (!storePic.equals("images/storePic/T1213121.jpg")) {//如果圖片名不是預設照片
			String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/");//找出圖片路徑
			String fileName = filePath + storePic; //設定路徑位置
			File file = new File(fileName);
			if (file.isFile() && file.exists()) {//如果檔案存在
				file.delete();// 刪除單個檔案
				return true;
			} 
			return false;// 刪除失敗
		}
		return true;
	}
	
	/**
	 * @Service 更改商家資料
	 */
	@Override
	public void updateStore(Store store,HttpSession httpSession) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
		store.setMember(memberSession);//將Session的Member 設定給Session
		storeDaoImpl.updateStore(store);
	}
}
