package com.fund.controller.member;

import java.util.List;

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

import com.fund.model.Member;
import com.fund.model.member.service.MemberServiceImpl;
import com.fund.util.Regular;

@Controller
//@SessionAttributes(value = {"memberSession","storeSession"})
public class MemberController {

	@Autowired
	private MemberServiceImpl memberServiceImpl;

	/**
	 * @controller 註冊功能
	 */
	@RequestMapping(value = "registerMember", method = RequestMethod.POST)
	public String registerMember(Member member, Model model,
			@RequestParam(value = "confirmPwd", required = false) String confirmPwd,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request)
			throws Exception {
		model.addAttribute("inputMember", member);// 如果輸入錯誤 原本輸入的值導回
		if (!member.getMemberEmail().matches(Regular.EMAIL)) {//正則開始
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
		} else if (member.getMemberFname().isEmpty()) {
			System.out.println("姓名輸入格式錯誤");
			model.addAttribute("errorFname", "姓名輸入格式錯誤");
			return "MemberSystem/register";
		} else if (member.getMemberSname().isEmpty()) {
			System.out.println("暱稱輸入格式錯誤");
			model.addAttribute("errorSname", "暱稱輸入格式錯誤");
			return "MemberSystem/register";
		} else if (member.getMemberGd().isEmpty()) {
			System.out.println("性別輸入格式錯誤");
			model.addAttribute("errorGd", "性別輸入格式錯誤");
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
		}                                                       //正則結束
		Member getMember = memberServiceImpl.findMemberByEmail(member.getMemberEmail());
		if (getMember == null) {// 如果帳號不存在就可以註冊
			String pic = memberServiceImpl.addMemberPic(file, request);// 圖片存檔
			if (!pic.equals("errorPic")) {// 圖片存取正常
				member.setMemberPic(pic);// 設定圖片路徑
				memberServiceImpl.addMember(member);// 存入資料庫
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
	}

	/**
	 * @controller 登入功能
	 */
	@RequestMapping(value = "/loginMember", method = RequestMethod.POST)
	public String loginMember(Member member, Model model, HttpSession httpSession) {
		String memberEmail = member.getMemberEmail();
		String pwd = DigestUtils.md5DigestAsHex(member.getMemberPwd().getBytes());// md5加密以便跟資料庫對比
		if (!memberEmail.matches(Regular.EMAIL)) {
			System.out.println("登入失敗 帳號格式錯誤 ");
			model.addAttribute("errorEmail", "帳號格式錯誤");
			return "MemberSystem/loginSystem";
		} else if (!member.getMemberPwd().matches(Regular.PASSWORD)) {
			System.out.println("登入失敗 密碼格式錯誤 ");
			model.addAttribute("errorPwd", "密碼格式錯誤");
			return "MemberSystem/loginSystem";
		} else {
			Member getmember = memberServiceImpl.findMemberByEmail(memberEmail);// 找尋帳號
			if (getmember != null) {// 如果帳號存在
				String rpwd = getmember.getMemberPwd();
				if (pwd.equals(rpwd)) {
					httpSession.setAttribute("memberSession", getmember);// getmember 存入Session
					memberServiceImpl.addStoreSession(getmember, httpSession);// StoreId 存入Session
					System.out.println("登入成功 ");
					return "home";
				} else {
					System.out.println("登入失敗 密碼錯誤 ");
					model.addAttribute("errorNoPwd", "登入失敗 密碼錯誤");
					return "MemberSystem/loginSystem";
				}
			} else {
				System.out.println("登入失敗  無此帳號");
				model.addAttribute("errorAccount", "登入失敗 無此帳號");
				return "MemberSystem/loginSystem";
			}
		}
	}

	/**
	 * @controller 取得會員資料來進行updata
	 */
	@RequestMapping(value = "/findMemberToUpdate", method = RequestMethod.GET)
	public String findMemberToUpdate(HttpSession httpSession, Model model) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
		if (memberSession != null) {
			Member member = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());// 查資料庫會員資料
			model.addAttribute("getMember", member);
			return "MemberSystem/updateMember";
		} else {
			model.addAttribute("nologin", "請先登入 3秒後跳至首頁");
			return "MemberSystem/noLogin";
		}
	}

