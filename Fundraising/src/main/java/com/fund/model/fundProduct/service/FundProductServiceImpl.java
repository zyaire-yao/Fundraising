package com.fund.model.fundProduct.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Store;
import com.fund.model.fundProduct.dao.FundProductDaoImpl;
import com.fund.model.fundProduct.dao.IFundProductDao;
import com.fund.model.store.dao.IStoreDao;
import com.fund.model.store.dao.StoreDaoImpl;

@Service
public class FundProductServiceImpl implements IFundProductService{

	@Autowired
	private IFundProductDao fundProductDaoImpl;

	@Autowired
	private IStoreDao storeDaoImpl;

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * @新增商品
	 */
	@Override
	public void addFundProduct(FundProduct fundProduct, HttpSession httpSession) {
		Store storeSession = (Store) httpSession.getAttribute("storeSession");
		Store getstore = storeDaoImpl.findStoreById(storeSession.getStoreId());
		System.out.println("Service");
		fundProduct.setFundProductStatus("募資未達標");
		System.out.println("Service Over");
		fundProductDaoImpl.addFundProduct(fundProduct);
	}

	/**
	 * @更新募資商品
	 */
	@Override
	public void updateFundProduct(FundProduct fundProduct) {
		if (fundProduct.getFundProductPic() != null) {
			String hql = "update FundProduct fpd set  fpd.fundProductPic=:itmePic , fpd.fundProductDetail =:itemDetail where fpd.fundProductId=:ssid";
			Query query = getSession().createQuery(hql).setParameter("ssid", fundProduct.getFundProductId());
			query.setParameter("itmePic", fundProduct.getFundProductPic());
			query.setParameter("itemDetail", fundProduct.getFundProductDetail());
			fundProductDaoImpl.updateFundProduct(query);
		} else {
			String hql = "update FundProduct fpd set fpd.fundProductDetail =:itemDetail  where fpd.fundProductId=:ssid";
			Query query = getSession().createQuery(hql).setParameter("ssid", fundProduct.getFundProductId());
			query.setParameter("itemDetail", fundProduct.getFundProductDetail());
			fundProductDaoImpl.updateFundProduct(query);
		}
	}

	/**
	 ** 
	 */
	@Override
	public FundProduct findUpdateFundProductByFundProjectId(Integer fundProjectId) {
		System.out.println("fundProjectId Service:" + fundProjectId);
		FundProduct fundProduct = fundProductDaoImpl.findUpdateFundProductByFundProjectId(fundProjectId);
		return fundProduct;
	}

	/**
	 * @Servic 存入照片
	 * @param file
	 * @param request
	 * @return
	 */
	@Override
	public String addFundProductPic(MultipartFile file, HttpServletRequest request) {
		System.out.println("Service addPic");
		if (!file.getOriginalFilename().isEmpty()) {
			String fileType = file.getContentType(); // 獲得檔案型別
			if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {
				String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉“-”
				String ext = FilenameUtils.getExtension(file.getOriginalFilename());// 獲取檔案的副檔名
				String filePath = request.getSession().getServletContext()
						.getRealPath("/WEB-INF/resources/images/fundproductPic");// 設定圖片上傳路徑
				try {
					file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
				} catch (Exception e) {
					e.printStackTrace();
				}
				String path = "images/fundproductPic/" + name + "." + ext;// 把圖片儲存路徑儲存到資料庫
				return path;
			} else {
				String errorPic = "errorPic";
				return errorPic;
			}
		} else {// 如果沒有傳圖片 存預設圖片路徑
			String presetPic = "images/productPic/T1213121.jpg";
			return presetPic;
		}

	}

	/**
	 * @用storeId找projectId
	 */
	@Override
	public FundProject findFundProjectByStoreId(Store store) {
		String hql = "From FundProject WHERE store_Id=:id";
		Query query = getSession().createQuery(hql).setParameter("id", store.getStoreId());
		List ListFundProject = query.list();
		if (ListFundProject.size() > 0) {
			FundProject fundProject = (FundProject) ListFundProject.get(0);
			return fundProject;
		} else {
			return null;
		}
	}

	/**
	 * @Service 刪除照片
	 */
	@Override
	public boolean deletePorductPic(Integer fundProductId, HttpServletRequest request) {
		List<FundProduct> ListProduct = fundProductDaoImpl.findUpdateFundProductByFundProductId(fundProductId);
		String getProjectPic = ListProduct.get(0).getFundProductPic();
		String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/");
		String fileName = filePath + getProjectPic;
		File file = new File(fileName);
		if (file.isFile() && file.exists()) {
			file.delete();// "刪除單個檔案"+name+"成功！"
			return true;
		} // "刪除單個檔案"+name+"失敗！"
		return false;
	}

	/**
	 * @Service 抓取店家所有募資商品
	 */
	@Override
	public List<FundProduct> findAllFundProductByStoreId(Integer storeId) {
		List<FundProduct> fundProduct = fundProductDaoImpl.findAllFundProductByStoreId(storeId);

		return fundProduct;
	}

	/**
	 * @Service 抓取所有募資商品供消費者選購
	 */
	@Override
	public List<FundProduct> getAllProductService() {
		List<FundProduct> AllItems = fundProductDaoImpl.getAllProductDao();
		return AllItems;
	}

	/**
	 * @Service 用fundproductId 抓取fundProductDetail
	 */
	@Override
	public List<FundProduct> findFundProductDetailByFundProductId(Integer fundProductId) {
		List<FundProduct> Items = fundProductDaoImpl.findFundProductDetailByFundProductId(fundProductId);
		return Items;
	}

	/**
	 * @Service 用fundprojectId 抓取fundProductDetail
	 */
	@Override
	public List<FundProduct> findFundProductDetailByFundProjectId(Integer fundProjectId) {
		System.out.println("Service");
		List<FundProduct> Items = fundProductDaoImpl.findFundProductDetailByFundProjectId(fundProjectId);
		return Items;
	}
	
	/**
	 * @Service 用fundproductId 抓取 storeId
	 * @Return 存進訂單
	 */
	@Override
	public FundProduct findStoreByFundProductId(Integer fundProductId) {
		FundProduct fundProduct = fundProductDaoImpl.findStoreByFundProductId(fundProductId);
		return fundProduct;
	}

	@Override
	public List getStoreService(Integer fundProductId) {
		return fundProductDaoImpl.getStoreDao(fundProductId);
	}
	
	/**
	 * 模糊查詢商品
	 * @return
	 */
	@Override
	public List<FundProduct> findFundProductLike(String Inquire) {
		
		//輸入為模糊查詢
			return fundProductDaoImpl.findFundProductLike(Inquire);
	
	
		
	}

}
