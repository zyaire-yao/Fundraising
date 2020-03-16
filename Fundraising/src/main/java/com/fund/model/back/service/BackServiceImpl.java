package com.fund.model.back.service;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.util.CellRangeAddress;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fund.model.back.dao.BackDaoImpl;
import com.fund.model.back.dao.IBackDao;
import com.fund.model.eneity.Announcement;
import com.fund.model.eneity.FundOrder;
import com.fund.model.eneity.FundProject;
import com.fund.model.eneity.FundSettle;
import com.fund.model.eneity.Member;
import com.fund.model.eneity.OrderDetail;
import com.fund.model.eneity.Product;
import com.fund.model.eneity.Report;
import com.fund.model.eneity.ShoppingCart;
import com.fund.model.eneity.Store;

@Service
public class BackServiceImpl implements IBackService {
	@Autowired
	private IBackDao backDaoImpl;

	@Autowired
	private SessionFactory sessionFactory;

	// 獲取跟當前線程綁定的session
	private Session getSession() {
		return sessionFactory.getCurrentSession();
//		return sessionFactory.openSession();
	}

	@Override
	public List<Member> listFindMember() {
		List<Member> at = backDaoImpl.listFindMember();
		return at;

	}

	@Override
	public void updateMemberStatus(Integer memberId, Member member) {
		String hql = "update Member m set m.memberStatus=:mStatus where m.memberId=:mId";
		Query query = getSession().createQuery(hql).setParameter("mId", memberId);
		query.setParameter("mStatus", member.getMemberStatus());
		backDaoImpl.updateMemberStatus(query);
	}

	@Override
	public Member findUpdateGetMemberStatus(Integer memberId) {
		return backDaoImpl.findUpdateGetMemberStatus(memberId);
	}

	@Override
	public Integer getServiceMemberId(String mEmail) {
		return backDaoImpl.getDaoMemberId(mEmail);
	}

	@Override
	public List<Member> findMemberByMemberId(Integer memberId) {
		List<Member> members = backDaoImpl.findMerberByMemberId(memberId);
		return members;
	}

	@Override
	public List<Member> findUpdateMemberByMemberId(Integer memberId) {
		List<Member> getMember = backDaoImpl.findUpdateMemberByMemberId(memberId);
		return getMember;
	}

	@Override
	public List<Product> listFindProduct() {
		List<Product> at = backDaoImpl.listFindProduct();
		return at;
	}

	@Override
	public List<Report> listFindReport() {
		List<Report> at = backDaoImpl.listFindReport();
		return at;
	}

	@Override
	public List<Store> listFindStore() {
		List<Store> at = backDaoImpl.listFindStore();
		return at;
	}

	@Override
	public void addStore(Store store) {
		backDaoImpl.addStore(store);
	}

	@Override
	public void updateStoreStatus(Integer storeId, Store store) {
		String hql = "update Store s set s.storeStatus=:sStatus where s.storeId=:sId";
		Query query = getSession().createQuery(hql).setParameter("sId", storeId);
		query.setParameter("sStatus", store.getStoreStatus());
		backDaoImpl.updateStoreStatus(query);
	}

	@Override
	public Store findUpdateGetStoreStatus(Integer storeId) {
		return backDaoImpl.findUpdateGetStoreStatus(storeId);
	}

	@Override
	public List<FundProject> listFindFundProject() {
		List<FundProject> at = backDaoImpl.listFindFundProject();
		return at;
	}

	@Override
	public List<FundOrder> listFindFundOrder() {
		List<FundOrder> at = backDaoImpl.listFindFundOrder();
		return at;
	}

	@Override
	public List<OrderDetail> listFindOrderDetail() {
		List<OrderDetail> at = backDaoImpl.listFindOrderDetail();
		return at;
	}
	/**
	 * 利用memberId 查詢 member資料
	 */
	@Override
	public void updateMember(Member member) {
		Member getMember = backDaoImpl.findMemberByMemberId(member);
		// getMember.setMemberPwd(member.getMemberPwd());
		getMember.setMemberFname(member.getMemberFname());
		getMember.setMemberSname(member.getMemberSname());
		getMember.setMemberTwid(member.getMemberTwid());
		getMember.setMemberHb(member.getMemberHb());
		getMember.setMemberGd(member.getMemberGd());
		getMember.setMemberCel(member.getMemberCel());
		getMember.setMemberTel(member.getMemberTel());
		getMember.setMemberStatus(member.getMemberStatus());
		backDaoImpl.updateMember(getMember);
	}

