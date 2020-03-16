package com.fund.controller.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.Msg;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Reply;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.ShoppingCart;
import com.fund.model.eneity.Stock;
import com.fund.model.eneity.Store;
import com.fund.model.member.service.IMemberService;
import com.fund.model.msg.service.IMsgService;
import com.fund.model.product.service.IProductService;
import com.fund.model.reply.service.IReplyService;
import com.fund.model.shoppingCar.Service.IShoppingCarService;
import com.fund.model.store.service.IStoreService;

@Controller
public class ProductController {

	@Autowired
	private IProductService productServiceImpl;
	@Autowired
	private IStoreService storeServiceImpl;
	@Autowired
	private IMemberService memberServiceImpl;
	@Autowired
	private IMsgService msgServiceImpl;
	@Autowired
	private IReplyService replyService;
	@Autowired
	private IShoppingCarService shoppingCarService;
	/**
	 * @新增商品
	 */
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String addProduct(HttpSession httpSession, Product product, Stock stock, HttpServletRequest request,
			@RequestParam(value = "file", required = false) MultipartFile file, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");// 取得Session的storeId,因為
			Store getStore = storeServiceImpl.findStoreById(storeSession.getStoreId());//查資料庫看是否有此筆商家資料
			if (getStore == null) {  //如果商家存在
				System.out.println("未登入");
				return "MemberSystem/noLogin";
			} else if (product.getProductItemNO().isEmpty()) {  //isEmpty() 空值
				System.out.println("貨號不可為空");
				model.addAttribute("errorIremNO1", "貨號不可為空");
				return "Product/addProduct";
			} else if (productServiceImpl.findProductByProductItemNO(product) != null) { 
				//Service 裡的 findProductByProductItemNO 方法
				System.out.println("貨號不可重複");
				model.addAttribute("errorIremNO2", "貨號不可重複");
				return "Product/addProduct";
			} else if (product.getProductName().isEmpty()) {
				System.out.println("商品名不可為空");
				model.addAttribute("errorName", "商品名不可為空");
				return "Product/addProduct";
			} else if (product.getProductPf().isEmpty()) {
				System.out.println("商品簡介不可為空");
				model.addAttribute("errorPf", "商品簡介不可為空");
				return "Product/addProduct";
			} else if (product.getProductPrice() < 0) {
				System.out.println("價格必須大於0");
				model.addAttribute("errorPrice", "價格必須大於0");
				return "Product/addProduct";
			} else if (stock.getStockAmount() < 0) {
				System.out.println("庫存必須大於0");
				model.addAttribute("errorStock", "庫存必須大於0");
				return "Product/addProduct";
			} else if (file.getBytes().length > 10485760) {
				System.out.println("檔案超出大小限制10M");
				model.addAttribute("errorPicSize", "檔案超出大小限制10M");
				return "Product/addProduct";
			} else {
				String sddPic = productServiceImpl.addProductPic(file, request);
				//Service 裡的 addProductPic 方法     // 新增商品圖片產生路徑 set 到Product
				if (!sddPic.equals("errorPic")) {
					productServiceImpl.addProduct(product, sddPic, getStore);
					//Service 裡的 addProduct 方法    // (product, sddPic, getStore)括號內的參數 是傳到service addProduct 方法裡面
					productServiceImpl.addStock(product, stock);
					//Service 裡的 addStock方法    // (product, stock)括號內的參數 是傳到service addStock 方法裡面
				} else {
					System.out.println("圖片存取失敗");
					model.addAttribute("errorPic", "圖片存取失敗");
					return "Product/addProduct";
				}
				System.out.println("上架成功");
				return "redirect:/ProductEdit";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "MemberSystem/noLogin";
		}
	}

	/**
	 * @取得商品資料至更新頁面
	 * @param productId
	 * @param model
	 * @return "Product/updateProduct";
	 */
	@RequestMapping(value = "/getProductToUpdate", method = RequestMethod.POST)
	public String getProductToUpdate(@RequestParam(name = "productId", required = false) Integer productId,
			Model model) {
		Product getProduct = productServiceImpl.findProductById(productId);
		model.addAttribute("getProduct", getProduct);
		return "Product/updateProduct";
	}