	/**
	 * @controller 更新資料
	 */
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.POST)
	public String memberUpdate(HttpSession httpSession, Member member, Model model,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request)
			throws Exception {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
		model.addAttribute("memberInput", member);// 輸入錯誤將輸入的直傳回
		if (memberSession == null) {
			System.out.println("未登入");
			return "MemberSystem/noLogin";
		} else if (!member.getMemberTwid().matches(Regular.TWID)) {
			System.out.println("身分證字號格式錯誤");
			model.addAttribute("errorTwId", "身份證字號格是錯誤");
			return "MemberSystem/updateMember";
		} else if (member.getMemberFname().isEmpty()) {
			System.out.println("姓名輸入格式錯誤");
			model.addAttribute("errorFname", "姓名輸入格式錯誤");
			return "MemberSystem/updateMember";
		} else if (member.getMemberSname().isEmpty()) {
			System.out.println("暱稱輸入格式錯誤");
			model.addAttribute("errorSname", "暱稱輸入格式錯誤");
			return "MemberSystem/updateMember";
		} else if (member.getMemberGd().isEmpty()) {
			System.out.println("性別輸入格式錯誤");
			model.addAttribute("errorGd", "性別輸入格式錯誤");
			return "MemberSystem/updateMember";
		} else if (member.getMemberHb().isEmpty()) {
			System.out.println("生日輸入格式錯誤");
			model.addAttribute("errorHb", "生日輸入格式錯誤");
			return "MemberSystem/updateMember";
		} else if (!member.getMemberCel().matches(Regular.PHONE)) {
			System.out.println("手機號碼格式錯誤");
			model.addAttribute("errorCel", "手機號碼格式錯誤");
			return "MemberSystem/updateMember";
		} else if (!file.getOriginalFilename().isEmpty()) {// 檢驗看圖檔是否有上傳
			String fileType = file.getContentType(); // 獲得檔案型別
			if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {// 查看圖片資料類型
				memberServiceImpl.deleteMemberPic(memberSession.getMemberId(), request);// 刪除原本照片
				String path = memberServiceImpl.addMemberPic(file, request);// 新增照片
				member.setMemberPic(path);// 把圖片儲存路徑儲存到資料庫
				memberServiceImpl.updateMember(member);// 進行更新
			} else {
				System.out.println("輸入圖片格式錯誤");
				model.addAttribute("errorPic", "輸入圖片格式錯誤");
				return "MemberSystem/updateMember";
			}
		} else {
			memberServiceImpl.updateMember(member);// 沒修改照片話直接更新
		}
		return "redirect:/findMember";// 更新完成後 返回getMember 方法 導回會員查詢頁面
	}

	/**
	 * @controller 查詢會員資料直接顯示
	 */
	@RequestMapping(value = "/findMember", method = RequestMethod.GET)
	public String findMember(HttpSession httpSession, Model model) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
		if (memberSession != null) {
			Member member = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
			httpSession.setAttribute("memberSession", member);// 將更改後memberInformation Session放入
			memberServiceImpl.addStoreSession(member, httpSession);// StoreId 存入Session
			model.addAttribute("getMember", member);
			return "MemberSystem/mbInformation";
		} else {
			model.addAttribute("nologin", "請先登入 3秒後跳至首頁");
			return "MemberSystem/noLogin";
		}
	}
	
	
	/**
	 *@修改密碼
	 */
	@RequestMapping(value = "/updatePwd" , method = RequestMethod.POST)
    public String updatePwd(HttpSession httpSession,Model model,@RequestParam(name = "oldPwd")String oldPwd,
    		@RequestParam(name="newPwd1")String newPwd1,@RequestParam(name ="newPwd2")String newPwd2) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");
    	if(memberSession==null) {
    		System.out.println("無MemberSession 重新登入");
    		return "MemberSystem/noLogin";
    	}else if(!oldPwd.matches(Regular.PASSWORD)) {
    		System.out.println("密碼格式錯誤");
    		model.addAttribute("errorOldPwd", "密碼格式錯誤");
    		return "MemberSystem/updatePwd";
    	}else if(!newPwd1.matches(Regular.PASSWORD)) {
    		System.out.println("新密碼格式錯誤");
    		model.addAttribute("errorNewPwd1", "新密碼格式錯誤");
    		return "MemberSystem/updatePwd";
    	}else if(!newPwd1.equals(newPwd2)) {
    		System.out.println("新密碼兩次輸入不符合");
    		model.addAttribute("errorNewPwd2", "新密碼兩次輸入不符合");
    		return "MemberSystem/updatePwd";
    	}else {
    		String pwd = DigestUtils.md5DigestAsHex(oldPwd.getBytes());//MD5加密
    		Member getMember = memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());//重新找尋資料庫取得Member
    		if(getMember.getMemberPwd().equals(pwd)) {//如果密碼相同
    			String newPwd = DigestUtils.md5DigestAsHex(newPwd1.getBytes());//將新密碼加密
    			memberServiceImpl.updatePwdByMemberId(newPwd, getMember.getMemberId());//更改密碼
    			httpSession.removeAttribute("memberSession");//移除memberSession
    			return "MemberSystem/noLoginToUpdatePwd";//要求使用者重新登入
    		}else {
    			System.out.println("密碼錯誤");
        		model.addAttribute("errorPwd", "密碼錯誤");
        		return "MemberSystem/updatePwd";
    		}
    	}
    }
	
	
	
	
	
	
	
	
}
