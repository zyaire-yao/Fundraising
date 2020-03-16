package com.fund.controller.fundProduct;

import java.io.File;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.back.service.IFundSettleService;
import com.fund.model.eneity.FundMsg;
import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProgram;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundReply;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Store;
import com.fund.model.fundOrder.service.IFundOrderService;
import com.fund.model.fundProduct.service.IFundProductService;
import com.fund.model.fundProgram.service.IFundProgramService;
import com.fund.model.fundmsg.service.IFundMsgService;
import com.fund.model.fundproject.service.IFundProjectService;
import com.fund.model.fundreply.service.FundReplyServiceImpl;
import com.fund.model.fundreply.service.IFundReplyService;
import com.fund.model.store.service.IStoreService;

@Controller
public class FundproductController {

	@Autowired
	private IFundProductService fundProductServiceImpl;

	@Autowired
	private IFundProjectService fundProjecttServiceImpl;

	@Autowired
	private IStoreService storeServiceImpl;

	@Autowired
	private IFundProgramService fundProgramServiceImpl;

	@Autowired
	private IFundSettleService fundSettleServiceImpl;

	@Autowired
	private IFundOrderService fundOrderServiceImpl;

	@Autowired
	private IFundMsgService fundMsgServiceImpl;

	@Autowired
	private IFundReplyService fundReplyServiceImpl;

	// 新增募資商品
	@RequestMapping(value = "/addFundProduct", method = RequestMethod.POST)
	public String addFundProduct(HttpSession httpSession, FundProduct fundProduct, HttpServletRequest request,
			@RequestParam(name = "file", required = false) MultipartFile file, Model model,
			@RequestParam(value = "fundProjectId") Integer fundProjectId,
			@RequestParam(value = "LastDay") Integer LastDay) throws Exception {
		Store storeSession = (Store) httpSession.getAttribute("storeSession");// 取得Session的storeId
		Store getStore = storeServiceImpl.findStoreById(storeSession.getStoreId());
		if (getStore != null) {
			if (fundProduct.getFundProductName().isEmpty()) { // 募資名字不得為空
				System.out.println("募資名字不得為空");
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("LastDay", LastDay);
				model.addAttribute("fundProjectId", fundProjectId);
				model.addAttribute("errorName", "募資名字不得為空");
				return "FundProduct/addFundProduct";
			} else if (fundProduct.getFundProductPrice() <= 0) { // 募資金額不得為空
				System.out.println("總金額必須大於0");
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("LastDay", LastDay);
				model.addAttribute("fundProjectId", fundProjectId);
				model.addAttribute("errorPrice", "總金額必須大於0");
				return "FundProduct/addFundProduct";
			} else if (fundProduct.getFundProductDetail().isEmpty()) { // 募資說明不得為空
				System.out.println("募資說明不可為空");
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("LastDay", LastDay);
				model.addAttribute("fundProjectId", fundProjectId);
				model.addAttribute("errorDetail", "募資說明不可為空");
				return "FundProduct/addFundProduct";
			} else if (fundProduct.getFundProductPf().isEmpty()) { // 募資簡介不得為空
				System.out.println("募資內容不可為空");
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("LastDay", LastDay);
				model.addAttribute("fundProjectId", fundProjectId);
				model.addAttribute("errorProject", "募資內容不可為空");
				return "FundProduct/addFundProduct";
			} else if (file.getBytes().length > 10485760) { // 圖片超出大小限制10M
				System.out.println("圖片超出大小限制10M");
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("LastDay", LastDay);
				model.addAttribute("fundProjectId", fundProjectId);
				model.addAttribute("errorProjectSize", "圖片超出大小限制10M");
				return "FundProduct/addFundProduct";
			} else if (!file.getContentType().equals("image/jpeg")) { // 圖片格式錯誤
				System.out.println("募資企劃檔格式錯誤");
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("LastDay", LastDay);
				model.addAttribute("fundProjectId", fundProjectId);
				model.addAttribute("errorFileType", "圖片格式錯誤");
				return "FundProduct/addFundProduct";
			} else { // 新增募資商品
				String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉四個“-”
				String imageName = file.getOriginalFilename();// 獲取圖片名稱
				String ext = FilenameUtils.getExtension(imageName);// 獲取檔案的副檔名
				String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/images");// 設定圖片上傳路徑
				file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
				fundProduct.setFundProductPic("images/" + name + "." + ext);// 把圖片儲存路徑儲存到資料庫
				fundProduct.setStore(getStore);
				FundProject fundProject = fundProjecttServiceImpl.findFundProjectByfundProjectId(fundProjectId);
				fundProduct.setFundProject(fundProject);
				fundProductServiceImpl.addFundProduct(fundProduct, httpSession);
				return "redirect:/FindFundProject";
			}
		} else {
			System.out.println("未登入");
			return "MemberSystem/noLogin";
		}
	}

