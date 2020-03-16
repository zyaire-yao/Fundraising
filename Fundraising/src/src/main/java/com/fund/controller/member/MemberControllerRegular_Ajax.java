package com.fund.controller.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.Member;
import com.fund.model.member.service.MemberServiceImpl;
import com.fund.util.Regular;

@Controller
public class MemberControllerRegular_Ajax {
	
	@Autowired
	private MemberServiceImpl memberServiceImpl;
	
//註冊頁面
	@RequestMapping(path="/memberEmailRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberEmailRegular( @RequestParam String email ) {
		Member m = memberServiceImpl.findMemberByEmail(email);
		String message ; 
		if(email.matches(Regular.EMAIL))
			message = "格式正確" ;
		else if ( email.length() == 0 ) {
			message =  "欄位不得為空" ;
		}else
			message = "請輸入正確的Email格式";
		
	     if(memberServiceImpl.findMemberByEmail(email)!=null) {
	    	 List<String> newAccount = memberServiceImpl.suggestAccount(m);
	    	String suggestAccount = "<br>"+"帳號已註冊  建議帳號為:"+"<br>"+newAccount.get(0)+"<br>"+newAccount.get(1)+"<br>"+newAccount.get(2)+"<br>";
			message =  suggestAccount ;
		}
		
		return message ;
	}
	@RequestMapping(path="/memberPwdRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberPwdRegular( @RequestParam String pwd ) {
		
		String message ; 
		if(pwd.matches(Regular.PASSWORD))
			message = "格式正確" ;
		else if ( pwd.length() == 0 ) {
			message =  "欄位不得為空" ;
		}
		else
			message = "密碼為6~12長度 ,包含數字及英文字母";
		
		return message ;
	}
	@RequestMapping(path="/confirmPwdRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String confirmPwdRegular( @RequestParam String memberPwd , @RequestParam String pwd ) {
		
		String message ; 
		if ( memberPwd.length() == 0 ) 
			message =  "" ;
		else if ( pwd.length() == 0 ) 
			message =  "欄位不得為空" ;
		else if(memberPwd.equals(pwd))
			message = "正確" ;
		else
			message = "與密碼不符";
		
		return message ;
	}
	
	@RequestMapping(path="/memberFnameRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberFnameRegular(@RequestParam String Fname) {
		
		String message ; 
		if(Fname.length() != 0)
			message = "格式正確" ;
		else
			message = "欄位不得為空";
		
		return message ;
	}
	
	@RequestMapping(path="/memberSnameRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberSnameRegular(@RequestParam String Sname) {
		
		String message ; 
		if(Sname.length() != 0)
			message = "格式正確" ;
		else
			message = "欄位不得為空";
		
		return message ;
	}
	
	@RequestMapping(path="/memberTwidRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberTwidRegular(@RequestParam String Twid) {
		
		String message ; 
		if(Twid.matches(Regular.TWID))
			message = "格式正確" ;
		else if ( Twid.length() == 0 ) {
			message =  "欄位不得為空" ;
		}
		else
			message = "請輸入正確的身分證格式";
		
		return message ;
	}
	
	@RequestMapping(path="/memberHbRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberHbRegular(@RequestParam String Hb) {
		
		String message ; 
		if(Hb.matches(Regular.Hb))
			message = "格式正確" ;
		else if ( Hb.length() == 0 ) {
			message =  "欄位不得為空" ;
		}
		else
			message = "請輸入正確的生日格式";
		
		return message ;
	}
	
	@RequestMapping(path="/memberGdRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberGdRegular(@RequestParam String Gd) {
		
		String message ; 
		if(Gd.matches(Regular.Gb))
			message = "格式正確" ;
		else if ( Gd.length() == 0 ) {
			message =  "欄位不得為空" ;
		}
		else
			message = "請輸入正確的性別格式";
		
		return message ;
	}
	
	@RequestMapping(path="/memberCelRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberCelRegular(@RequestParam String Cel) {
		
		String message ; 
		if(Cel.matches(Regular.PHONE))
			message = "格式正確" ;
		else if ( Cel.length() == 0 ) {
			message =  "欄位不得為空" ;
		}
		else
			message = "請輸入正確的電話格式";
		
		return message ;
	}

}
