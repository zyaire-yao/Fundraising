package com.fund.controller.fundproject;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.Store;
import com.fund.model.fundproject.service.IFundProjectService;
import com.fund.model.store.service.IStoreService;

@Controller
public class FundProjectController {

	@Autowired
	private IFundProjectService fundProjectServiceImpl;

	@Autowired
	private IStoreService storeServiceImpl;

	// 新增提案
	@RequestMapping(value = "/fundProject", method = RequestMethod.POST)
	public String fundProject(FundProject fundProject, Model model, HttpSession httpSession,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request)
			throws Exception {
		Store storeSession = (Store) httpSession.getAttribute("storeSession");
		Store store = storeServiceImpl.findStoreById(storeSession.getStoreId());
		int storeId = store.getStoreId();
		if (storeId != 0) {
			if (fundProject.getFundProjectTitle().isEmpty()) {
				model.addAttribute("titalFail", "資料行不可以為空"); // 募資提案名稱不可以為空
				model.addAttribute("getFundProject", fundProject);
				return "StoreBackstage/fundProject";
			} else if (fundProject.getFundProjectDate() < 0) { // 募資提案天數不可以為空
				model.addAttribute("dateFail", "天數必須大於0");
				model.addAttribute("getFundProject", fundProject);
				return "StoreBackstage/fundProject";
			} else if (fundProject.getFundProjectTotal() < 0) { // 募資提案金額不可以為空
				model.addAttribute("totalFail", "募資金額必須大於0");
				model.addAttribute("getFundProject", fundProject);
				return "StoreBackstage/fundProject";
			} else if (file.getOriginalFilename().isEmpty()) { // 募資提案檔案不可以為空
				model.addAttribute("upLoadFile", "請上傳檔案");
				model.addAttribute("getFundProject", fundProject);
				return "StoreBackstage/fundProject";
			} else if (file.getBytes().length > 10485760) { // 圖片超出大小限制10M
				model.addAttribute("failFileSize", "上傳檔案超出大小限制10M");
				model.addAttribute("getFundProject", fundProject);
				return "StoreBackstage/fundProject";
			} else if (!file.getContentType().equals("application/pdf")) { // 募資提案檔案格式錯誤
				model.addAttribute("failFileType", "上傳檔案格式錯誤");
				model.addAttribute("getFundProject", fundProject);
				return "StoreBackstage/fundProject";
			} else if (fundProject.getFundProjectPf().isEmpty()) { // 募資提案內容不可以為空
				model.addAttribute("pfFail", "資料行不可以為空");
				model.addAttribute("getFundProject", fundProject);
				return "StoreBackstage/fundProject";
			} else { // 新增募資提案
				String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉四個“-”
				String imageName = file.getOriginalFilename();// 獲取圖片名稱
				String ext = FilenameUtils.getExtension(imageName);// 獲取檔案的副檔名
				String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/fundProject");// 設定圖片上傳路徑
				file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
				fundProject.setFundProjectProject("fundProject/" + name + "." + ext);// 把圖片儲存路徑儲存到資料庫
				fundProjectServiceImpl.addFundProject(fundProject, storeId);
				model.addAttribute("successful", "上傳成功");
				return "StoreBackstage/fundProject";
			}
		} else { // 未登入
			model.addAttribute("nologin", "請先登入 3秒後跳至首頁");
			return "MemberSystem/noLogin";
		}
	}

