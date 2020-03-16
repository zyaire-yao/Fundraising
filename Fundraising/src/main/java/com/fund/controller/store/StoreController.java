package com.fund.controller.store;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundMsg;
import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundReply;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.Msg;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.ProductReturn;
import com.fund.model.eneity.Reply;
import com.fund.model.eneity.Store;
import com.fund.model.fundOrder.service.IFundOrderService;
import com.fund.model.fundProduct.service.IFundProductService;
import com.fund.model.fundmsg.service.IFundMsgService;
import com.fund.model.fundproject.service.IFundProjectService;
import com.fund.model.fundreply.service.IFundReplyService;
import com.fund.model.msg.service.IMsgService;
import com.fund.model.order.service.IOrderService;
import com.fund.model.product.service.IProductService;
import com.fund.model.reply.service.IReplyService;
import com.fund.model.store.service.IStoreService;
import com.fund.util.Regular;

@Controller
public class StoreController {

	@Autowired
	private IStoreService storeServiceImpl;

	@Autowired
	private IProductService productServiceImpl;

	@Autowired
	private IFundProjectService fundProjectServiceImpl;

	@Autowired
	private IOrderService orderServiceImpl;

	@Autowired
	private IReplyService replyService;

	@Autowired
	private IFundProductService fundProductServiceImpl;

	@Autowired
	private IMsgService msgServiceImpl;

	@Autowired
	private IFundOrderService fundOrderServiceImpl;

	@Autowired
	private IFundMsgService fundMsgServiceImpl;

	@Autowired
	private IFundReplyService fundReplyServiceImpl;

