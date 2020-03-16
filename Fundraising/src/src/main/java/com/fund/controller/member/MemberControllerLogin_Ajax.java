package com.fund.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fund.util.Regular;
@Controller
public class MemberControllerLogin_Ajax {
	

	
	//登入頁面	
		@RequestMapping(path="/memberEmailLogin" ,produces = "text/html; charset=UTF-8")
		public @ResponseBody String memberEmailLogin(@RequestParam String email) {
		
			String message ; 
			if(email.matches(Regular.EMAIL))
				message = "格式正確" ;
			else if ( email.length() == 0 ) {
				message =  "欄位不得為空" ;
			}
			else
				message = "請輸入正確的email格式";
			
			return message ;
		}
		
		@RequestMapping(path="/memberPwdLogin" ,produces = "text/html; charset=UTF-8")
		public @ResponseBody String memberPwdLogin(@RequestParam String pwd) {
		
			String message ; 
			if(pwd.matches(Regular.PASSWORD))
				message = "格式正確" ;
			else if ( pwd.length() == 0 ) {
				message =  "欄位不得為空" ;
			}
			else
				message = "請輸入正確的密碼格式";
			
			return message ;
		}
}
