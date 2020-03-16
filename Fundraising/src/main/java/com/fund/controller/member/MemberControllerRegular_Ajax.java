package com.fund.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.Member;
import com.fund.model.member.service.IMemberService;
import com.fund.model.member.service.MemberServiceImpl;
import com.fund.util.Regular;

@Controller
public class MemberControllerRegular_Ajax {
	
	@Autowired
	private IMemberService memberServiceImpl;
	
    /**
     * @驗證Email註冊用_是否註冊
     * @param email
     * @return
     */
	@RequestMapping(path="/memberEmailRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberEmailRegular( @RequestParam String email ) {
		Member m = memberServiceImpl.findMemberByEmail(email);
		String message ; 
		if(email.matches(Regular.EMAIL))
			message = "<font color='green'>"+"格式正確"+"</font>" ;
		else if ( email.length() == 0 ) {
			message =  "<font color='red'>"+""+"</font>" ;
		}else
			message = "<font color='red'>"+"請輸入正確的Email格式"+"</font>";
		
	     if(memberServiceImpl.findMemberByEmail(email)!=null) {
	    	 List<String> newAccount = memberServiceImpl.suggestAccount(m);
	    	String suggestAccount = "<font color='red'>"+"帳號已註冊  建議帳號為:"+"</font>"+"<br>"+
	    	 "<font color='blue'>"+newAccount.get(0)+"</font>"+"<br>"+
	    	 "<font color='blue'>"+newAccount.get(1)+"</font>"+"<br>"+
	    	 "<font color='blue'>"+newAccount.get(2)+"</font>"+"<br>";
	    	
			message =  suggestAccount ;
		}	
		return message ;
	}
	
    /**
     * @驗證Email登入用_格式是否正確
     * @param email
     * @return
     */
	@RequestMapping(path="/announcementFind" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String findAnnouncement( @RequestParam String email ) {

		String message ; 
		if(email.matches(Regular.EMAIL))
			message = "<font color='green'>"+"格式正確"+"</font>" ;
		else if ( email.length() == 0 ) {
			message =  "<font color='red'>"+""+"</font>" ;
		}else
			message = "<font color='red'>"+"請輸入正確的Email格式"+"</font>";

		return message ;
	}
	
	/**
	 * @驗證密碼
	 * @param pwd
	 * @return
	 */
	@RequestMapping(path="/memberPwdRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberPwdRegular( @RequestParam String pwd ) {
		
		String message ; 
		if(pwd.matches(Regular.PASSWORD))
			message = "<font color='green'>"+"格式正確"+"</font>" ;
		else if ( pwd.length() == 0 ) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}
		else
			message = "密碼為6~12長度 ,包含數字及英文字母";
		
		return message ;
	}
	
	/**
	 * @驗證二次密碼
	 * @param memberPwd
	 * @param pwd
	 * @return
	 */
	@RequestMapping(path="/confirmPwdRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String confirmPwdRegular( @RequestParam String memberPwd , @RequestParam String pwd ) {
		
		String message ; 
		if ( memberPwd.length() == 0 ) 
			message =  "" ;
		else if ( pwd.length() == 0 ) 
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		else if(memberPwd.equals(pwd))
			message = "<font color='green'>"+"驗證正確"+"</font>" ;
		else
			message = "<font color='red'>"+"與密碼不符"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證舊密碼
	 * @param pwd
	 * @return
	 */
	@RequestMapping(path="/oldMemberPwdRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String oldMemberPwdRegular( @RequestParam String oldPwd ) {
		
		String message ; 
		if(oldPwd.matches(Regular.PASSWORD))
			message = "<font color='green'>"+"格式正確"+"</font>" ;
		else if ( oldPwd.length() == 0 ) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}
		else
			message = "<font color='red'>"+"密碼為6~12長度 ,包含數字及英文字母"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證姓名
	 * @param Fname
	 * @return
	 */
	@RequestMapping(path="/memberFnameRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberFnameRegular(@RequestParam String Fname) {
		
		String message ; 
		if(Fname.length() == 0)
			message = "<font color='red'>"+"欄位不得為空"+"</font>" ;
		else if(!Fname.matches(Regular.CHINESE)) {
			message = "<font color='red'>"+"請輸入中文姓名"+"</font>" ;
		}else
			message = "<font color='green'>"+"輸入正確"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證暱稱
	 * @param Sname
	 * @return
	 */
	@RequestMapping(path="/memberSnameRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberSnameRegular(@RequestParam String Sname) {
		
		String message ; 
		if(Sname.length() != 0)
			message = "<font color='green'>"+"格式正確"+"</font>" ;
		else
			message = "<font color='red'>"+"欄位不得為空"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證身分證
	 * @param Twid
	 * @return
	 */
	@RequestMapping(path="/memberTwidRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberTwidRegular(@RequestParam String Twid) {
		
		String message ; 
		if(Twid.matches(Regular.TWID))
			message = "<font color='green'>"+"格式正確"+"</font>" ;
		else if ( Twid.length() == 0 ) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}
		else
			message = "<font color='red'>"+"請輸入正確的身分證格式"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證生日
	 * @param Hb
	 * @return
	 */
	@RequestMapping(path="/memberHbRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberHbRegular(@RequestParam String Hb) {
		
		String message ; 
		if(Hb.matches(Regular.HB))
			message = "<font color='green'>"+"格式正確"+"</font>" ;
		else if ( Hb.length() == 0 ) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}
		else
			message = "<font color='red'>"+"請輸入正確的生日格式"+"</font>";
		
		return message ;
	}
	

	
	
	/**
	 * @驗證手機號碼
	 * @param Cel
	 * @return
	 */
	@RequestMapping(path="/memberCelRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberCelRegular(@RequestParam String Cel) {
		
		String message ; 
		if(Cel.matches(Regular.PHONE))
			message = "<font color='green'>"+"格式正確"+"</font>" ;
		else if ( Cel.length() == 0 ) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}
		else
			message = "<font color='red'>"+"請輸入正確的電話格式"+"</font>";
		
		return message ;
	}

}