	/**
	 * @controller 商家註冊
	 * @param store
	 * @param model
	 * @param file
	 * @param request
	 * @param httpSession
	 * @return MemberSystem/noLogin , Store/storeRegister ,Store/save , Store/error
	 */
	@RequestMapping(path = "/addStore")
	public String addStore(Store store, Model model, @RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, HttpSession httpSession) {
		try {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			Store storeSession = (Store) httpSession.getAttribute("storeSession");// 取得Session的storeId
			model.addAttribute("storeInput", store);// 如果輸入錯誤 將原本值返回頁面
			if (null == memberSession && null != storeSession) {// 如果有登入 且沒註冊過商家話
				return "MemberSystem/noLogin";
			} else if (store.getStoreName().isEmpty()) {
				model.addAttribute("errorName", "商家名不可為空白");
				return "Store/storeRegister";
			} else if (store.getStorePf().isEmpty()) {
				model.addAttribute("errorPf", "商家簡介不可為空白");
				return "Store/storeRegister";
			} else if (!store.getStoreTel().matches(Regular.STORETEL)) {
				model.addAttribute("errorTel", "商家電話格式錯誤");
				return "Store/storeRegister";
			} else if (!store.getStoreNumber().matches(Regular.STORENUMBER)) {
				model.addAttribute("errorNumber", "商家行號格式錯誤");
				return "Store/storeRegister";
			} else if (!store.getStoreAccount().matches(Regular.STOREACCOUNT)) {
				model.addAttribute("errorAccount", "商家帳號空白或格式錯誤");
				return "Store/storeRegister";
			} else if (!store.getStorePiName().matches(Regular.CHINESE) || store.getStorePiName().isEmpty()) {
				model.addAttribute("errorPiName", "負責人姓名格式錯誤");
				return "Store/storeRegister";
			} else if (!store.getStorePiTwid().matches(Regular.TWID)) {
				model.addAttribute("errorPiTwid", "負責人身分證格式錯誤");
				return "Store/storeRegister";
			} else if (!store.getStorePiTel().matches(Regular.PHONE)) {
				model.addAttribute("errorPiTel", "負責人手機格式錯誤");
				return "Store/storeRegister";
			} else if (store.getStorePiAddress().isEmpty()) {
				model.addAttribute("errorPiAddress", "負責人地址不可為空");
				return "Store/storeRegister";
			} else if (null != storeServiceImpl.findStoreByStoreName(store.getStoreName())) {// 檢查商家名稱是否註冊過
				model.addAttribute("errorRepeat", "商家名子重複");
				return "Store/storeRegister";
			} else if (3145728 < file.getBytes().length) {
				System.out.println("檔案超出大小限制3M");
				model.addAttribute("errorPicSize", "檔案超出大小限制3M");
				return "Store/storeRegister";
			} else {
				String pic = storeServiceImpl.addStorePic(file, request);// 圖片存檔
				if (!pic.equals("errorPic")) {// 圖片存取正常
					store.setStorePic(pic);// 設定圖片路徑
					String status = storeServiceImpl.addStore(store, httpSession);// 存入資料庫
					if (null == status) {
						Store newStore = storeServiceImpl.findStoreByStoreName(store.getStoreName());// 取出鋼註冊好的store
						httpSession.setAttribute("storeSession", newStore);// 將註冊好的Store 存入Session
						return "Store/save";// 註冊成功
					} else {
						return "MemberSystem/noLogin";
					}
				} else {
					model.addAttribute("errorPicFormat", "輸入圖片格式錯誤  請確認");
					return "Store/storeRegister";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("商家註冊系統Error");
			return "Store/error";
		}
	}

	/**
	 * @Controller 查詢店家資料 顯示資訊頁
	 * @param httpSession
	 * @param model
	 * @return Store/stInformation , MemberSystem/noLogin , Store/error
	 */
	@RequestMapping(path = "/findStore")
	public String findStore(HttpSession httpSession, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != storeSession && null != memberSession) {
				List<Product> AllItems = productServiceImpl.getAllProductService();
				model.addAttribute("All", AllItems);
				Store getstore = storeServiceImpl.findStoreById(storeSession.getStoreId());
				httpSession.setAttribute("storeSession", getstore);// 存入將更改後的Store存到Session
				model.addAttribute("getstore", getstore);
				// 查詢商家商品
				List<Product> ListProduct = productServiceImpl.listFindProductByStoreId(storeSession);
				model.addAttribute("All", ListProduct);
				// 查詢募資申請案件
				List<FundProject> projects = fundProjectServiceImpl.findFundProjectBystoreId(storeSession.getStoreId());
				model.addAttribute("test", projects);

				// 查詢商店OrderDetail明細
				List<OrderDetail> getOrderDetailByStoreId = orderServiceImpl
						.getOrderDetailByStoreId(storeSession.getStoreId());
				if (getOrderDetailByStoreId.size() != 0) {
					model.addAttribute("getOrderDetail", getOrderDetailByStoreId);
				} else {
					model.addAttribute("noItemsOrders", "尚未有訂單");
				}

				// 查詢募資贊助訂單內容
				List<FundOrder> getFundOrdersByMemberId = fundOrderServiceImpl
						.getFundOrdersByMemberId(memberSession.getMemberId());
				model.addAttribute("fundOrderList", getFundOrdersByMemberId);
				if (getFundOrdersByMemberId.size() == 0) {
					model.addAttribute("noFundOrder", "尚無贊助訂單");
				}

				// 商家查所有退貨資料
				List<ProductReturn> storeCheckReturn = orderServiceImpl
						.checkReturnApplication(storeSession.getStoreId());
				model.addAttribute("storeCheck", storeCheckReturn);
				if (storeCheckReturn.size() == 0) {
					model.addAttribute("noReturn", "尚無退貨資料");
				}

				// 回傳商家商品資訊
				Product getProduct = productServiceImpl.findProductByStoreId(storeSession);
				if (null != getProduct) {
					model.addAttribute("product", getProduct);
				}
				List<FundProduct> FundProduct = fundProductServiceImpl
						.findAllFundProductByStoreId(getstore.getStoreId());
				if (FundProduct != null) {
					model.addAttribute("AllFundProduct", FundProduct);
				}

				// 查詢商家全部商品留言
				List<Msg> getListMsg = msgServiceImpl.getMsgByStoreId(storeSession.getStoreId());
				model.addAttribute("getListMsg", getListMsg);

				// 查詢商家全部商品回覆
				List<Reply> listReply = replyService.findAllReply(getstore.getStoreId());
				model.addAttribute("listReply", listReply);

				return "StoreBackstage/storeinformation";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢店家資料顯示Error");
			return "Store/error";
		}
	}

	/**
	 * @Controller 查詢店家資料來進行update
	 * @param httpSession
	 * @param model
	 * @return Store/updateStore , MemberSystem/noLogin , Store/error
	 */
	@RequestMapping(path = "/findStoreToUpdate")
	public String findStoreToUpdate(HttpSession httpSession, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");
			if (null != storeSession) {
				Store getstore = storeServiceImpl.findStoreById(storeSession.getStoreId());
				model.addAttribute("getstore", getstore);
				return "Store/updateStore";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢店家資料更新Error");
			return "Store/error";
		}
	}

	/**
	 * @Controller 商成資料更新
	 * @param store
	 * @param httpSession
	 * @param model
	 * @param file
	 * @param request
	 * @return MemberSystem/noLogin , Store/updateStore , redirect:/findStore ,
	 *         Store/error
	 */
	@RequestMapping(path = "/updateStore")
	public String updateStore(Store store, HttpSession httpSession, Model model,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
		try {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			Store storeSession = (Store) httpSession.getAttribute("storeSession");// 取得Session的storeId
			model.addAttribute("storeInput", store);// 如果錯誤將原本值返回
			if (null == memberSession && null == storeSession) {// 如果有登入 且註冊過商家話
				System.out.println("未登入");
				return "MemberSystem/noLogin";
			} else if (store.getStoreName().isEmpty()) {
				model.addAttribute("errorName", "商家名不可為空白");
				return "redirect:/findStore";
			} else if (store.getStorePf().isEmpty()) {
				model.addAttribute("errorPf", "商家簡介不可為空白");
				return "redirect:/findStore";
			} else if (!store.getStoreTel().matches(Regular.STORETEL)) {
				model.addAttribute("errorTel", "商家電話格式錯誤");
				return "redirect:/findStore";
			} else if (!store.getStoreNumber().matches(Regular.STORENUMBER)) {
				model.addAttribute("errorNumber", "商家行號格式錯誤");
				return "redirect:/findStore";
			} else if (!store.getStoreAccount().matches(Regular.STOREACCOUNT)) {
				model.addAttribute("errorAccount", "商家帳號空白或格式錯誤");
				return "redirect:/findStore";
			} else if (!store.getStorePiName().matches(Regular.CHINESE)) {
				model.addAttribute("errorPiName", "負責人姓名格式錯誤");
				return "redirect:/findStore";
			} else if (!store.getStorePiTwid().matches(Regular.TWID)) {
				model.addAttribute("errorPiTwid", "負責人身分證格式錯誤");
				return "redirect:/findStore";
			} else if (!store.getStorePiTel().matches(Regular.PHONE)) {
				model.addAttribute("errorPiTel", "負責人手機格式錯誤");
				return "redirect:/findStore";
			} else if (store.getStorePiAddress().isEmpty()) {
				model.addAttribute("errorPiAddress", "負責人地址不可為空");
				return "redirect:/findStore";
			} else if (file.getBytes().length > 3145728) {
				System.out.println("檔案超出大小限制3M");
				model.addAttribute("errorPicSize", "檔案超出大小限制3M");
				return "redirect:/findStore";
			} else if (storeServiceImpl.findStoreByStoreName(store.getStoreName()) != null && !storeServiceImpl
					.findStoreById(storeSession.getStoreId()).getStoreName().equals(store.getStoreName())) {
				// 檢查商家名稱是否註冊過 當輸入名存在於資料庫 且跟原本資料庫存在的商家名稱不相同時
				model.addAttribute("errorRepeat", "商家名子重複");
				return "redirect:/findStore";
			} else if (!file.getOriginalFilename().isEmpty()) {// 如果有傳入檔案
				String fileType = file.getContentType(); // 獲得檔案型別
				if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {// 查看圖片資料類型
					storeServiceImpl.deleteStorePic(storeSession.getStoreId(), request);// 刪除原本照片
					String path = storeServiceImpl.addStorePic(file, request);// 新增照片
					store.setStorePic(path);// 把圖片儲存路徑儲存到資料庫
					storeServiceImpl.updateStore(store, httpSession);// 進行更新
				} else {
					model.addAttribute("errorPic", "照片格式錯誤");
					return "redirect:/findStore";
				}
			} else {
				storeServiceImpl.updateStore(store, httpSession);// 沒修改照片話直接更新
			}
			return "redirect:/findStore";// 更改成功
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("店家資料更新Error");
			return "Store/error";
		}
	}

	/**
	 * @Controller 查詢商家商品
	 * @param httpSession
	 * @param model
	 * @return
	 */
	@RequestMapping(path = "/ProductEdit")
	public String ProductEdit(HttpSession httpSession, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != storeSession && null != memberSession) {
				List<Product> AllItems = productServiceImpl.getAllProductService();
				model.addAttribute("All", AllItems);
				Store getstore = storeServiceImpl.findStoreById(storeSession.getStoreId());
				httpSession.setAttribute("storeSession", getstore);// 存入將更改後的Store存到Session
				model.addAttribute("getstore", getstore);
				// 查詢商家商品
				List<Product> ListProduct = productServiceImpl.listFindProductByStoreId(storeSession);
				model.addAttribute("All", ListProduct);

				return "StoreBackstage/productEdit";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢店家資料顯示Error");
			return "Store/error";
		}
	}