	// 修改募資商品

	@RequestMapping(value = "/updateFundProduct", method = RequestMethod.POST)
	public String updateFundProduct(HttpSession httpSession, HttpServletRequest request, FundProduct fundProduct,
			@RequestParam(name = "fundProductId") Integer fundProductId, Model model,
			@RequestParam(value = "file", required = false) MultipartFile file) throws Exception {
		if (!file.getOriginalFilename().isEmpty()) {
			if (!file.getContentType().equals("image/jpeg")) { // 獲得檔案型別（可以判斷如果不是圖片，禁止上傳）
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("fundProductId", fundProductId);
				model.addAttribute("errorFileType", "圖片格式錯誤");
				return "FundProduct/updateFundProduct";
			} else if (file.getBytes().length > 10485760) {
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("fundProductId", fundProductId);
				model.addAttribute("errorPicSize", "檔案超出大小限制10M");
				return "FundProduct/updateFundProduct";
			} else if (fundProduct.getFundProductDetail().isEmpty()) {
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("fundProductId", fundProductId);
				model.addAttribute("errorDetail", "募資說明不可為空");
				return "FundProduct/updateFundProduct";
			} else {
				fundProductServiceImpl.deletePorductPic(fundProductId, request);// 刪除原本照片
				String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉四個“-”
				String imageName = file.getOriginalFilename();// 獲取圖片名稱
				String ext = FilenameUtils.getExtension(imageName);// 獲取檔案的副檔名
				String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/images");// 設定圖片上傳路徑
				file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
				fundProduct.setFundProductPic("images/" + name + "." + ext);// 把圖片儲存路徑儲存到資料庫
				fundProductServiceImpl.updateFundProduct(fundProduct);
				return "redirect:/FindFundProject";
			}
		} else {
			if (fundProduct.getFundProductDetail().isEmpty()) {
				model.addAttribute("getFundProduct", fundProduct);
				model.addAttribute("fundProductId", fundProductId);
				model.addAttribute("errorDetail", "募資說明不可為空");
				return "FundProduct/updateFundProduct";
			} else {
				fundProductServiceImpl.updateFundProduct(fundProduct);
				return "redirect:/FindFundProject";
			}
		}
	}

