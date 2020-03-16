package com.fund.model.product.service;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Msg;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.Stock;
import com.fund.model.eneity.Store;
import com.fund.model.product.dao.IProductDao;
import com.fund.model.product.dao.ProductDaoImpl;

@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	private IProductDao productDaoImpl;

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	/**
	 * @新增商品
	 */
	@Override
	public void addProduct(Product product, String sddPic, Store store) {
		product.setProductStatus("正常品");
		product.setProductPic(sddPic);
		product.setStore(store);
		productDaoImpl.addProduct(product);
	}

	/**
	 * @新增庫存
	 */
	@Override
	public void addStock(Product product, Stock stock) {
		stock.setProduct(productDaoImpl.findProductByProductItemNO(product));
		stock.setStockDate(new Date());
		stock.setStockSales(0);
		stock.setStocklast(0);
		stock.setStockStatus("正常");
		productDaoImpl.addStock(stock);
	}

	/**
	 * @查商品_透過ID
	 * @param productId
	 * @return
	 */
	@Override
	public Product findProductById(Integer productId) {
		return productDaoImpl.findProductById(productId);
	}
	
	/**
	 * @利用或號查詢是否有商品
	 * @param product
	 * @return
	 */
	@Override
	public Product findProductByProductItemNO(Product product) {
		return productDaoImpl.findProductByProductItemNO(product);
	}

	/**
	 * @Servic 存入照片
	 * @param file
	 * @param request
	 * @return
	 */
	@Override
	public String addProductPic(MultipartFile file, HttpServletRequest request) {
		if (!file.getOriginalFilename().isEmpty()) {
			String fileType = file.getContentType(); // 獲得檔案型別
			if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {
				String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉“-”
				String ext = FilenameUtils.getExtension(file.getOriginalFilename());// 獲取檔案的副檔名
				String filePath = request.getSession().getServletContext()
						.getRealPath("/WEB-INF/resources/images/productPic");// 設定圖片上傳路徑
				try {
					file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
				} catch (Exception e) {
					e.printStackTrace();
				}
				String path = "images/productPic/" + name + "." + ext;// 把圖片儲存路徑儲存到資料庫
				return path;
			} else {
				String errorPic = "errorPic";
				return errorPic;
			}
		} else {// 如果沒有傳圖片 存預設圖片路徑
			String presetPic = "images/productPic/T1213121.png";
			return presetPic;
		}

	}

	 /*
	  *Service隨機撈出一筆商品資料
	  * */
	 @Override
	 public List<Product> getrandomProductService() {
	  List<Product> randomItemsService = productDaoImpl.getrandomProductDao();
	  System.out.println("randomItemsService=" + randomItemsService);
	  return randomItemsService;
	 }
	
	@Override
	public List<Product> getAllProductService() {
		List<Product> AllItems = productDaoImpl.getAllProductDao();
		return AllItems;
	}

	
	/**
	 * @ServiceImpl更新商品資料
	 */
	@Override
	public void updateProduct(Product product) {
		try {
			if(product.getProductPic() != null) {
				Product getproduct = productDaoImpl.findProductById(product.getProductId());
			product.setStore(getproduct.getStore());  
			product.setMsgs(getproduct.getMsgs());
			product.setOrdersDetails(getproduct.getOrdersDetails());
			product.setReports(getproduct.getReports());
			product.setReturns(getproduct.getReturns());
			product.setStocks(getproduct.getStocks());
			productDaoImpl.updateProduct(product);
			}else {
				Product getproduct = productDaoImpl.findProductById(product.getProductId());
				product.setStore(getproduct.getStore());  
				product.setMsgs(getproduct.getMsgs());
				product.setProductPic(getproduct.getProductPic());
				product.setOrdersDetails(getproduct.getOrdersDetails());
				product.setReports(getproduct.getReports());
				product.setReturns(getproduct.getReturns());
				product.setStocks(getproduct.getStocks());
				productDaoImpl.updateProduct(product);
			}
			
		} catch (Exception e) {
			System.out.println("update 失敗 -Service");
			e.printStackTrace();
		}
	}

	/**
	 * @Service 刪除照片
	 */
	@Override
	public boolean deletePorductPic(int productId, HttpServletRequest request) {
		String getProductPic = productDaoImpl.findProductById(productId).getProductPic();
		System.out.println("                             12313123 "+getProductPic);
		String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/");
		String fileName = filePath + getProductPic;
		File file = new File(fileName);
		if (file.isFile() && file.exists()) {
			file.delete();// "刪除單個檔案"+name+"成功！"
			return true;
		} // "刪除單個檔案"+name+"失敗！"
		return false;
	}

	@Override
	public List<Product> getoneProductService(Integer productId) {
		List<Product> Items = productDaoImpl.getoneProductDao(productId);
		return Items;
	}

	@Override
	public List getStoreService(Integer productId) {
		// TODO Auto-generated method stub
		return productDaoImpl.getStoreDao(productId);
	}
	
	/**
	  * @找商家商品 回傳Entity
	  * @param store
	  * @return
	  */
	 @Override
	 public Product findProductByStoreId(Store store) {
	  Product getProduct = productDaoImpl.findProductByStoreId(store);
	  return getProduct;
	 }
	 
	 
	 /**
	  * @找商家商品 回傳LIST
	  * @param store
	  * @return
	  */
	 @Override
	 public List<Product> listFindProductByStoreId(Store store) {
	 return productDaoImpl.listFindProductByStoreId(store);
	 }

	
	 /**
	 * @新增檢舉
	 * @param Report
	 * @return
	 */
	@Override
	public void Report(Report report) {	
		report.setReportStatus("處理中");
		productDaoImpl.Report(report);
	}
	

	/**
	 * 查詢商家商品全部留言
	 * @return
	 */
	@Override
	public List getProductMsg(List<Product> getProductToStore) {
		List<Msg>aa = 	productDaoImpl.getProductMsg(getProductToStore);
		
		return aa;
		
	}
	/**
	 * 模糊查詢商品
	 * @return
	 */
	@Override
	public List<Product> findProductLike(String Inquire) {
		
		//輸入為模糊查詢
			return productDaoImpl.findProductLike(Inquire);
	
	
		
	}


}