	/**
	 * 利用storeId 查詢 store資料
	 */
	@Override
	public void updateStore(Store store) {
		Store getStore = backDaoImpl.findStoreByStoreId(store);
		getStore.setStorePf(store.getStorePf());
		getStore.setStoreTel(store.getStoreTel());
		getStore.setStorePic(store.getStorePic());
		getStore.setStoreAddress(store.getStoreAddress());
		getStore.setStoreNumber(store.getStoreNumber());
		getStore.setStoreAccount(store.getStoreAccount());
		getStore.setStorePiName(store.getStorePiName());
		getStore.setStorePiTwid(store.getStorePiTwid());
		getStore.setStorePiTel(store.getStorePiTel());
		getStore.setStorePiAddress(store.getStorePiAddress());
		getStore.setStoreStatus(store.getStoreStatus());

		backDaoImpl.updateStore(getStore);
	}

	/**
	 * 模糊查詢會員
	 * 
	 * @return
	 */
	@Override
	public List<Member> findMemberLike(String Inquire, Integer InquireSelect) {
		if (InquireSelect == 1) {// 如果輸入為id查詢
			Integer IntInquire = Integer.valueOf(Inquire);// 將字串轉為Integer
			return backDaoImpl.findMemberLikeId(IntInquire);
		} else if (InquireSelect == 2) {// 如果輸入為模糊查詢
			return backDaoImpl.findMemberLike(Inquire);
		}
		return null;

	}

	/**
	 * 模糊查詢商家
	 * 
	 * @return
	 */
	@Override
	public List<Store> findStoreLike(String Inquire, Integer InquireSelect) {
		if (InquireSelect == 1) {// 如果輸入為id查詢
			Integer IntInquire = Integer.valueOf(Inquire);// 將字串轉為Integer
			return backDaoImpl.findStoreLikeId(IntInquire);
		} else if (InquireSelect == 2) {// 如果輸入為模糊查詢
			return backDaoImpl.findStoreLike(Inquire);
		}
		return null;

	}

	/**
	 * 模糊查詢商品
	 * 
	 * @return
	 */
	@Override
	public List<Product> findProductLike(String Inquire, Integer InquireSelect) {
		if (InquireSelect == 1) {// 如果輸入為id查詢
			Integer IntInquire = Integer.valueOf(Inquire);// 將字串轉為Integer
			return backDaoImpl.findProductLikeId(IntInquire);
		} else if (InquireSelect == 2) {// 如果輸入為模糊查詢
			return backDaoImpl.findProductLike(Inquire);
		}
		return null;

	}

	/**
	 * 模糊查詢商品
	 * 
	 * @return
	 */
	@Override
	public List<FundOrder> findfundOrderLike(String Inquire, Integer InquireSelect) {
		if (InquireSelect == 1) {// 如果輸入為id查詢
			Integer IntInquire = Integer.valueOf(Inquire);// 將字串轉為Integer
			return backDaoImpl.findfundOrderLikeId(IntInquire);
		} else if (InquireSelect == 2) {// 如果輸入為模糊查詢
			return backDaoImpl.findfundOrderLike(Inquire);
		}
		return null;

	}

	/**
	 * 模糊查詢商品訂單
	 * 
	 * @return
	 */
	@Override
	public List<OrderDetail> findOrderDetailLike(String Inquire, Integer InquireSelect) {
		if (InquireSelect == 1) {// 如果輸入為id查詢
			Integer IntInquire = Integer.valueOf(Inquire);// 將字串轉為Integer
			return backDaoImpl.findOrderDetailLikeId(IntInquire);
		} else if (InquireSelect == 2) {// 如果輸入為模糊查詢
			return backDaoImpl.findOrderDetailLike(Inquire);
		}
		return null;

	}

	/**
	 * 刪除會員
	 * 
	 * @param memberId
	 */
	@Override
	public void deleteMember(int memberId) {
		try {
			Member getMember = backDaoImpl.findMemberById(memberId);
			backDaoImpl.deleteMember(getMember);
		} catch (Exception e) {
			System.out.println("刪除會員數量 -Service");
			e.printStackTrace();
		}

	}

