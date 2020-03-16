package com.fund.model.member.service;

import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Store;
import com.fund.model.member.dao.IMemberDao;
import com.fund.model.member.dao.MemberDaoImpl;
import com.fund.util.MemberStatus;

@Service
public class MemberServiceImpl implements IMemberService {


	@Autowired
	private IMemberDao memberDaoImpl;

	@Autowired
	private SessionFactory sessionFactory;

	// 獲取跟當前線程綁定的session
	private Session getSession() {
		return sessionFactory.getCurrentSession();
//		return sessionFactory.openSession();
	}
	

	/**
	 * @Service 註冊帳號時 設定帳號狀態
	 */
	@Override
	public void addMember(Member member) {
		if (null != member) {
			member.setMemberStatus(MemberStatus.NONACTIVATED);//設定帳號狀態為未開通
			String md5Password = DigestUtils.md5DigestAsHex(member.getMemberPwd().getBytes());// md5加密
			member.setMemberPwd(md5Password);
			memberDaoImpl.addMember(member);
		}
	}

	/**
	 * @Service 更新帳號資料
	 */
	@Override
	public void updateMember(Member member) {
		try {
			memberDaoImpl.updateMember(member);
		} catch (Exception e) {
			System.out.println("update 失敗 -Service");
			e.printStackTrace();
		}
	}
	
	/**
	 * 用Email及Pwd來查會員_登入用
	 * @param memberEmailInput
	 * @param pwdMD5Input
	 * @return
	 */
	@Override
	public Member findMemberByEmallAndPwd(String memberEmailInput,String pwdMD5Input) {
    	return memberDaoImpl.findMemberByEmallAndPwd(memberEmailInput, pwdMD5Input);
    }

	/**
	 *  取得會員資料listByEmail
	 */
	@Override
	public Member findMemberByEmail(String memberEmail) {
		Member getmember = memberDaoImpl.findMemberByEmail(memberEmail);
		return getmember;
	}

	/**
	 * 取得會員資料 Member
	 * 
	 * @param memberId
	 * @return
	 */
	@Override
	public Member findMemberByMemberId(Integer memberId) {
		return memberDaoImpl.findMemberByMemberId(memberId);
	}

	/**
	 * @Service 取得商店資料
	 */
	@Override
	public Store findStoreByMemberId(Integer memberId) {
		Store getStore = memberDaoImpl.findStoreByMemberId(memberId);
		return getStore;
	}

	/**
	 * @Servic 存入照片
	 * @param file
	 * @param request
	 * @return
	 */
	@Override
	public String addMemberPic(MultipartFile file, HttpServletRequest request) {
			if (!file.getOriginalFilename().isEmpty()) {
				String fileType = file.getContentType(); // 獲得檔案型別
				if (fileType.equals("image/jpeg") || fileType.equals("image/gif")) {
					String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉“-”
					String ext = FilenameUtils.getExtension(file.getOriginalFilename());// 獲取檔案的副檔名
					String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/images/memberPic");// 設定圖片上傳路徑
					try {
						file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
					} catch (Exception e) {
						e.printStackTrace();
					}
					String path = "images/memberPic/" + name + "." + ext;// 把圖片儲存路徑儲存到資料庫
					return path;
				} else {
					String errorPic = "errorPic";
					return errorPic;
				}
			} else {// 如果沒有傳圖片 存預設圖片路徑
				String presetPic = "images/memberPic/T1213121.jpg";
				return presetPic;
			}
		

	}

	/**
	 * @Service 刪除照片
	 */
	@Override
	public boolean deleteMemberPic(Integer memberId, HttpServletRequest request) {
		Member member = memberDaoImpl.findMemberByMemberId(memberId);
		String memberpic = member.getMemberPic();
		if (!memberpic.equals("images/memberPic/T1213121.jpg")) {
			String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/");
			String fileName = filePath + memberpic;
			File file = new File(fileName);
			if (file.isFile() && file.exists()) {
				file.delete();// "刪除單個檔案"+name+"成功！"
				return true;
			} // "刪除單個檔案"+name+"失敗！"
			return false;
		}
		return true;
	}

	/**
	 * @Service 製造建議帳號
	 */
	@Override
	public List<String> suggestAccount(Member member) {
		List<String> listNewAccount = new ArrayList<String>();
		for (int i = 1; i <= 3; i++) {
			int random = (int) (Math.random() * (9999 - 1000 + 1)) + 1000;// 設定亂數
			String accountFront = member.getMemberEmail().substring(0, member.getMemberEmail().indexOf("@"));// 取前
			String accountBack = member.getMemberEmail().substring(member.getMemberEmail().indexOf("@"));// 取後
			String newAccount = accountFront + random + accountBack;// 產生建議帳號
			while (true) {//風險控管 次數
				if (memberDaoImpl.findMemberByEmail(newAccount) == null) {// 如果帳號不存在
					listNewAccount.add(newAccount);
					break;
				}
			}
		}
		return listNewAccount;
	}

	/**
	 * @Server 將Store 存Session
	 * @param memberId
	 * @param httpSession
	 */
	@Override
	public void addStoreSession(Member getMember, HttpSession httpSession) {
		Store getStore = memberDaoImpl.findStoreByMemberId(getMember.getMemberId());
		if (null != getStore) {
			httpSession.setAttribute("storeSession", getStore);// 將storeId 存入Session
		}else {
			httpSession.removeAttribute("storeSession");
		}	
	}
	
	
	/**
	 *@Service 更改密碼
	 */
	@Override
	public void updatePwdByMemberId(String pwd,Integer memberid) {
		String hqlstr = "UPDATE Member mb set mb.memberPwd=:pwd WHERE mb.memberId =:id";
		Query query = getSession().createQuery(hqlstr).setParameter("id", memberid);
		query.setParameter("pwd", pwd);
		memberDaoImpl.updateByMemberId(query);
	}
	
	/**
	 * @隨機產生6位數
	 * @return
	 */
	@Override
	public String randomCode() {
		StringBuilder sb = new StringBuilder();
		int count = 6;	//6位數
		for(int i=0;i<count;i++) {
			int x = (int)(Math.random()*26)+65;	//65~90(A~Z)
			sb.append(String.valueOf((char)x));	//組合字串
			}
			return sb.toString();
		}
	
	
	/**
	 *@Service 更改會員狀態
	 */
	@Override
	public void updateStatusByMemberId(Integer memberid) {
		String hqlstr = "UPDATE Member mb set mb.memberStatus=:status WHERE mb.memberId =:id";
		Query query = getSession().createQuery(hqlstr).setParameter("id", memberid);
		query.setParameter("status", MemberStatus.NORMAL);//設定會員狀態為正常
		memberDaoImpl.updateByMemberId(query);
	}
	


}