	// 抓取單筆募資商品資料
	@RequestMapping(value = "/getUpdateFundProduct", method = RequestMethod.GET)
	public String findOneFundProductByFundProductId(HttpSession httpSession, Model model,
			@RequestParam(name = "fundProjectId") Integer fundProjectId) {
		FundSettle fundSettle = fundSettleServiceImpl.findFundSettleByFundProjectId(fundProjectId);

		// 建立日期
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd ");
		Calendar c = Calendar.getInstance(); // 日期加減

		Date beginDate = date;
		Date endDate = fundSettle.getFundSettleLdate(); // 抓出募資結束日期
		long diff = (endDate.getTime() - beginDate.getTime()) / (1000 * 60 * 60 * 24); // 日期相減轉成天數
		int day = new Long(diff).intValue();

		FundProduct fundProduct = fundProductServiceImpl.findUpdateFundProductByFundProjectId(fundProjectId);
		model.addAttribute("FundProductId", fundProduct.getFundProductId());
		model.addAttribute("FundProductName", fundProduct.getFundProductName());
		model.addAttribute("FundProductDetail", fundProduct.getFundProductDetail());
		model.addAttribute("FundProductPrice", fundProduct.getFundProductPrice());
		model.addAttribute("FundProductPic", fundProduct.getFundProductPic());
		model.addAttribute("FundProductPf", fundProduct.getFundProductPf());
		model.addAttribute("FundProductStatus", fundProduct.getFundProductStatus());

		model.addAttribute("LastDate", day);
		return "FundProduct/updateFundProduct";
	}

	// 查詢店家所有募資商品
	@RequestMapping(value = "/getAllFundProduct", method = RequestMethod.GET)
	public String findAllFundProductByFundProductId(HttpSession httpSession, Model model) {
		Store storeSession = (Store) httpSession.getAttribute("storeSession");// 取得Session的storeId
		Store getStore = storeServiceImpl.findStoreById(storeSession.getStoreId());
		System.out.println("getStore:" + getStore);
		if (getStore != null) {
			List<FundProduct> FundProduct = fundProductServiceImpl.findAllFundProductByStoreId(getStore.getStoreId());
			model.addAttribute("test", FundProduct);

			return "FundProduct/getAllFundProduct";
		} else {
			model.addAttribute("nologin", "請先登入 3秒後跳至首頁");
			return "MemberSystem/noLogin";
		}

	}