	/**
	 * 刪除會員
	 * 
	 * @param memberId
	 */
	@Override
	public void deleteStore(int storeId) {
		try {
			Store getStore = backDaoImpl.findStoreById(storeId);
			backDaoImpl.deleteStore(getStore);
		} catch (Exception e) {
			System.out.println("刪除商家數量 -Service");
			e.printStackTrace();
		}

	}

	/**
	 * 新增店家商品明細poi
	 * 
	 * @return
	 */
	@Override
	public void bAddProductDetailPoi(ServletOutputStream out, Date startDate, Date endDate) {

		List<OrderDetail> getListOrderDetail = backDaoImpl.bFindOrderToPOI(startDate, endDate);
		try {
			// 1.建立工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 1.1建立合併單元格物件
			CellRangeAddress callRangeAddress = new CellRangeAddress(0, 0, 0, 6);// 起始行,結束行,起始列,結束列
			// 1.2頭標題樣式
			HSSFCellStyle headStyle = createCellStyle(workbook, (short) 16);
			// 1.3列標題樣式
			HSSFCellStyle colStyle = createCellStyle(workbook, (short) 13);
			// 2.建立工作表名稱
			HSSFSheet sheet = workbook.createSheet("使用者列表");
			// 2.1載入合併單元格物件
			sheet.addMergedRegion(callRangeAddress);
			// 設定預設列寬
			sheet.setDefaultColumnWidth(25);
			// 3.建立行
			// 3.1建立頭標題行;並且設定頭標題
			HSSFRow row = sheet.createRow(0);
			HSSFCell cell = row.createCell(0);
			// 載入單元格樣式
			cell.setCellStyle(headStyle);
			cell.setCellValue("商品報表");

			// 3.2建立列標題;並且設定列標題
			HSSFRow row2 = sheet.createRow(1);
			String[] titles = { "商家名稱", "訂單明細識別碼", "商品名稱", "購買數量", "商品單價", "訂單狀態", "訂單日期" };
			for (int i = 0; i < titles.length; i++) {
				HSSFCell cell2 = row2.createCell(i);
				// 載入單元格樣式
				cell2.setCellStyle(colStyle);
				cell2.setCellValue(titles[i]);
			}
			// 4.操作單元格;將使用者列表寫入excel
			if (getListOrderDetail != null) {
				for (int j = 0; j < getListOrderDetail.size(); j++) {
					// 建立資料行,前面有兩行,頭標題行和列標題行
					HSSFRow row3 = sheet.createRow(j + 2);
					HSSFCell cell1 = row3.createCell(0);
					cell1.setCellValue(getListOrderDetail.get(j).getStore().getStoreName());
					HSSFCell cell2 = row3.createCell(1);
					cell2.setCellValue(getListOrderDetail.get(j).getOrderDetailId());
					HSSFCell cell3 = row3.createCell(2);
					cell3.setCellValue(getListOrderDetail.get(j).getOrderDetailName());
					HSSFCell cell4 = row3.createCell(3);
					cell4.setCellValue(getListOrderDetail.get(j).getOrderDetailAmount());
					HSSFCell cell5 = row3.createCell(4);
					cell5.setCellValue(getListOrderDetail.get(j).getOrderDetailPrice());
					HSSFCell cell6 = row3.createCell(5);
					cell6.setCellValue(getListOrderDetail.get(j).getOrderDeliveryStatus());
					HSSFCell cell7 = row3.createCell(6);
					cell7.setCellValue(getListOrderDetail.get(j).getOrder().getOrderDate().toString());
				}
			}
			// 5.輸出
			workbook.write(out);
			workbook.close();
			// out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 新增店家募資明細poi
	 * 
	 * @return
	 */
	@Override
	public void bAddFundOrderPoi(ServletOutputStream out, Date startDate, Date endDate) {

		List<FundOrder> getListFundOrderDetail = backDaoImpl.bFindFundOrderToPOI(startDate,endDate);
		try{
			//1.建立工作簿
			HSSFWorkbook workbook = new HSSFWorkbook();
			//1.1建立合併單元格物件
			CellRangeAddress callRangeAddress = new CellRangeAddress(0,0,0,7);//起始行,結束行,起始列,結束列
			//1.2頭標題樣式
			HSSFCellStyle headStyle = createCellStyle(workbook,(short)16);
			//1.3列標題樣式
			HSSFCellStyle colStyle = createCellStyle(workbook,(short)13);
			//2.建立工作表名稱
			HSSFSheet sheet = workbook.createSheet("使用者列表");
			//2.1載入合併單元格物件
			sheet.addMergedRegion(callRangeAddress);
			//設定預設列寬
			sheet.setDefaultColumnWidth(25);
			//3.建立行
			//3.1建立頭標題行;並且設定頭標題
			HSSFRow row = sheet.createRow(0);
			HSSFCell cell = row.createCell(0);
			//載入單元格樣式
			cell.setCellStyle(headStyle);
			cell.setCellValue("募資商品報表");

			//3.2建立列標題;並且設定列標題
			HSSFRow row2 = sheet.createRow(1);
			String[] titles = {"商家名稱","募資訂單明細識別碼","募資商品名稱","募資商品單價","額外贊助","總金額","訂單狀態","訂單日期"};
			for(int i=0;i<titles.length;i++)
			{
			HSSFCell cell2 = row2.createCell(i);
			//載入單元格樣式
			cell2.setCellStyle(colStyle);
			cell2.setCellValue(titles[i]);
			}
			//4.操作單元格;將使用者列表寫入excel
			if(getListFundOrderDetail != null)
			{
			for(int j=0;j<getListFundOrderDetail.size();j++)
			{
			//建立資料行,前面有兩行,頭標題行和列標題行
			HSSFRow row3 = sheet.createRow(j+2);
			HSSFCell cell1 = row3.createCell(0);
			cell1.setCellValue(getListFundOrderDetail.get(j).getStore().getStoreName());
			HSSFCell cell2 = row3.createCell(1);
			cell2.setCellValue(getListFundOrderDetail.get(j).getFundOrderId());
			HSSFCell cell3 = row3.createCell(2);
			cell3.setCellValue(getListFundOrderDetail.get(j).getFundOrderName());
			HSSFCell cell4 = row3.createCell(3);
			cell4.setCellValue(getListFundOrderDetail.get(j).getFundOrderPrice());
			HSSFCell cell5 = row3.createCell(4);
			cell5.setCellValue(getListFundOrderDetail.get(j).getFundOrderExtraPrice());
			HSSFCell cell6 = row3.createCell(5);
			cell6.setCellValue(getListFundOrderDetail.get(j).getFundOrderTotal());
			HSSFCell cell7 = row3.createCell(6);
			cell7.setCellValue(getListFundOrderDetail.get(j).getFundOrderStatus());
			HSSFCell cell8 = row3.createCell(7);
			cell8.setCellValue(getListFundOrderDetail.get(j).getFundOrderDate().toString());
			}
			}
			//5.輸出
			workbook.write(out);
			workbook.close();
			//out.close();
			}catch(Exception e)
			{
			e.printStackTrace();
			}

	}

	/**
	 * 
	 * @param workbook
	 * @param fontsize
	 * @return 單元格樣式
	 */
	private static HSSFCellStyle createCellStyle(HSSFWorkbook workbook, short fontsize) {
		HSSFCellStyle style = workbook.createCellStyle();
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平居中
		style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中
//		style.setBorderTop(HSSFCellStyle.BORDER_THIN);//細框
//		style.setFillForegroundColor(IndexedColors.YELLOW.getIndex());//底色
//		style.setFillPattern(CellStyle.SOLID_FOREGROUND);//底色
//建立字型
		HSSFFont font = workbook.createFont();
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontHeightInPoints(fontsize);
//載入字型
		style.setFont(font);
		return style;
	}


	@Override
	public List findOrderDetailSumToAPI(){
		List orderDetailSum = backDaoImpl.findOrderDetailSumToAPI();
		return orderDetailSum;
	}
	
	/**
	 * 取得商品訂單明細 給圖表API使用
	 */
	@Override
	public List<FundSettle>  findFundSettleSumToAPI(){
		List<FundSettle> fundSettleSum = backDaoImpl.findFundSettleSumToAPI();
		return fundSettleSum;
	}



}
