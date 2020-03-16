package com.fund.model.member.dao;

import org.hibernate.query.Query;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Store;

public interface IMemberDao {

	public void addMember(Member member);//註冊帳號

	public void updateMember(Member member);//更新帳號資料
	
	public Member findMemberByEmail(String memberEmail);//取得會員資料
	
	public Member findMemberByMemberId(Integer memberId);//取得會員資料Member
	
	public Store findStoreByMemberId(Integer memberId);//取得商店資料list
	
	public void updateByMemberId(Query query);//更改密碼
	
	public Member findMemberByEmallAndPwd(String memberEmailInput,String pwdMD5Input);//用信箱及密碼查詢會員
	
}
