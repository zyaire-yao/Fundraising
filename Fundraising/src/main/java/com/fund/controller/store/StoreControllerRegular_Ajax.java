package com.fund.controller.store;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fund.model.eneity.Store;
import com.fund.model.store.service.StoreServiceImpl;
import com.fund.util.Regular;

@Controller
public class StoreControllerRegular_Ajax {

	@Autowired
	private StoreServiceImpl storeServiceImpl;
	
    /**
     * @驗證商店名是否重複
     * @param name
     * @return
     */
	@RequestMapping(path="/storeNameRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storeNameRegular( @RequestParam String name ) {
		Store getStore = storeServiceImpl.findStoreByStoreName(name);
		String message ; 
		if(name.length() == 0)
			message = "<font color='red'>"+"欄位不得為空"+"</font>"  ;
		else if ( getStore!=null) {
			message =  "<font color='red'>"+"名子已存在 在想個吧"+"</font>" ;
		}else
			message = "<font color='green'>"+"輸入正確"+"</font>";
		return message ;
	}
	
    /**
     * @驗證商店名是否重複_更新用
     * @param name
     * @return
     */
	@RequestMapping(path="/storeNameUpdateRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storeNameUpdateRegular(@RequestParam String nameUpdate,HttpSession httpSession) {
		try {
			Store storeSession = (Store)httpSession.getAttribute("storeSession");//取得storeSession
			Store getStoreBySession = storeServiceImpl.findStoreById(storeSession.getStoreId());//用Session取得資料庫資料
			Store getStore = storeServiceImpl.findStoreByStoreName(nameUpdate);//用輸入的StoreName來取得資料庫資料
			String message ; 
			if(nameUpdate.length() == 0)
				message = "<font color='red'>"+"欄位不得為空"+"</font>" ;
			else if (getStore!=null && !nameUpdate.equals(getStoreBySession.getStoreName())) {
				message =  "<font color='red'>"+"名子已存在 在想個吧"+"</font>" ;
			}else
				message = "<font color='green'>"+"輸入正確"+"</font>";
			return message ;
		} catch (Exception e) {
			e.printStackTrace();
			return "請重新登入";
		}
	}
	
	/**
	 * @驗證商店介紹
	 * @param pf
	 * @return
	 */
	@RequestMapping(path="/storePfRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storePfRegular( @RequestParam String pf ) {

		String message ; 
		if(pf.length() == 0)
			message = "<font color='red'>"+"欄位不得為空"+"</font>" ;
		else 
			message = "<font color='green'>"+"輸入正確"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證商店電話
	 * @param tel
	 * @return
	 */
	@RequestMapping(path="/storeTelRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storeTelRegular( @RequestParam String tel ) {

		String message ; 
		if(!tel.matches(Regular.STORETEL))
			message = "<font color='red'>"+"輸入電話格式錯誤"+"</font>" ;
		else if (tel.length() == 0) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}else
			message = "<font color='green'>"+"輸入正確"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證商店商行號碼
	 * @param nb
	 * @return
	 */
	@RequestMapping(path="/storeNumberRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storeNumberRegular( @RequestParam String nb ) {

		String message ; 
		if(!nb.matches(Regular.STORENUMBER))
			message = "<font color='red'>"+"輸入商行號碼格式錯誤"+"</font>" ;
		else if (nb.length() == 0) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}else
			message = "<font color='green'>"+"輸入正確"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證商店商行帳戶
	 * @param nb
	 * @return
	 */
	@RequestMapping(path="/storeAccountRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storeAccountRegular( @RequestParam String account ) {

		String message ; 
		if(!account.matches(Regular.STOREACCOUNT))
			message = "<font color='red'>"+"輸入商行帳戶格式錯誤"+"</font>" ;
		else if (account.length() == 0) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}else
			message = "<font color='green'>"+"輸入正確"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證商店負責人姓名
	 * @param nb
	 * @return
	 */
	@RequestMapping(path="/storePiNameRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storePiNameRegular( @RequestParam String pName ) {

		String message ; 
		if(!pName.matches(Regular.CHINESE))
			message = "<font color='red'>"+"請輸入中文"+"</font>" ;
		else if (pName.length() == 0) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}else
			message = "<font color='green'>"+"輸入正確"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證商店負責人身分證字號
	 * @param twId
	 * @return
	 */
	@RequestMapping(path="/storePiTwidRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storePiTwidRegular( @RequestParam String twId ) {

		String message ; 
		if(!twId.matches(Regular.TWID))
			message = "<font color='red'>"+"輸入身分證格式錯誤"+"</font>" ;
		else if (twId.length() == 0) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}else
			message = "<font color='green'>"+"輸入正確"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證商店負責人手機號碼
	 * @param piTel
	 * @return
	 */
	@RequestMapping(path="/storePiTelRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storePiTelRegular( @RequestParam String piTel ) {

		String message ; 
		if(!piTel.matches(Regular.PHONE))
			message = "<font color='red'>"+"輸入手機格式錯誤"+"</font>" ;
		else if (piTel.length() == 0) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}else
			message = "<font color='green'>"+"輸入正確"+"</font>";
		
		return message ;
	}
	
	/**
	 * @驗證商店負責人地址
	 * @param piTel
	 * @return
	 */
	@RequestMapping(path="/storePiAddressRegular" ,produces = "text/html; charset=UTF-8")
	public @ResponseBody String storePiAddressRegular( @RequestParam String piAddress ) {

		String message ; 
		 if (piAddress.length() == 0) {
			message =  "<font color='red'>"+"欄位不得為空"+"</font>" ;
		}else
			message = "<font color='green'>"+"輸入正確"+"</font>";
		
		return message ;
	}

	
	
	
	
	
	
	
	

}
