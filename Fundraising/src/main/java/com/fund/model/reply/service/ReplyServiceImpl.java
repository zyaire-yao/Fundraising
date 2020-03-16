package com.fund.model.reply.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Reply;
import com.fund.model.eneity.Store;
import com.fund.model.msg.dao.IMsgDao;
import com.fund.model.product.dao.IProductDao;
import com.fund.model.reply.dao.IReplyDao;

@Service
public class ReplyServiceImpl implements IReplyService{

	@Autowired
	private IReplyDao replyDao;
	
	@Autowired
	private IMsgDao msgDaoImpl;
	
	@Autowired
	private IProductDao productDaoImpl;
	
	/**
	 * 新增回覆留言
	 * @param reply
	 */
	@Override
	public void appReply(Reply reply,Store getStore,Integer msgId,Integer productId) {
		reply.setProduct(productDaoImpl.findProductById(productId));
		reply.setMsg(msgDaoImpl.getMsgByMsgId(msgId));//設定Msg
		reply.setStore(getStore);//設定商家
		replyDao.appReply(reply);
	}
	
	/**
	 * @Servic 存入照片
	 * @param file
	 * @param request
	 * @return
	 */
	@Override
	public String addReplyPic(MultipartFile file, HttpServletRequest request) {
				String fileType = file.getContentType(); // 獲得檔案型別
				if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {
					String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉“-”
					String ext = FilenameUtils.getExtension(file.getOriginalFilename());// 獲取檔案的副檔名
					String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/images/replyPic");// 設定圖片上傳路徑
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
	
	
	/**
	 * 查詢商家全部回覆
	 * @return
	 */
	@Override
	public List<Reply> findAllReply(Integer storeId){
		return replyDao.findAllReply(storeId);	
	} 
	
	
	
    /**
     * 查詢Reply By productId
     * @param productId
     * @return
     */
	@Override
	public List<Reply> findReplyByProductId(Integer productId){
		return replyDao.findReplyByProductId(productId);
	}
	

	
}
