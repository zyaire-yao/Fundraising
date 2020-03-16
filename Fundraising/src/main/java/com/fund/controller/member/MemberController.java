package com.fund.controller.member;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.Order;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.fundOrder.service.IFundOrderService;
import com.fund.model.member.service.IMemberService;
import com.fund.model.order.service.IOrderService;
import com.fund.sendEmail.MailUtil;
import com.fund.sendEmail.MailUtilByFindPwd;
import com.fund.util.MemberStatus;
import com.fund.util.Regular;

@Controller
//@SessionAttributes(value = {"memberSession","storeSession"})
public class MemberController {

	@Autowired
	private IMemberService memberServiceImpl;
	//if
	@Autowired
	private IOrderService orderServiceImpl;
	
	@Autowired
	private IFundOrderService fundOrderServiceImpl;


	/**
	 * @Controller登出
	 * @param httpSession
	 * @return
	 */
	@RequestMapping(value = "/outSystem")
	public String outSystem(HttpSession httpSession) {
		httpSession.removeAttribute("memberSession");//清除Session
		return "HomePage/homePage";
	}

	/**
	 * @controller 註冊功能
	 * @param member
	 * @param model
	 * @param confirmPwd
	 * @param file
	 * @param request
	 * @return MemberSystem/register , MemberSystem/save , MemberSystem/error
	 */
	@RequestMapping(value = "/registerMember", method = RequestMethod.POST)
	public String registerMember(Member member, Model model,
			@RequestParam(value = "confirmPwd", required = false) String confirmPwd,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
		try {
			model.addAttribute("inputMember", member);// 如果輸入錯誤 原本輸入的值導回
			if (!member.getMemberEmail().matches(Regular.EMAIL)) {
				System.out.println("Email格式錯誤");
				model.addAttribute("errorEmail", "Email輸入格式錯誤");
				return "MemberSystem/register";
			} else if (!member.getMemberPwd().matches(Regular.PASSWORD)) {
				System.out.println("密碼輸入格式錯誤");
				model.addAttribute("errorPwd", "密碼輸入格式錯誤");
				return "MemberSystem/register";
			} else if (!member.getMemberTwid().matches(Regular.TWID)) {
				System.out.println("身分證輸入格式錯誤");
				model.addAttribute("errorTwid", "身分證輸入格式錯誤");
				return "MemberSystem/register";
			} else if (!member.getMemberFname().matches(Regular.CHINESE)) {
				System.out.println("姓名輸入格式錯誤");
				model.addAttribute("errorFname", "姓名輸入格式錯誤");
				return "MemberSystem/register";
			} else if (member.getMemberSname().isEmpty()) {
				System.out.println("暱稱輸入格式錯誤");
				model.addAttribute("errorSname", "暱稱輸入格式錯誤");
				return "MemberSystem/register";
			} else if (member.getMemberHb().isEmpty()) {
				System.out.println("生日輸入格式錯誤");
				model.addAttribute("errorHb", "生日輸入格式錯誤");
				return "MemberSystem/register";
			} else if (!member.getMemberCel().matches(Regular.PHONE)) {
				System.out.println("手機輸入格式錯誤");
				model.addAttribute("errorCel", "手機輸入格式錯誤");
				return "MemberSystem/register";
			} else if (!confirmPwd.equals(member.getMemberPwd())) {
				System.out.println("兩次密碼輸入不符合");
				model.addAttribute("errorPwd2", "兩次密碼輸入不符合");
				return "MemberSystem/register";
			} else if (file.getBytes().length > 3145728) {
				System.out.println("檔案超出大小限制3M");
				model.addAttribute("errorPicSize", "檔案超出大小限制3M");
				return "MemberSystem/updateMember";
			}
			Member getMember = memberServiceImpl.findMemberByEmail(member.getMemberEmail());
			if (null == getMember) {// 如果帳號不存在就可以註冊
				String pic = memberServiceImpl.addMemberPic(file, request);// 圖片存檔
				if (!pic.equals("errorPic")) {// 圖片存取正常
					member.setMemberPic(pic);// 設定圖片路徑
					String code = memberServiceImpl.randomCode();// 產生亂數驗證碼
					member.setMemberCode(code);// 將驗證亂數存入
					memberServiceImpl.addMember(member);// 存入資料庫
					MailUtil mail = new MailUtil(member.getMemberId(), member.getMemberEmail(), code);// 寄認證信
					mail.run();// 寄認證信
					return "MemberSystem/save";// 註冊成功
				} else {
					model.addAttribute("errorPic", "輸入圖片格式錯誤  請確認");
					return "MemberSystem/register";
				}
			} else {
				List<String> newAccount = memberServiceImpl.suggestAccount(member);// 產生建議帳號
				model.addAttribute("errorAccount", newAccount);
				System.out.println("帳號已註冊   以下提供參考" + newAccount);
				return "MemberSystem/register";// 帳號已註冊
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("註冊系統Error");
			return "MemberSystem/error";
		}
	}

	/**
	 * 登入功能
	 * @param member
	 * @param model
	 * @param httpSession
	 * @return //
	 */
	@RequestMapping(value = "/loginMember", method = RequestMethod.POST)
	public String loginMember(@RequestParam(value = "memberEmail")String memberEmailInput, 
			@RequestParam(value = "memberPwd")String memberPwdInput,
			Model model, HttpSession httpSession) {
		try {
			if (!memberEmailInput.matches(Regular.EMAIL)) {
				model.addAttribute("errorEmail", "帳號格式錯誤");
				return "MemberSystem/loginSystem";
			} else if (!memberPwdInput.matches(Regular.PASSWORD)) {
				model.addAttribute("errorPwd", "密碼格式錯誤");
				return "MemberSystem/loginSystem";
			} else {
				String pwdMD5Input = DigestUtils.md5DigestAsHex(memberPwdInput.getBytes());// md5加密以便跟資料庫對比
				Member getmember = memberServiceImpl.findMemberByEmallAndPwd(memberEmailInput,pwdMD5Input);// 找尋帳號
				if (null == getmember) {// 如果帳號或密碼錯誤
					model.addAttribute("errorAccount", "登入失敗 帳號或密碼錯誤");
					return "MemberSystem/loginSystem";
				} else if (MemberStatus.NONACTIVATED.equals(getmember.getMemberStatus())) {
					model.addAttribute("errorStatus1", "登入失敗 尚未開通");
					return "MemberSystem/loginSystem";
				} else if (MemberStatus.BLOCKADE.equals(getmember.getMemberStatus())) {
					model.addAttribute("errorStatus2", "登入失敗 帳號封鎖");
					return "MemberSystem/loginSystem";
				} else {
						httpSession.setAttribute("memberSession", getmember);// getmember 存入Session
						memberServiceImpl.addStoreSession(getmember, httpSession);// StoreId 存入Session
						return "HomePage/homePage";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("登入系統Error");
			return "MemberSystem/error";
		}
	}

	/**
	 * @controller 取得會員資料來進行updata
	 * @param httpSession
	 * @param model
	 * @return MemberSystem/updateMember , MemberSystem/noLogin , MemberSystem/error
	 */
	@RequestMapping(value = "/findMemberToUpdate", method = RequestMethod.GET)
	public String findMemberToUpdate(HttpSession httpSession, Model model) {
		try {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != memberSession) {// 如果memberSession存在
				Member member = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());// 查資料庫會員資料
				model.addAttribute("getMember", member);// 回傳值到頁面
				return "MemberSystem/updateMember";// 回到update主要業面
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("取會員資料進行updataError");
			return "MemberSystem/error";
		}
	}

	/**
	 * @controller 更新資料
	 * @param httpSession
	 * @param member
	 * @param model
	 * @param file
	 * @param request
	 * @return MemberSystem/noLogin , MemberSystem/updateMember ,
	 *         redirect:/findMember ,MemberSystem/error
	 */
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(HttpSession httpSession, Member member, Model model,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request) {
		try {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			model.addAttribute("memberInput", member);// 輸入錯誤將輸入的直傳回
			if ( null == memberSession) {
				System.out.println("未登入");
				return "MemberSystem/noLogin";
			} else if (!member.getMemberTwid().matches(Regular.TWID)) {
				System.out.println("身分證字號格式錯誤");
				model.addAttribute("errorTwId", "身份證字號格是錯誤");
				return "redirect:/findMember";
			} else if (member.getMemberFname().isEmpty()) {
				System.out.println("姓名輸入格式錯誤");
				model.addAttribute("errorFname", "姓名輸入格式錯誤");
				return "redirect:/findMember";
			} else if (member.getMemberSname().isEmpty()) {
				System.out.println("暱稱輸入格式錯誤");
				model.addAttribute("errorSname", "暱稱輸入格式錯誤");
				return "redirect:/findMember";
			} else if (member.getMemberHb().isEmpty()) {
				System.out.println("生日輸入格式錯誤");
				model.addAttribute("errorHb", "生日輸入格式錯誤");
				return "redirect:/findMember";
			} else if (!member.getMemberCel().matches(Regular.PHONE)) {
				System.out.println("手機號碼格式錯誤");
				model.addAttribute("errorCel", "手機號碼格式錯誤");
				return "redirect:/findMember";
			} else if (file.getBytes().length > 3145728) {
				System.out.println("檔案超出大小限制3M");
				model.addAttribute("errorPicSize", "檔案超出大小限制3M");
				return "redirect:/findMember";
			} else if (!file.getOriginalFilename().isEmpty()) {// 檢驗看圖檔是否有上傳}
				String fileType = file.getContentType(); // 獲得檔案型別
				if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {// 查看圖片資料類型
					memberServiceImpl.deleteMemberPic(memberSession.getMemberId(), request);// 刪除原本照片
					String path = memberServiceImpl.addMemberPic(file, request);// 新增照片
					member.setMemberPic(path);// 把圖片儲存路徑儲存到資料庫
					memberServiceImpl.updateMember(member);// 進行更新
				} else {
					System.out.println("輸入圖片格式錯誤");
					model.addAttribute("errorPic", "輸入圖片格式錯誤");
					return "redirect:/findMember";
				}
			} else {
				memberServiceImpl.updateMember(member);// 沒修改照片話直接更新
			}
			return "redirect:/findMember";// 更新完成後 返回getMember 方法 導回會員查詢頁面
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("更新資料Error");
			return "MemberSystem/error";
		}
	}

	/**
	 * @controller 查詢會員資料直接顯示
	 * @param httpSession
	 * @param model
	 * @return MemberBackstage/memberinformation , MemberSystem/noLogin ,
	 *         MemberSystem/error
	 */
	@RequestMapping(value = "/findMember", method = RequestMethod.GET)
	public String findMember(HttpSession httpSession, Model model) {
		try {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != memberSession) {// 如果Session不存在
				Member getmember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
				httpSession.setAttribute("memberSession", getmember);// 將更改後memberInformation Session放入
				memberServiceImpl.addStoreSession(getmember, httpSession);// StoreId 存入Session
				model.addAttribute("getMember", getmember);// 將值傳到頁面				
				
				return "MemberBackstage/memberinformation";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢會員資料Error");
			return "MemberSystem/error";
		}
	}
	
	/**
	 * @controller 查詢會員訂單直接顯示
	 * @param httpSession
	 * @param model
	 * @return MemberBackstage/memberOrderinformation , MemberSystem/noLogin ,
	 *         MemberSystem/error
	 */
	@RequestMapping(value = "/findMemberOrder", method = RequestMethod.GET)
	public String findMemberOrder(HttpSession httpSession, Model model) {
		try {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != memberSession) {// 如果Session不存在
				Member getmember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
				httpSession.setAttribute("memberSession", getmember);// 將更改後memberInformation Session放入
				memberServiceImpl.addStoreSession(getmember, httpSession);// StoreId 存入Session
				model.addAttribute("getMember", getmember);// 將值傳到頁面
				
                //查詢訂單內容
				Map allmap = orderServiceImpl.findOrder(getmember);
				List<Order> listOrder = (List) allmap.get("listOrder");
				List<OrderDetail> listOrderDetail = (List) allmap.get("listOrderDetail");
				model.addAttribute("listOrder", listOrder);
				model.addAttribute("listOrderdetail", listOrderDetail);

				
				return "MemberBackstage/memberOrderinformation";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢會員訂單資料Error");
			return "MemberSystem/error";
		}
	}
	
	/**
	 * @controller 查詢會員募資訂單直接顯示
	 * @param httpSession
	 * @param model
	 * @return MemberBackstage/memberOrderinformation , MemberSystem/noLogin ,
	 *         MemberSystem/error
	 */
	@RequestMapping(value = "/findMemberFundOrder", method = RequestMethod.GET)
	public String findMemberFundOrder(HttpSession httpSession, Model model) {
		try {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
			if (null != memberSession) {// 如果Session不存在
				Member getmember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
				httpSession.setAttribute("memberSession", getmember);// 將更改後memberInformation Session放入
				memberServiceImpl.addStoreSession(getmember, httpSession);// StoreId 存入Session
				model.addAttribute("getMember", getmember);// 將值傳到頁面
				
				 // 查詢募資贊助訂單內容
			    List<FundOrder> getFundOrdersByMemberId = fundOrderServiceImpl.getFundOrdersByMemberId(memberSession.getMemberId());
			    model.addAttribute("fundOrderList", getFundOrdersByMemberId);

				
				return "MemberBackstage/memberFundOrderinformation";
			} else {
				return "MemberSystem/noLogin";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查詢會員訂單資料Error");
			return "MemberSystem/error";
		}
	}

	/**
	 * @controller 更改密碼
	 * @param httpSession
	 * @param model
	 * @param oldPwd
	 * @param newPwd1
	 * @param newPwd2
	 * @return MemberSystem/updatePwd , MemberSystem/noLoginToUpdatePwd ,MemberSystem/error
	 */
	@RequestMapping(value = "/updatePwd", method = RequestMethod.POST)
	public String updatePwd(HttpSession httpSession, Model model, @RequestParam(name = "oldPwd") String oldPwd,
			@RequestParam(name = "newPwd1") String newPwd1, @RequestParam(name = "newPwd2") String newPwd2) {
		try {
			Member memberSession = (Member) httpSession.getAttribute("memberSession");
			if (null == memberSession) {
				System.out.println("無MemberSession 重新登入");
				return "MemberSystem/noLogin";
			} else if (!oldPwd.matches(Regular.PASSWORD)) {
				System.out.println("密碼格式錯誤");
				model.addAttribute("errorOldPwd", "密碼格式錯誤");
				return "MemberSystem/updatePwd";
			} else if (!newPwd1.matches(Regular.PASSWORD)) {
				System.out.println("新密碼格式錯誤");
				model.addAttribute("errorNewPwd1", "新密碼格式錯誤");
				return "MemberSystem/updatePwd";
			} else if (!newPwd1.equals(newPwd2)) {
				System.out.println("新密碼兩次輸入不符合");
				model.addAttribute("errorNewPwd2", "新密碼兩次輸入不符合");
				return "MemberSystem/updatePwd";
			} else {
				String pwd = DigestUtils.md5DigestAsHex(oldPwd.getBytes());// 將舊密碼加密 取出核對
				Member getMember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());// 取出Member資料
				if (getMember.getMemberPwd().equals(pwd)) {// 如果核對成功
					String newPwd = DigestUtils.md5DigestAsHex(newPwd1.getBytes());// 將新密碼加密
					memberServiceImpl.updatePwdByMemberId(newPwd, getMember.getMemberId());// 新密碼存入資料庫
					httpSession.removeAttribute("memberSession");// 移除memberSession 來重新登入
					return "MemberSystem/noLoginToUpdatePwd";
				} else {
					System.out.println("密碼錯誤");
					model.addAttribute("errorPwd", "密碼錯誤");
					return "MemberSystem/updatePwd";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("修改密碼Error");
			return "MemberSystem/error";
		}
	}

	/**
	 * @Controller忘記密碼
	 * @param model
	 * @param memberId
	 * @param newPwd1
	 * @param newPwd2
	 * @return
	 */
	@RequestMapping(value = "/updatePwdByEmail", method = RequestMethod.POST)
	public String updatePwdByEmail(Model model, @RequestParam(name = "memberId") Integer memberId,
			@RequestParam(name = "newPwd1") String newPwd1, @RequestParam(name = "newPwd2") String newPwd2) {
		try {

			if (!newPwd1.matches(Regular.PASSWORD)) {
				System.out.println("新密碼格式錯誤");
				model.addAttribute("errorNewPwd1", "新密碼格式錯誤");
				return "MemberSystem/updateFindPwd";
			} else if (!newPwd1.equals(newPwd2)) {
				System.out.println("新密碼兩次輸入不符合");
				model.addAttribute("errorNewPwd2", "新密碼兩次輸入不符合");
				return "MemberSystem/updateFindPwd";
			} else {
				Member getMember = memberServiceImpl.findMemberByMemberId(memberId);// 取出Member資料
				String newPwd = DigestUtils.md5DigestAsHex(newPwd1.getBytes());// 將新密碼加密
				memberServiceImpl.updatePwdByMemberId(newPwd, getMember.getMemberId());// 新密碼存入資料庫
				return "MemberSystem/noLoginToUpdatePwd";
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("修改密碼Error");
			return "MemberSystem/error";
		}
	}

	/**
	 * @Controller核對認證信
	 * @param id
	 * @param code
	 * @return MemberSystem/emailChick , MemberSystem/error
	 */
	@RequestMapping(value = "/checkEmail")
	public String checkEmail(Integer id, String code) {
		try {
			Member getMember = memberServiceImpl.findMemberByMemberId(id); // mail傳回的id來查詢member
			if (getMember.getMemberCode().equals(code)) {// 如果驗證碼跟mail的驗證碼相同
				memberServiceImpl.updateStatusByMemberId(id);// 傳至Service來變更狀態 為正常
				return "MemberSystem/emailChick";
			} else {
				return "MemberSystem/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "MemberSystem/error";
		}
	}

	/**
	 * @Controller查詢密碼
	 * @param memberEmail
	 * @param model
	 * @param memberTwId
	 * @return
	 */
	@RequestMapping(value = "/findPwdByEmail", method = RequestMethod.POST)
	public String findPwdByEmail(@RequestParam(name = "memberEmail") String memberEmail, Model model,
			@RequestParam(name = "memberTwId") String memberTwId) {
		Member getMember = memberServiceImpl.findMemberByEmail(memberEmail);//查詢memberEmail
		if ( null != getMember) {//如果Email存在
			if (getMember.getMemberTwid().equals(memberTwId)) {//如果身份證字號一樣	
				MailUtilByFindPwd mail = new MailUtilByFindPwd(memberEmail,getMember.getMemberCode());//呼叫mail
				mail.run();//寄出Email 
				model.addAttribute("success", 
						  "<h3 style='color:green'>請至信箱收取變更密碼信件</h3>"
						+ "<h3 style='color:green;display: inline;'>請在</h3>"
						+ "<h3 style='color:red;display: inline;'>一分鐘</h3>"
						+ "<h3 style='color:green;display: inline;'>內啟用</h3>"
						+ "<h3 style='color:green'>如未收到請在申請</h3>");
				return "MemberSystem/findPwd";
			} else {
				model.addAttribute("errorTwid", "身份確認錯誤");
				return "MemberSystem/findPwd";
			}
		} else {
			model.addAttribute("errorEmail", "帳號不存在");
			return "MemberSystem/findPwd";
		}
	}

	/**
	 * @Controller忘記密碼核對Email
	 * @param memberEmail
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/findMemberByEmail")
	public String findMemberByEmail(@RequestParam(value = "memberEmail", required = false) String memberEmail,
			@RequestParam(value = "time", required = false) Long time,
			@RequestParam(value = "code", required = false) String code
			,Model model) {
		if ((new Date().getTime() / 60000) - (time / 60000) > 1) {//如果時間大於一分鐘
			System.out.println("時間超過限制 = " + ((new Date().getTime() / 60000) - (time / 60000)));
			return "MemberSystem/errorEmailTimeOut";
		} else {
			Member getMember = memberServiceImpl.findMemberByEmail(memberEmail);
			if(getMember.getMemberCode().equals(code)) {
				model.addAttribute("getMember", getMember);
			return "MemberSystem/updateFindPwd";//回傳至更改密碼頁面
			}else {
				return "MemberSystem/errorEmailNoMember";
			}		
		}
	}
	

}
