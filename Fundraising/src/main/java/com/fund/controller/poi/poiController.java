package com.fund.controller.poi;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fund.controller.store.StoreController;
import com.fund.model.eneity.Store;
import com.fund.model.poi.PoiSvriceImpl;
import com.fund.model.store.service.IStoreService;

@Controller
public class poiController {

	@Autowired
	private PoiSvriceImpl poiSvriceImpl;
	
	@Autowired
	private IStoreService storeServiceImpl;
	
	@Autowired
	private StoreController storeController;
	
	/**
	 * 新增店家商品訂單明細poi
	 * @return
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@SuppressWarnings("unused")
	@RequestMapping(path = "/getOrderDetailPoi" , method = RequestMethod.POST)
	public String addProductDetailPoi(HttpServletResponse response,
			HttpSession httpSession,Model model,
			@RequestParam(name = "startDate") String startDate,
			@RequestParam(name = "endDate") String endDate) throws IOException, ParseException
		 {
		Store getStoreSession = (Store) httpSession.getAttribute("storeSession");
		if(null != getStoreSession) {//如果有登入
			Store getStore = storeServiceImpl.findStoreById(getStoreSession.getStoreId());//取得資料庫的store
			if(!startDate.isEmpty() && !endDate.isEmpty()) {
			String dateStart =startDate.replace("-", "");//除去日期中的符號
			int dStart=Integer.valueOf(dateStart);//轉型為Integer	
			String dateEnd =endDate.replace("-", "");//除去日期中的符號
			int dEnd=Integer.valueOf(dateEnd);//轉型為Integer
			int days=dEnd-dStart;//用來判斷輸入日期是否合理，若結束時間-開始時間小於0則錯。
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//將String轉為Date型態，並設定格式
			Date dateS = sdf.parse(startDate);//進行轉換
			Date dateE = sdf.parse(endDate);//進行轉換
			
			if(days>=0) {
			    response.setContentType("application/x-excel");//這裡設定的檔案格式是application/x-excel
		        response.setHeader("Content-Disposition", "attachment;filename=" +new String("使用者列表.xls".getBytes(), "ISO-8859-1"));
				ServletOutputStream outputStream = response.getOutputStream();
				poiSvriceImpl.addProductDetailPoi(getStore, outputStream,dateS,dateE);
				if (outputStream != null) {
					outputStream.close();
				}
						
		        return "redirect:/findStoreOrder";
			}else {
				model.addAttribute("errorOrderDetailToPOI", "日期區間輸入錯誤");
				return storeController.findStoreOrder(httpSession, model);
			}
			}else {
				model.addAttribute("errorOrderDetailToPOI", "日期區間不可為空");
				return storeController.findStoreOrder(httpSession, model);
			}
		}else {
			return "MemberSystem/noLogin";
		}
	}
	
	
	
	/**
	 * 新增店家募資訂單明細poi
	 * @return
	 * @throws IOException 
	 * @throws ParseException 
	 */
	@SuppressWarnings("unused")
	@RequestMapping(path = "/getFundOrderDetailPoi" , method = RequestMethod.POST)
	public String addFundProductDetailPoi(HttpServletResponse response,
			HttpSession httpSession,Model model,
			@RequestParam(name = "startDate") String startDate,
			@RequestParam(name = "endDate") String endDate) throws IOException, ParseException
		 {
		Store getStoreSession = (Store) httpSession.getAttribute("storeSession");
		if(null != getStoreSession) {
			Store getStore = storeServiceImpl.findStoreById(getStoreSession.getStoreId());
			if(!startDate.isEmpty() && !endDate.isEmpty()) {
							String dateStart =startDate.replace("-", "");//除去日期中的符號
			int dStart=Integer.valueOf(dateStart);//轉型為Integer	
			String dateEnd =endDate.replace("-", "");//除去日期中的符號
			int dEnd=Integer.valueOf(dateEnd);//轉型為Integer
			int days=dEnd-dStart;//用來判斷輸入日期是否合理，若結束時間-開始時間小於0則錯。
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//將String轉為Date型態，並設定格式
			Date dateS = sdf.parse(startDate);//進行轉換
			Date dateE = sdf.parse(endDate);//進行轉換
			
			if(days>=0) {
			    response.setContentType("application/x-excel");//這裡設定的檔案格式是application/x-excel
		        response.setHeader("Content-Disposition", "attachment;filename=" +new String("使用者列表.xls".getBytes(), "ISO-8859-1"));
				ServletOutputStream outputStream = response.getOutputStream();
				poiSvriceImpl.addFundProductDetailPoi(getStore, outputStream,dateS,dateE);
				if (outputStream != null)
					
					outputStream.close();
				
		        return "redirect:/findStoreOrder";
			}else {
				model.addAttribute("errorFundOrderDetailToPOI", "日期區間輸入錯誤");
				return storeController.findStoreFundOrder(httpSession, model);
			}
			}else {
				model.addAttribute("errorFundOrderDetailToPOI", "日期區間不可為空白");
				return storeController.findStoreFundOrder(httpSession, model);
			}
		}else {
			return "MemberSystem/noLogin";
		}
	}
	
}