	/**
	 * @Controller 查詢商家商品留言
	 * @param httpSession
	 * @param model
	 * @return StoreBackstage/productMsg , MemberSystem/noLogin , Store/error
	 */
	@RequestMapping(path = "/ProductMsg")
	public String productMsg(HttpSession httpSession, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != storeSession && null != memberSession) {
				List<Product> AllItems = productServiceImpl.getAllProductService();
				model.addAttribute("All", AllItems);
				Store getstore = storeServiceImpl.findStoreById(storeSession.getStoreId());
				httpSession.setAttribute("storeSession", getstore);// 存入將更改後的Store存到Session
				model.addAttribute("getstore", getstore);

				// 查詢商家全部商品留言
				List<Msg> getListMsg = msgServiceImpl.getMsgByStoreId(storeSession.getStoreId());
				model.addAttribute("getListMsg", getListMsg);

				// 查詢商家全部商品回覆
				List<Reply> listReply = replyService.findAllReply(getstore.getStoreId());
				model.addAttribute("listReply", listReply);

				return "StoreBackstage/productMsg";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢商品留言顯示Error");
			return "Store/error";
		}
	}

	/**
	 * @Controller 查詢募資專案進度
	 * @param httpSession
	 * @param model
	 * @return
	 */
	@RequestMapping(path = "/FindFundProject")
	public String FindFundProject(HttpSession httpSession, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != storeSession && null != memberSession) {
				// 查詢募資申請案件
				List<FundProject> projects = fundProjectServiceImpl.findFundProjectBystoreId(storeSession.getStoreId());
				model.addAttribute("test", projects);

				return "StoreBackstage/findFundProject";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢店家資料顯示Error");
			return "Store/error";
		}
	}

	/**
	 * @Controller 查詢店家資料 顯示資訊頁
	 * @param httpSession
	 * @param model
	 * @return Store/stInformation , MemberSystem/noLogin , Store/error
	 */
	@RequestMapping(path = "/FindFundMsg")
	public String FindFundMsg(HttpSession httpSession, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != storeSession && null != memberSession) {
				Store getstore = storeServiceImpl.findStoreById(storeSession.getStoreId());
				httpSession.setAttribute("storeSession", getstore);// 存入將更改後的Store存到Session
				model.addAttribute("getstore", getstore);

				// 查詢商家全部募資留言
				List<FundMsg> getListFundMsg = fundMsgServiceImpl.findAllFundMsgByStoreId(storeSession.getStoreId());
				model.addAttribute("getListFundMsg", getListFundMsg);

				// 查詢商家全部募資回覆
				List<FundReply> listFundReply = fundReplyServiceImpl.findAllFundReplyByStoreId(getstore.getStoreId());
				model.addAttribute("listFundReply", listFundReply);

				return "StoreBackstage/findFundMsg";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢店家資料顯示Error");
			return "Store/error";
		}
	}

	/**
	 * @controller 查詢商家訂單直接顯示
	 * @param httpSession
	 * @param model
	 * @return
	 */
	@RequestMapping(path = "/findStoreOrder")
	public String findStoreOrder(HttpSession httpSession, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != storeSession && null != memberSession) {
				List<Product> AllItems = productServiceImpl.getAllProductService();
				model.addAttribute("All", AllItems);
				Store getstore = storeServiceImpl.findStoreById(storeSession.getStoreId());
				httpSession.setAttribute("storeSession", getstore);// 存入將更改後的Store存到Session
				model.addAttribute("getstore", getstore);

				// 查詢商店OrderDetail明細
				List<OrderDetail> getOrderDetailByStoreId = orderServiceImpl
						.getOrderDetailByStoreId(storeSession.getStoreId());
				if (getOrderDetailByStoreId.size() != 0) {
					model.addAttribute("getOrderDetail", getOrderDetailByStoreId);
				} else {
					model.addAttribute("noItemsOrders", "尚未有訂單");
				}

				return "StoreBackstage/orderinformation";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢店家資料顯示Error");
			return "Store/error";
		}
	}

	/**
	 * @Controller 查詢店家募資訂單
	 * @param httpSession
	 * @param model
	 * @return Store/stInformation , MemberSystem/noLogin , Store/error
	 */
	@RequestMapping(path = "/findStoreFundOrder")
	public String findStoreFundOrder(HttpSession httpSession, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != storeSession && null != memberSession) {
				List<Product> AllItems = productServiceImpl.getAllProductService();
				model.addAttribute("All", AllItems);
				Store getstore = storeServiceImpl.findStoreById(storeSession.getStoreId());
				httpSession.setAttribute("storeSession", getstore);// 存入將更改後的Store存到Session
				model.addAttribute("getstore", getstore);

				// 查詢募資贊助訂單內容
				List<FundOrder> getFundOrdersByStoreId = fundOrderServiceImpl
						.getFundOrdersByStoreId(storeSession.getStoreId());
				model.addAttribute("fundOrderList", getFundOrdersByStoreId);
				if (getFundOrdersByStoreId.size() == 0) {
					model.addAttribute("noFundOrder", "尚無贊助訂單");
				}
				return "StoreBackstage/fundOrderinformation";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢募資訂單資料顯示Error");
			return "Store/error";
		}
	}

	/**
	 * @Controller 查詢店家退貨資料 顯示資訊頁
	 * @param httpSession
	 * @param model
	 * @return Store/stInformation , MemberSystem/noLogin , Store/error
	 */
	@RequestMapping(path = "/findStoreReturn")
	public String findStoreReturn(HttpSession httpSession, Model model) {
		try {
			Store storeSession = (Store) httpSession.getAttribute("storeSession");
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != storeSession && null != memberSession) {
				List<Product> AllItems = productServiceImpl.getAllProductService();
				model.addAttribute("All", AllItems);
				Store getstore = storeServiceImpl.findStoreById(storeSession.getStoreId());
				httpSession.setAttribute("storeSession", getstore);// 存入將更改後的Store存到Session
				model.addAttribute("getstore", getstore);

				// 商家查所有退貨資料
				List<ProductReturn> storeCheckReturn = orderServiceImpl
						.checkReturnApplication(storeSession.getStoreId());
				model.addAttribute("storeCheck", storeCheckReturn);
				if (storeCheckReturn.size() == 0) {
					model.addAttribute("noReturn", "尚無退貨資料");
				}
				return "StoreBackstage/storeReturnAudit";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢店家退貨資料顯示Error");
			return "Store/error";
		}
	}
}