	/**
	 * @商品購買頁面用
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/getAllFundProductForCustomer", method = RequestMethod.GET)
	public String getAllProduct(Model model) {
		List<FundProduct> allFundProduct = fundProductServiceImpl.getAllProductService();
		Map allFundProductTotal = new HashMap();
		Map allLastDay = new HashMap();
		Map allRateGoal = new HashMap();

		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd ");
		Calendar c = Calendar.getInstance(); // 日期加減

		for (int i = 0; i < allFundProduct.size(); i++) {

			int fundProductid = allFundProduct.get(i).getFundProductId();
			int fundProjectId = allFundProduct.get(i).getFundProject().getFundProjectId();

			FundSettle fundSettle = fundSettleServiceImpl.findFundSettleByFundProjectId(fundProjectId);
			Date beginDate = date;
			Date endDate = fundSettle.getFundSettleLdate();
			long diff = (endDate.getTime() - beginDate.getTime()) / (1000 * 60 * 60 * 24); // 日期相減轉成天數
			int days = new Long(diff).intValue();
			System.out.println("day" + days);
			allLastDay.put(fundProductid, days);

			int fundProductTotal = allFundProduct.get(i).getFundProductPrice();

			List<FundOrder> fundOrder = fundOrderServiceImpl.findAllFundOrderByFundProductId(fundProductid);
			Double total = 0.0;
			for (int j = 0; j < fundOrder.size(); j++) {

				int price = fundOrder.get(j).getFundOrderTotal();
				total += price;
			}

			allFundProductTotal.put(fundProductid, total);

			Double goal = (Double) ((total / fundProductTotal) * 100);
			DecimalFormat df = new DecimalFormat("######0.00");
			String rateGoal = df.format(goal);
			Double.valueOf(rateGoal);

			allRateGoal.put(fundProductid, Double.valueOf(rateGoal));

			model.addAttribute("AllFundProductTotal", allFundProductTotal);
			model.addAttribute("AllLastDay", allLastDay);
			model.addAttribute("AllRateGoal", allRateGoal);
		}
		model.addAttribute("AllFundProduct", allFundProduct);
		return "FundProduct/AllFundProduct"; ///
	}

	/**
	 * @讀取單個商品 >>購買頁面
	 * @param httpSession
	 * @param model
	 * @param productId
	 * @return
	 */
	@RequestMapping(value = "/getFundProductDetail", method = RequestMethod.GET)
	public String getFundProductDetail(HttpSession httpSession, Model model,
			@RequestParam(name = "fundProductId") Integer fundProductId) {
		List<FundProduct> Items = fundProductServiceImpl.findFundProductDetailByFundProductId(fundProductId);
		FundProduct fundProduct = Items.get(0);
		int Items2 = (int) fundProductServiceImpl.getStoreService(fundProductId).get(0);
		Store store = storeServiceImpl.findStoreById(Items2);
		System.out.println("1212 = " + store.getStoreName());

		int fundProjectId = fundProduct.getFundProject().getFundProjectId();

		FundSettle fundSettle = fundSettleServiceImpl.findFundSettleByFundProjectId(fundProjectId);
		System.out.println("Deadline:" + fundSettle.getFundSettleLdate()); // 抓出募資結束日期

		// 建立日期
		Date date = new Date();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd ");
		Calendar c = Calendar.getInstance(); // 日期加減

		Date beginDate = date;
		Date endDate = fundSettle.getFundSettleLdate();
		long diff = (endDate.getTime() - beginDate.getTime()) / (1000 * 60 * 60 * 24); // 日期相減轉成天數
		int days = new Long(diff).intValue();
		System.out.println("day" + days);

		// 抓取募資金額
		List<FundOrder> fundOrder = fundOrderServiceImpl.findAllFundOrderByFundProductId(fundProductId);
		int total = 0;
		for (int i = 0; i < fundOrder.size(); i++) {
			int price = fundOrder.get(i).getFundOrderTotal();
			total += price;
		}

		List<FundMsg> AllMsg = fundMsgServiceImpl.listFindFundMsgByFundProductId(fundProductId);
		List<FundReply> AllFundReply = fundReplyServiceImpl.listFindFundReplyByFundProductId(fundProductId);
		model.addAttribute("MsgByFundProductId", AllMsg);
		model.addAttribute("allFundReply", AllFundReply);
		model.addAttribute("totalPrice", total);
		fundProgramServiceImpl.findAllFundProgramByFundProductId(fundProductId);
		List<FundProgram> allFundProgram = fundProgramServiceImpl.findAllFundProgramByFundProductId(fundProductId);
		model.addAttribute("AllFundProgram", allFundProgram);
		model.addAttribute("LastDay", days);
		model.addAttribute("orderSize", fundProduct.getFundOrders().size());
		model.addAttribute("fundProductDetail", fundProduct);
		model.addAttribute("store", store);
		return "FundProduct/FundProductDetail";
	}

	/**
	 * @新增募資商品時抓取募資提案資料
	 * @param httpSession
	 * @param model
	 * @param productId
	 * @return
	 */
	@RequestMapping(value = "/getAddFundProduct", method = RequestMethod.GET)
	public String getFundProjectDetail(HttpSession httpSession, Model model,
			@RequestParam(name = "fundProjectId") Integer fundProjectId) {
		List<FundProject> Items = fundProjecttServiceImpl.findUpdateFundProjectByfundProjectId(fundProjectId);
		FundProject fundProject = Items.get(0);
		model.addAttribute(fundProject);
		return "FundProduct/addFundProduct";
	}
	/**
	 * 模糊查詢商品
	 * @return
	 */
	@RequestMapping(value = "/findFundProductLike")
	public String findProductLike(@RequestParam(name = "Inquire")String Inquire,Model model) {
		List<FundProduct> listFundProduct = fundProductServiceImpl.findFundProductLike(Inquire);
		model.addAttribute("listFundProduct", listFundProduct);//回傳查詢結果至jsp
		model.addAttribute("Inquire", Inquire);//將原本輸入值回傳jsp
		return "FundProduct/AllFundProduct";	
	}

}
