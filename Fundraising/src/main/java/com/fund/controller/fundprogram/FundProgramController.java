package com.fund.controller.fundprogram;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundProduct;
import com.fund.model.eneity.FundProgram;
import com.fund.model.eneity.Member;
import com.fund.model.fundProduct.service.IFundProductService;
import com.fund.model.fundProgram.service.IFundProgramService;
import com.fund.model.member.service.IMemberService;

@Controller
public class FundProgramController {

	@Autowired
	private IMemberService memberServiceImpl;
	
	@Autowired
	private IFundProgramService fundProgramServiceImpl;

	@Autowired
	private IFundProductService fundProductServiceImpl;

	@RequestMapping(value = "/addFundProgram")
	public String addFundProgram(FundProgram fundProgram, HttpSession httpSession, Model model,
			@RequestParam(name = "file", required = false) MultipartFile file, HttpServletRequest request,
			@RequestParam(value = "fundProductId") Integer fundProductId) throws IOException {
		if (fundProgram.getFundProgramPrice() <= 0) {
			System.out.println("方案價錢必須大於0");
			model.addAttribute("errorFundProgramPrice", "方案價錢必須大於0");
			return "FundProduct/addFundProgram";
		} else if (fundProgram.getFundProgramPf() == null) {
			System.out.println("方案內容不得為空");
			model.addAttribute("errorFundProgramPf", "方案內容不得為空");
			return "FundProduct/addFundProgram";
		} else if (fundProgram.getFundProgramLast() < 0) {
			System.out.println("剩餘庫存不可以小於0");
			model.addAttribute("errorFundProgramLast", "剩餘庫存不可以小於0");
			return "FundProduct/addFundProgram";
		} else if (file.getBytes().length > 10485760) {
			System.out.println("檔案超出大小限制10M");
			model.addAttribute("errorFundProgramSize", "檔案超出大小限制10M");
			return "FundProduct/addFundProgram";
		} else if (file.getOriginalFilename().isEmpty()) {
			System.out.println("照片不可以為空");
			model.addAttribute("errorFundProgramPic", "照片不可以為空");
			return "FundProduct/addFundProgram";
		}
//		else if(!file.getContentType().equals("image/jpeg") || !file.getContentType().equals("image/gif")){
//			System.out.println("檔案類型錯誤");
//			model.addAttribute("errorFundProgramType","檔案類型錯誤");
//			return "FundProduct/addFundProgram";
//		}
		else {
			System.out.println("file:" + file);
			String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉四個“-”
			String imageName = file.getOriginalFilename();// 獲取圖片名稱
			System.out.println("imageName:" + imageName);
			// String contentType=file.getContentType(); //獲得檔案型別（可以判斷如果不是圖片，禁止上傳）
			String ext = FilenameUtils.getExtension(imageName);// 獲取檔案的副檔名
			String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/images");// 設定圖片上傳路徑
			file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
			fundProgram.setFundProgramPicture("images/" + name + "." + ext);// 把圖片儲存路徑儲存到資料庫
			System.out.println("filePath :" + filePath);

			List<FundProduct> fundProduct = fundProductServiceImpl.findFundProductDetailByFundProductId(fundProductId);
			FundProduct fundproduct = fundProduct.get(0);
			fundProgram.setFundProduct(fundproduct);
			fundProgramServiceImpl.addFundProgram(fundProgram);

			FundProduct fundProductForFundProgram = fundProgramServiceImpl
					.findFundProductByFundProjectId(fundproduct.getFundProject().getFundProjectId());
			int fundProductIdForFundProgram = fundProductForFundProgram.getFundProductId();
			List<FundProgram> allFundProgram = fundProgramServiceImpl
					.findAllFundProgramByFundProductId(fundProductIdForFundProgram);
			model.addAttribute("FundProductId", fundProductIdForFundProgram);
			model.addAttribute("AllFundProgram", allFundProgram);
			return "FundProduct/addFundProgram";
		}
	}

	/**
	 * 由fundProjectId抓取所有方案
	 * 
	 * @return
	 */
	@RequestMapping(value = "/findAllFundProgramByFundProjectId", method = RequestMethod.GET)
	public String findAllFundProgramByFundProjectId(HttpSession httpSession, Model model, HttpServletRequest request,
			@RequestParam(value = "fundProjectId") Integer fundProjectId) {
		FundProduct fundProduct = fundProgramServiceImpl.findFundProductByFundProjectId(fundProjectId);
		int fundProductId = fundProduct.getFundProductId();
		System.out.println("fundProductId controller:" + fundProductId);
		List<FundProgram> allFundProgram = fundProgramServiceImpl.findAllFundProgramByFundProductId(fundProductId);
		model.addAttribute("FundProductId", fundProductId);
		model.addAttribute("AllFundProgram", allFundProgram);
		return "FundProduct/addFundProgram";
	}

	/**
	 * 由fundProgramId抓取方案明細
	 * 
	 * @return 填寫付款頁面
	 */
	@RequestMapping(value = "/findFundProgramDetailByFundProgramId", method = RequestMethod.GET)
	public String findFundProgramDetailByFundProgramId(HttpSession httpSession, Model model, HttpServletRequest request,
			@RequestParam(value = "fundProgramId") Integer fundProgramId) {
		Member memberSession = (Member) httpSession.getAttribute("memberSession");// 取得Session的Member
		if (memberSession != null) {
			Member member = (Member) memberServiceImpl.findMemberByMemberId(memberSession.getMemberId());
			FundProgram fundProgramDetail = fundProgramServiceImpl.findFundProgramDetailByFundProgramId(fundProgramId);
			model.addAttribute("FundProgramDetail", fundProgramDetail);
			System.out.println("price:" + fundProgramDetail.getFundProgramPrice());
			return "FundProduct/checkPage";
		}else {
			return "MemberSystem/noLogin";
		}

	}

}
