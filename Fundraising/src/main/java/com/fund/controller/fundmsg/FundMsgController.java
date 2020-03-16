package com.fund.controller.fundmsg;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.back.service.IFundSettleService;
import com.fund.model.eneity.FundMsg;
import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProgram;
import com.fund.model.eneity.FundReply;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.Store;
import com.fund.model.fundOrder.service.IFundOrderService;
import com.fund.model.fundProduct.service.IFundProductService;
import com.fund.model.fundProgram.service.IFundProgramService;
import com.fund.model.fundmsg.service.IFundMsgService;
import com.fund.model.fundreply.service.IFundReplyService;
import com.fund.model.member.service.IMemberService;

@Controller
public class FundMsgController {

	@Autowired
	private IFundMsgService fundMsgServiceImpl;
	
	@Autowired
	private IFundReplyService fundReplyServiceImpl;

	@Autowired
	private IMemberService memberSerivceImpl;

	@Autowired
	private IFundProductService fundProductServiceImpl;
	
	@Autowired
	private IFundProgramService fundProgramServiceImpl;
	
	@Autowired
	private IFundOrderService fundOrderServiceImpl;
	
	@Autowired
	private IFundSettleService fundSettleServiceImpl;

	@SuppressWarnings("unused")
	@RequestMapping(value = "/addFundMsg", method = RequestMethod.POST)
	public String addMsg(HttpSession httpSession, @RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(name = "fundProductId") Integer fundProductId, FundMsg fundMsg, HttpServletRequest request,
			Model model) throws Exception {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");
		Member getMember = memberSerivceImpl.findMemberByMemberId(memberSession.getMemberId());

		if (memberSession == null) {
			System.out.println("未登入");
			return "MemberSystem/noLogin";
		} else {
			if (file.getBytes().length > 3145728) {
				System.out.println("檔案超出大小限制3M");
				return "redirect:/getProductDetail";
			} else if(file.getOriginalFilename().isEmpty()){//如果沒有上傳圖片
				FundProduct fundProduct = fundProductServiceImpl.findFundProductDetailByFundProductId(fundProductId).get(0);
				Store storeId = fundProductServiceImpl.findStoreByFundProductId(fundProductId).getStore();
				fundMsgServiceImpl.addFundMsg(fundMsg, getMember, fundProductId, storeId);
				System.out.println("留言成功");
			    List<FundMsg> AllMsg = fundMsgServiceImpl.listFindFundMsgByFundProductId(fundProductId);
			    List<FundReply> AllFundReply=fundReplyServiceImpl.listFindFundReplyByFundProductId(fundProductId);
			    int fundProjectId = fundProduct.getFundProject().getFundProjectId();

				FundSettle fundSettle = fundSettleServiceImpl.findFundSettleByFundProjectId(fundProjectId);
				System.out.println("Deadline:" + fundSettle.getFundSettleLdate()); // 抓出募資結束日期

				// 建立日期
				Date date = new Date();
				SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd ");
				Calendar c = Calendar.getInstance(); // 日期加減

				Date beginDate = date;
				Date endDate = fundSettle.getFundSettleLdate();
				long diff = (endDate.getTime() - beginDate.getTime()) / (1000 * 60 * 60 * 24); // 日期相減轉成天數
				int days = new Long(diff).intValue();
				System.out.println("day" + days);
				
				
				//抓取募資金額
				List<FundOrder> fundOrder = fundOrderServiceImpl.findAllFundOrderByFundProductId(fundProductId);
				int total=0;
				for(int i=0;i<fundOrder.size();i++) {
					int price = fundOrder.get(i).getFundOrderTotal();
					total += price;
				}
				fundProgramServiceImpl.findAllFundProgramByFundProductId(fundProductId);
				List<FundProgram> allFundProgram = fundProgramServiceImpl.findAllFundProgramByFundProductId(fundProductId);
				model.addAttribute("totalPrice", total);
				model.addAttribute("fundProductDetail", fundProduct);
				model.addAttribute("AllFundProgram", allFundProgram);
				model.addAttribute("LastDay", days);
				model.addAttribute("orderSize", fundProduct.getFundOrders().size());
			    model.addAttribute("fundProductDetail",fundProduct);
			    model.addAttribute("store", storeId);
			    model.addAttribute("allFundReply", AllFundReply);
				model.addAttribute("MsgByFundProductId", AllMsg);
				return "FundProduct/FundProductDetail";
			}else {//有上傳圖片
				String sddPic = fundMsgServiceImpl.addMsgPic(file, request);// 新增商品圖片
				if (!sddPic.equals("errorPic")) {	
					FundProduct fundProduct = fundProductServiceImpl.findFundProductDetailByFundProductId(fundProductId).get(0);
					Store storeId = fundProductServiceImpl.findStoreByFundProductId(fundProductId).getStore();
					fundMsg.setFundMsgPic(sddPic);
					fundMsgServiceImpl.addFundMsg(fundMsg, getMember, fundProductId, storeId);
					System.out.println("留言成功");
				    List<FundMsg> AllMsg = fundMsgServiceImpl.listFindFundMsgByFundProductId(fundProductId);
				    List<FundReply> AllFundReply=fundReplyServiceImpl.listFindFundReplyByFundProductId(fundProductId);
				    int fundProjectId = fundProduct.getFundProject().getFundProjectId();

					FundSettle fundSettle = fundSettleServiceImpl.findFundSettleByFundProjectId(fundProjectId);
					System.out.println("Deadline:" + fundSettle.getFundSettleLdate()); // 抓出募資結束日期

					// 建立日期
					Date date = new Date();
					SimpleDateFormat ft = new SimpleDateFormat("yyyy.MM.dd ");
					Calendar c = Calendar.getInstance(); // 日期加減

					Date beginDate = date;
					Date endDate = fundSettle.getFundSettleLdate();
					long diff = (endDate.getTime() - beginDate.getTime()) / (1000 * 60 * 60 * 24); // 日期相減轉成天數
					int days = new Long(diff).intValue();
					System.out.println("day" + days);
					
					
					//抓取募資金額
					List<FundOrder> fundOrder = fundOrderServiceImpl.findAllFundOrderByFundProductId(fundProductId);
					int total=0;
					for(int i=0;i<fundOrder.size();i++) {
						int price = fundOrder.get(i).getFundOrderTotal();
						total += price;
					}
					fundProgramServiceImpl.findAllFundProgramByFundProductId(fundProductId);
					List<FundProgram> allFundProgram = fundProgramServiceImpl.findAllFundProgramByFundProductId(fundProductId);
					model.addAttribute("totalPrice", total);
					model.addAttribute("fundProductDetail", fundProduct);
					model.addAttribute("AllFundProgram", allFundProgram);
					model.addAttribute("LastDay", days);
					model.addAttribute("orderSize", fundProduct.getFundOrders().size());
				    model.addAttribute("fundProductDetail",fundProduct);
				    model.addAttribute("store", storeId);
					model.addAttribute("MsgByFundProductId", AllMsg);
					 model.addAttribute("allFundReply", AllFundReply);
					return "FundProduct/FundProductDetail";
				} else {
					System.out.println("圖片存取失敗");
					return "redirect:/getFundProductDetail";
				}
				
			}
		}
	
	}
}
