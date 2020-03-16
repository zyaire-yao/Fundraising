package com.fund.model.msg.service;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Msg;
import com.fund.model.eneity.Product;
import com.fund.model.msg.dao.IMsgDao;
import com.fund.model.product.service.IProductService;
@Service
public class MsgServiceImpl implements IMsgService{
	@Autowired
	private IMsgDao msgDaoImpl;
	@Autowired
	private IProductService productServiceImpl;
	

	/**
	 * 新增留言
	 * @param msg
	 * @param member
	 * @param productId
	 */
	@Override
	public void addMsg(Msg msg,Member member, Integer productId) {
	try {	
		Product getProduct = productServiceImpl.findProductById(productId);
		msg.setMember(member);
		msg.setMsgDate(new Date());
		msg.setProduct(getProduct);
		msg.setStore(getProduct.getStore());
		msgDaoImpl.addMsg(msg);
		System.out.println("留言成功-Service");
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("留言失敗-Service");
	}
}
	
	/*
	 * 針對商品查詢留言
	 * */
	@Override
	public List<Msg> getMsgByProductId(Integer productId) {
		return msgDaoImpl.getMsgByProductId(productId);
	}
	
	/*
	 * 針對商品查詢留言 StoreId
	 * */
	@Override
	public List<Msg> getMsgByStoreId(Integer StoreId) {
		return msgDaoImpl.getMsgByStoreId(StoreId);
	}
	
	/*
	 * 
	 * 上傳圖片
	 * */
	@Override
	public String addMsgPic(MultipartFile file, HttpServletRequest request) {
		if (!file.getOriginalFilename().isEmpty()) {
			String fileType = file.getContentType(); // 獲得檔案型別
			if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {
				String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉“-”
				String ext = FilenameUtils.getExtension(file.getOriginalFilename());// 獲取檔案的副檔名
				String filePath = request.getSession().getServletContext()
						.getRealPath("/WEB-INF/resources/images/MsgPic");// 設定圖片上傳路徑
				try {
					file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
				} catch (Exception e) {
					e.printStackTrace();
				}
				String path = "images/MsgPic/" + name + "." + ext;// 把圖片儲存路徑儲存到資料庫
				return path;
			} else {
				String errorPic = "errorPic";
				return errorPic;
			}
		} else {// 如果沒有傳圖片 存預設圖片路徑		
			return null;
		}
	}

	
	

}