	/**
	 * @商品資料更新
	 * @param httpSession
	 * @param request
	 * @param product
	 * @param model
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/updateProduct", method = RequestMethod.POST)
	public String updateProduct(HttpSession httpSession, HttpServletRequest request, Model model,
			@RequestParam(value = "file", required = false) MultipartFile file, Product product) throws Exception {

		Store storeSession = (Store) httpSession.getAttribute("storeSession");
		model.addAttribute("productInp",product);
		if (storeServiceImpl.findStoreById(storeSession.getStoreId()) == null) { // 利用取得的Session 來查資料庫是否有該筆資料
			System.out.println("Session 遺失");
			return "Product/noLogin";
		} else if (product.getProductItemNO().isEmpty()) {
			System.out.println("貨號不可為空");
			model.addAttribute("errorIremNO1", "貨號不可為空");
			return "Product/updateProduct";
		} else if (productServiceImpl.findProductByProductItemNO(product) != null && !productServiceImpl
				.findProductByProductItemNO(product).getProductItemNO().equals(product.getProductItemNO())) {
			System.out.println("貨號不可重複");
			model.addAttribute("errorIremNO2", "貨號不可重複");
			return "Product/updateProduct";
		} else if (product.getProductName().isEmpty()) {
			System.out.println("商品名不可為空");
			model.addAttribute("errorName", "商品名不可為空");
			return "Product/updateProduct";
		} else if (product.getProductPf().isEmpty()) {
			System.out.println("商品簡介不可為空");
			model.addAttribute("errorPf", "商品簡介不可為空");
			return "Product/updateProduct";
		} else if (product.getProductPrice() < 0) {
			System.out.println("價格必須大於0");
			model.addAttribute("errorPrice", "價格必須大於0");
			return "Product/updateProduct";
		} else if (file.getBytes().length > 10485760) {
			System.out.println("檔案超出大小限制10M");
			model.addAttribute("errorPicSize", "檔案超出大小限制10M");
			return "Product/updateProduct";
		} else if (!file.getOriginalFilename().isEmpty()) {// 檢驗看圖檔是否有上傳}
			String fileType = file.getContentType(); // 獲得檔案型別
			if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {// 查看圖片資料類型
				productServiceImpl.deletePorductPic(product.getProductId(), request);// 刪除原本照片
				String path = productServiceImpl.addProductPic(file, request);// 新增照片
				product.setProductPic(path);// 把圖片儲存路徑儲存到資料庫
				productServiceImpl.updateProduct(product);// 進行更新
				return "redirect:/ProductEdit";// 更新完成後 返回getMember 方法 導回會員查詢頁面
			} else {
				System.out.println("輸入圖片格式錯誤");
				model.addAttribute("errorPic", "輸入圖片格式錯誤");
				return "Product/updateProduct";
			}
		}else {//如果沒有上傳圖片
			System.out.println("=====================================");
			productServiceImpl.updateProduct(product);// 進行更新
			return "redirect:/ProductEdit";// 更新完成後 返回getMember 方法 導回會員查詢頁面
		}
		
	}

	/**
	 * @商品購買頁面用
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getAllProduct", method = RequestMethod.GET)
	public String getAllProduct(Model model, HttpSession httpSession) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");
		if (memberSession == null) {
			List<Product> AllItems = productServiceImpl.getAllProductService();
			model.addAttribute("All", AllItems);
			List<Product> randomProduct = productServiceImpl.getrandomProductService();
			model.addAttribute("randomProduct", randomProduct.get(0));
			return "Product/AllProduct";
		} else {
			List<Product> AllItems = productServiceImpl.getAllProductService();
			model.addAttribute("All", AllItems);
			List<Product> randomProduct = productServiceImpl.getrandomProductService();
			model.addAttribute("randomProduct", randomProduct.get(0));
			Member getmember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
			List<ShoppingCart> getMemberCartCounts = shoppingCarService.FindMemberCartItemsCounts(getmember);
			model.addAttribute("MemberCartCounts", getMemberCartCounts.get(0));
			return "Product/AllProduct";
		}
	}

	/**
	 * @讀取單個商品 >>購買頁面
	 * @param httpSession
	 * @param model
	 * @param productId
	 * @return
	 */
	@RequestMapping(value = "/getProductDetail", method = RequestMethod.GET)
	public String getProductDetail(HttpSession httpSession, Model model,
			@RequestParam(name = "productId") Integer productId, Msg msg) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");
		if (memberSession == null) {
			List<Product> Items = productServiceImpl.getoneProductService(productId);
			List<Msg> AllMsg = msgServiceImpl.getMsgByProductId(productId);
			Product product = Items.get(0);
			int Items2 = (int) productServiceImpl.getStoreService(productId).get(0);
			Store store = storeServiceImpl.findStoreById(Items2);
			List<Reply> reply = replyService.findReplyByProductId(productId);
			model.addAttribute("reply", reply);
			model.addAttribute("productDetail", product);
			model.addAttribute("store", store);
			model.addAttribute("MsgByProductId", AllMsg);
			return "Product/ProductDetail";
		} else {
			List<Product> Items = productServiceImpl.getoneProductService(productId);
			List<Msg> AllMsg = msgServiceImpl.getMsgByProductId(productId);
			Product product = Items.get(0);
			int Items2 = (int) productServiceImpl.getStoreService(productId).get(0);
			Store store = storeServiceImpl.findStoreById(Items2);
			List<Reply> reply = replyService.findReplyByProductId(productId);
			Member getmember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
			List<ShoppingCart> getMemberCartCounts = shoppingCarService.FindMemberCartItemsCounts(getmember);
			model.addAttribute("reply", reply);
			model.addAttribute("productDetail", product);
			model.addAttribute("store", store);
			model.addAttribute("MsgByProductId", AllMsg);
			model.addAttribute("MemberCartCounts", getMemberCartCounts.get(0));
			return "Product/ProductDetail";
		}

	}

	/**
	 * @取得商品ID及會員ID
	 */
	@RequestMapping(value = "/getProductIdAndmemberIdToReport", method = RequestMethod.POST)
	public String getProductIdAndmemberIdToReport(@RequestParam(name = "productId", required = false) Integer productId,
			@RequestParam(name = "memberId", required = false) Integer memberId, Model model) {

		Product getProduct = productServiceImpl.findProductById(productId);
		model.addAttribute("getProduct", getProduct);

		Member getMember = memberServiceImpl.findMemberByMemberId(memberId);
		model.addAttribute("getMember", getMember);
		return "Product/report";
	}

	/**
	 * @新增檢舉
	 */
	@RequestMapping(value = "/addreport", method = RequestMethod.POST)
	public String addreport(HttpSession httpSession, Report report,
			@RequestParam(name = "productId", required = false) Integer productId, Model model) {

		try {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的MemberId

			if (memberSession == null) {
				System.out.println("未登入");
				return "MemberSystem/noLogin";
			} else if (report.getReportTital().isEmpty()) { // isEmpty()如果為空值
				System.out.println("標題不可為空");
				model.addAttribute("errorReportTital", "標題不可為空");
				return "Product/report";
			} else if (report.getReportPf().isEmpty()) {
				System.out.println("內容不可為空");
				model.addAttribute("errorReportPf", "內容不可為空");
				return "Product/report";
			} else {
				Member getMember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
				Product getProduct = productServiceImpl.findProductById(productId);
				report.setProduct(getProduct);
				report.setMember(getMember);
				productServiceImpl.Report(report);
				System.out.println("檢舉完成");
				return "Product/reportSuccess";
			}

		} catch (Exception e) {
			System.out.println("檢舉新增失敗");
			e.printStackTrace();
			return "Product/report";
		}

	}
	
	/**
	 * 模糊查詢商品
	 * @return
	 */
	@RequestMapping(value = "/findProductLike")
	public String findProductLike(@RequestParam(name = "Inquire")String Inquire,Model model) {
		List<Product> listProduct = productServiceImpl.findProductLike(Inquire);
		model.addAttribute("listProduct", listProduct);//回傳查詢結果至jsp
		model.addAttribute("Inquire", Inquire);//將原本輸入值回傳jsp
		List<Product> randomProduct = productServiceImpl.getrandomProductService(); 
		model.addAttribute("randomProduct", randomProduct.get(0));
		return "Product/AllProduct";	
	}
	
}
