package com.fund.controller.back;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fund.model.back.service.IFundSettleService;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Product;

@Controller
public class FundSettleController {

	@Autowired
	private IFundSettleService fundSettleServiceImpl;

	Date date = new Date();
	SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd ");
	Calendar c = Calendar.getInstance(); //日期加減

	// 抓取單筆提案資料
	@RequestMapping(value = "/getUpdateFundStatus", method = RequestMethod.GET)
	public String updateGetFundProjectStatus(HttpSession httpSession, Model model,
			@RequestParam(name = "fundProjectId") Integer fundProjectId) { // 從前端的按鈕抓到 fundProjectId
		System.out.println("fundProjectId:" + fundProjectId);
		FundProject projects = fundSettleServiceImpl.findUpdateGetFundProjectStatus(fundProjectId);
		model.addAttribute("getprojects", projects);
		return "Back/UpdateSettleFundProject";
	}

	// 提案查詢
	@RequestMapping(value = "/getSettleAllFundProject", method = RequestMethod.GET)
	public String getFundProjectProject(HttpSession httpSession, Model model) {
		System.out.println("Settle Controller");
		List<FundSettle> projects = fundSettleServiceImpl.findAllFundSettle();
		model.addAttribute("test", projects);

		return "Back/bfundproject";
	}

	// 審核募資提案
	@RequestMapping(value = "/updateFundProjectStatus", method = RequestMethod.POST)
	public String updateFundProjectStatus(FundProject fundProject, FundSettle fundSettle, HttpSession httpSession,
			Model model, @PathParam(value = "status") String status,
			@RequestParam(name = "fundProjectId") Integer fundProjectId,
			@RequestParam(name = "fundProjectDate") Integer fundProjectDate,
			@RequestParam(name = "fundProjectTotal") Integer fundProjectTotal) {
//		System.out.println("fundProjectId:" + fundProjectId);
//		System.out.println("fundProjectDate:" + fundProjectDate);
//		System.out.println("狀態" + status);
//		System.out.println("狀態" + status.equals("pass"));
		if (status.equals("pass")) {
			fundProject.setFundProjectStatus("審核通過");
			fundSettleServiceImpl.updateProjectStatus(fundProjectId, fundProject);

			System.out.println("起始日期:" + ft.format(date));
			fundSettle.setFundSettleFdate(date);  //今天日期
			c.setTime(date);
			c.add(Calendar.DATE, fundProjectDate);//起始日期加上需要天數
			date = c.getTime(); //結束日期
			System.out.println("結束日期:" + ft.format(date));
			fundSettle.setFundSettleLdate(date);
			fundSettle.setFundSettleTotal(fundProjectTotal);
			fundSettle.setFundSettleStatus("未達標");
			fundSettle.setFundProject(fundProject);  //抓到fundProjectId
			fundSettleServiceImpl.addFundSettle(fundSettle);
			return "redirect:/getSettleAllFundProject";
		} else {
			fundProject.setFundProjectStatus("審核失敗");
			fundSettleServiceImpl.updateProjectStatus(fundProjectId, fundProject);
			return "redirect:/getSettleAllFundProject";
		}

	}
	/**
	 * 模糊查詢商家
	 * @return
	 */
	@RequestMapping(value = "/FundProjectLike")
	public String findFundProjectLike(@RequestParam(name = "Inquire")String Inquire,
			Model model) {
		List<FundProject> listFundProject = fundSettleServiceImpl.findFundProjectLike(Inquire);
		model.addAttribute("listFundProject", listFundProject);//回傳查詢結果至jsp
		model.addAttribute("Inquire", Inquire);//將原本輸入值回傳jsp
		return "Back/bfundproject";	
	}
}
