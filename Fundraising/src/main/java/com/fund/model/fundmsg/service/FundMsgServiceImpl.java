package com.fund.model.fundmsg.service;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundMsg;
import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.Msg;
import com.fund.model.eneity.Store;
import com.fund.model.fundProduct.dao.IFundProductDao;
import com.fund.model.fundmsg.dao.IFundMsgDao;

@Service
public class FundMsgServiceImpl implements IFundMsgService {
	
	@Autowired
	private IFundMsgDao fundMsgDaoImpl;
	
	@Autowired
	private IFundProductDao fundProductDaoImpl;

	@Override
	public void addFundMsg(FundMsg fundMsg, Member member, Integer fundProductId, Store storeId) {
		FundProduct fundProduct = fundProductDaoImpl.findFundProductDetailByFundProductId(fundProductId).get(0);
		fundMsg.setFundMsgDate(new Date());
		fundMsg.setFundProduct(fundProduct);
		fundMsg.setMember(member);
		fundMsg.setStore(storeId);
		fundMsgDaoImpl.addFundMsg(fundMsg);

	}

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
	

	@Override
	public List<FundMsg> listFindFundMsgByFundProductId(Integer fundProductId) {
		List<FundMsg> AllFundMsg = fundMsgDaoImpl.listFindFundMsgByFundProductId(fundProductId);
		return AllFundMsg;
	}

	@Override
	public List<FundMsg> findAllFundMsgByStoreId(Integer storeId) {
		return fundMsgDaoImpl.listFindAllFundMsgByStoreId(storeId);
	}

}
