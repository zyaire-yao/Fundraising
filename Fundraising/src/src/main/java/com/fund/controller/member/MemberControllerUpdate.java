package com.fund.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fund.util.Regular;

@Controller
public class MemberControllerUpdate {


	//會員資料更新頁面	
	@RequestMapping(path="/memberFnameUpdate" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberFnameUpdate(@RequestParam String Fname) {
	
		String message ; 
		 if ( Fname.length() == 0 ) {
			message =  "欄位不得為空" ;
		}
		else
			message = "輸入正確";
		
		return message ;
	}
	

	@RequestMapping(path="/memberSnameUpdate" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberSnameUpdate(@RequestParam String Sname) {
	
		String message ; 
		 if ( Sname.length() == 0 ) {
			message =  "欄位不得為空" ;
		}
		else
			message = "輸入正確";
		
		return message ;
	}
	

	@RequestMapping(path="/memberTwidUpdate" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberTwidUpdate(@RequestParam String Twid) {
	
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
	
	@RequestMapping(path="/memberGdUpdate" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberGdUpdate(@RequestParam String Gd) {
	
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
	
	@RequestMapping(path="/memberHbUpdate" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberHbUpdate(@RequestParam String Hb) {
	
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
	
	@RequestMapping(path="/memberCelUpdate" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String memberCelUpdate(@RequestParam String Cel) {
	
		String message ; 
		if(Cel.matches(Regular.PHONE))
			message = "格式正確" ;
		else if ( Cel.length() == 0 ) {
			message =  "欄位不得為空" ;
		}
		else
			message = "請輸入正確的手機號碼格式";
		
		return message ;
	}
	
	
}