	// 更新提案
	@RequestMapping(value = "/updateFundProject", method = RequestMethod.POST) // 上傳檔案會自動繫結到MultipartFile中
	public String updateFundProject(HttpSession httpSession, FundProject fundProject, HttpServletRequest request,
			@RequestParam(value = "file", required = false) MultipartFile file, Model model) throws Exception {
		int fundProjectId = fundProject.getFundProjectId();
		if (!file.getOriginalFilename().isEmpty()) { // 判斷是否有上傳檔案
			if (!file.getContentType().equals("application/pdf")) {
				System.out.println("上傳格式錯誤!!!!"); // 更新募資提案 上傳檔案格式錯誤
				model.addAttribute("failFileType", "上傳格式錯誤!!!!");
				model.addAttribute("getFundProject", fundProject);
				return "FundProject/UpdateFundProject";
			} else if (file.getBytes().length > 10485760) { //圖片超出大小限制10M
				model.addAttribute("failFileSize", "上傳檔案超出大小限制10M");
				model.addAttribute("getFundProject", fundProject);
				return "FundProject/UpdateFundProject";
			} else {
				fundProjectServiceImpl.deleteMemberPic(fundProjectId, request);// 刪除原本照片
				String name = UUID.randomUUID().toString().replaceAll("-", "");// 使用UUID給圖片重新命名，並去掉四個“-”
				String imageName = file.getOriginalFilename();// 獲取圖片名稱
				String ext = FilenameUtils.getExtension(imageName);// 獲取檔案的副檔名
				String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/resources/fundProject");// 設定圖片上傳路徑
				file.transferTo(new File(filePath + "/" + name + "." + ext));// 以絕對路徑儲存重名命後的圖片
				fundProject.setFundProjectProject("fundProject/" + name + "." + ext);// 把圖片儲存路徑儲存到資料庫
				fundProjectServiceImpl.updateFundProject(fundProject);
				return "redirect:/FindFundProject";
			}

		} else { // 更新募資提案 沒有更新檔案
			fundProjectServiceImpl.updateFundProject(fundProject);
			return "redirect:/FindFundProject";
		}
	}

	// 更改提案時抓取資料
	@RequestMapping(value = "/getUpdateFundProject", method = RequestMethod.GET)
	public String updateGetFundProjectProject(HttpSession httpSession, Model model,
			@RequestParam(name = "fundProjectId") Integer fundProjectId) { // 從前端的按鈕抓到 fundProjectId
		List<FundProject> projects = fundProjectServiceImpl.findUpdateFundProjectByfundProjectId(fundProjectId);
		model.addAttribute("getFundProjectId", projects.get(0).getFundProjectId());
		model.addAttribute("getFundProjectTitle", projects.get(0).getFundProjectTitle());
		model.addAttribute("getFundProjectPf", projects.get(0).getFundProjectPf());
		model.addAttribute("getFundProjectTotal", projects.get(0).getFundProjectTotal());
		model.addAttribute("getFundProjectDate", projects.get(0).getFundProjectDate());
		model.addAttribute("getFundProjectProject", projects.get(0).getFundProjectProject());
		model.addAttribute("getFundProjectStatus", projects.get(0).getFundProjectStatus());
		return "FundProject/UpdateFundProject";
	}

	// 提案查詢
	@RequestMapping(value = "/getFundProject", method = RequestMethod.GET)
	public String getFundProjectProject(HttpSession httpSession, Model model) {
		Store storeSession = (Store) httpSession.getAttribute("storeSession");
		Store store = storeServiceImpl.findStoreById(storeSession.getStoreId());
		int storeId = store.getStoreId();
		if (storeId != 0) {
			List<FundProject> projects = fundProjectServiceImpl.findFundProjectBystoreId(storeId);
			model.addAttribute("test", projects);
			return "FundProject/GetAllProject";
		} else {
			model.addAttribute("nologin", "請先登入 3秒後跳至首頁");
			return "MemberSystem/noLogin";
		}
	}

	/**
	 * 下載募資檔案
	 * 
	 * @param request
	 * @param filename
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/downloadFile")
	public ResponseEntity<byte[]> download(HttpServletRequest request,
			@RequestParam("fundProjectProject") String filename, Model model) throws Exception {

		System.out.println("filename:" + filename);
		// 下載檔案路徑
		String path = request.getServletContext().getRealPath("/WEB-INF/resources");
		File file = new File(path + File.separator + filename);  //File.separator是通用的 / 
		HttpHeaders headers = new HttpHeaders();
		// 下載顯示的檔案名，解決中文名稱亂碼問題
		String downloadFielName = new String(filename.getBytes("UTF-8"), "iso-8859-1");
		// 通知瀏覽器以attachment（下載方式）開啟圖片
		headers.setContentDispositionFormData("attachment", downloadFielName);
		// application/octet-stream ︰ 二進制流資料（最常見的檔案下載）。
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}

}
