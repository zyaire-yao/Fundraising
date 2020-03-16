package com.fund.model.member.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fund.model.eneity.Member;
import com.fund.model.eneity.Store;

@Repository
public class MemberDaoImpl implements IMemberDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
//		return sessionFactory.openSession();
	}

	/**
	 * @Dao 註冊帳號
	 */
    @Override
	public void addMember(Member member) {
		try {
			getSession().save(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * @Dao 更新帳號資料 
	 */
    @Override
	public void updateMember(Member member) {
    	try {
			getSession().clear();
			getSession().update(member);
			System.out.println("update 完成");
		} catch (Exception e) {
			System.out.println("update 失敗 -Dao");
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
    	System.out.println(memberEmailInput +"  "+pwdMD5Input);
    	String hqlstr = "From Member WHERE memberEmail=:email and memberPwd=:pwd";
    	Query query = getSession().createQuery(hqlstr);
    	query.setParameter("email", memberEmailInput);
    	query.setParameter("pwd", pwdMD5Input);
    	List<Member> listMember = query.list();
    	if(listMember.size() != 0) {
			Member getmember = listMember.get(0);
			return getmember;
		}else {
			return null;
		}
    }
    


	/**
	 * @Dao 取得會員資料
	 */
    @Override
	public Member findMemberByEmail(String memberEmail) {
			String hqlstr = "From Member WHERE memberEmail=:email";
			Query query = getSession().createQuery(hqlstr).setParameter("email", memberEmail);
			List<Member> listMember = query.list();
			if(listMember.size() != 0) {
				Member getmember = listMember.get(0);
				return getmember;
			}else {
				return null;
			}
	}
	
	/**
	 * @Dao 取得會員資料
	 */
    @Override
	public Member findMemberByMemberId(Integer memberId) {
		return getSession().get(Member.class, memberId);
	}
	
	/**
	 * @Dao 取得商店資料
	 */
    @Override
	public Store findStoreByMemberId(Integer memberId){
		String hqlstr = "From Store WHERE member_Id=:id";
		Query quert = getSession().createQuery(hqlstr).setParameter("id", memberId);
		List<Store> listStore = quert.list();
		if(listStore.size() != 0) {
			Store getStore = listStore.get(0);
			return getStore;
		}else {
			return null;
		}		
	}
	
	/**
	 *@Dao 更改密碼
	 */
    @Override
	public void updateByMemberId(Query query) {
		query.executeUpdate();
	}
}
