package com.fund.model.fundreply.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundReply;
import com.fund.model.eneity.Store;
import com.fund.model.fundProduct.dao.IFundProductDao;
import com.fund.model.fundmsg.dao.IFundMsgDao;
import com.fund.model.fundreply.dao.IFundReplyDao;

@Service
public class FundReplyServiceImpl implements IFundReplyService {

	@Autowired
	private IFundReplyDao fundReplyDaoImpl;

	@Autowired
	private IFundProductDao fundProductDaoImpl;

	@Autowired
	private IFundMsgDao fundMsgDaoImpl;

	/**
	 * 新增回覆
	 * 
	 * @param fundReply
	 * @param getStore
	 * @param fundMsgId
	 * @param fundProductId
	 */
	@Override
	public void addFundReply(FundReply fundReply, Store getStore, Integer fundMsgId, Integer fundProductId) {
		System.out.println("===================" +fundProductId);
		  List<FundProduct> listfundProduct = fundProductDaoImpl.findFundProductDetailByFundProductId(fundProductId);
		 FundProduct fundProduct =listfundProduct.get(0);
		System.out.println("------------------------------------------"+fundProduct+"----------------------------------------");
		fundReply.setFundProduct(fundProduct);
		fundReply.setFundMsg(fundMsgDaoImpl.findFundMsgByFundMsgId(fundMsgId));// 設定fundMsg
		fundReply.setStore(getStore);// 設定商家
		fundReplyDaoImpl.addFundReply(fundReply);
	}

	/**
	 * 店家查詢所有回覆
	 * 
	 * @param storeId
	 * @return
	 */
	@Override
	public List<FundReply> findAllFundReplyByStoreId(Integer storeId) {
		return fundReplyDaoImpl.findAllFundReplyByStoreId(storeId);
	}

	@Override
	public String addReplyPic(MultipartFile file, HttpServletRequest request) {
		String fileType = file.getContentType(); // 獲得檔案型別
		if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {
			String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉“-”
			String ext = FilenameUtils.getExtension(file.getOriginalFilename());// 獲取檔案的副檔名
			String filePath = request.getSession().getServletContext()
					.getRealPath("/WEB-INF/resources/images/replyPic");// 設定圖片上傳路徑
			try {
				file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
			} catch (Exception e) {
				e.printStackTrace();
			}
			String path = "images/replyPic/" + name + "." + ext;// 把圖片儲存路徑儲存到資料庫
			return path;
		} else {
			String errorPic = "errorPic";
			return errorPic;
		}
	}

	@Override
	public List<FundReply> listFindFundReplyByFundProductId(Integer fundProductId) {
		return fundReplyDaoImpl.listFindFundReplyByFundProductId(fundProductId);
	}
}
