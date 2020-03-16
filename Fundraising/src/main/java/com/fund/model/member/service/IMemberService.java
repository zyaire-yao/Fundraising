package com.fund.model.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Store;

public interface IMemberService {

    /**
           * 註冊帳號時 設定帳號狀態
     * @param member
     */
	public void addMember(Member member);

	/**
	 * 更新帳號資料
	 * @param member
	 */
	public void updateMember(Member member);

	/**
	 * 取得會員資料listByEmail
	 * @param memberEmail
	 * @return
	 */
	public Member findMemberByEmail(String memberEmail);
	
    /**
           * 取得會員資料 Member
     * @param memberId
     * @return
     */
	public Member findMemberByMemberId(Integer memberId);
	
    /**
           * 取得商店資料 listByMemberId
     * @param memberId
     * @return
     */
	public Store findStoreByMemberId(Integer memberId);

	/**
	 * 存入照片
	 * @param file
	 * @param request
	 * @return
	 */
	public String addMemberPic(MultipartFile file, HttpServletRequest request);

	/**
	 * 刪除照片
	 * @param memberId
	 * @param request
	 * @return
	 */
	public boolean deleteMemberPic(Integer memberId, HttpServletRequest request);

	/**
	 * 製造建議帳號
	 * @param member
	 * @return
	 */
	public List<String> suggestAccount(Member member);

	/**
	 * 將StoreId 存Session
	 * @param getMember
	 * @param httpSession
	 */
	public void addStoreSession(Member getMember, HttpSession httpSession);
	
	/**
	 * 更改密碼
	 * @param pwd
	 * @param memberid
	 */
	public void updatePwdByMemberId(String pwd,Integer memberid);
	
	/**
	 * 隨機產生六位英文認證碼
	 * @return
	 */
	public String randomCode();
	
	/**
	 * 更改會員狀態
	 * @param memberid
	 */
	public void updateStatusByMemberId(Integer memberid);
	
	/**
	 * 用帳號密碼取得member
	 * @param memberEmailInput
	 * @param pwdMD5Input
	 * @return
	 */
	public Member findMemberByEmallAndPwd(String memberEmailInput,String pwdMD5Input) ;

}
