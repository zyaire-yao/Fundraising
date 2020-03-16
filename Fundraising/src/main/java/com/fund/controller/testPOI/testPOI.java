package com.fund.controller.testPOI;

import java.util.List;

import javax.servlet.ServletOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

import com.fund.model.eneity.Member;


public class testPOI {
	/**
	* 將使用者的資訊匯入到excel檔案中去
	* @param userList 使用者列表
	* @param out 輸出表
	*/
	public static void exportUserExcel(List<Member> userList,ServletOutputStream out)
	{
	try{
	//1.建立工作簿
	HSSFWorkbook workbook = new HSSFWorkbook();
	//1.1建立合併單元格物件
	CellRangeAddress callRangeAddress = new CellRangeAddress(0,0,0,4);//起始行,結束行,起始列,結束列
	//1.2頭標題樣式
	HSSFCellStyle headStyle = createCellStyle(workbook,(short)16);
	//1.3列標題樣式
	HSSFCellStyle colStyle = createCellStyle(workbook,(short)13);
	//2.建立工作表
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
	cell.setCellValue("使用者列表");
	//3.2建立列標題;並且設定列標題
	HSSFRow row2 = sheet.createRow(1);
	String[] titles = {"使用者名稱","賬號","所屬部門","性別","電子郵箱"};
	for(int i=0;i<titles.length;i++  )
	{
	HSSFCell cell2 = row2.createCell(i);
	//載入單元格樣式
	cell2.setCellStyle(colStyle);
	cell2.setCellValue(titles[i]);
	}
	//4.操作單元格;將使用者列表寫入excel
	if(userList != null)
	{
	for(int j=0;j<userList.size();j++  )
	{
	//建立資料行,前面有兩行,頭標題行和列標題行
	HSSFRow row3 = sheet.createRow(j=2);
	HSSFCell cell1 = row3.createCell(0);
	cell1.setCellValue(userList.get(j).getMemberEmail());
	HSSFCell cell2 = row3.createCell(1);
	cell2.setCellValue(userList.get(j).getMemberFname());
	HSSFCell cell3 = row3.createCell(2);
	cell3.setCellValue(userList.get(j).getMemberSname());
	HSSFCell cell4 = row3.createCell(3);
	cell4.setCellValue(userList.get(j).getMemberHb());
	HSSFCell cell5 = row3.createCell(4);
	cell5.setCellValue(userList.get(j).getMemberGd());
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
	// TODO Auto-generated method stub
	HSSFCellStyle style = workbook.createCellStyle();
	style.setAlignment(HSSFCellStyle.ALIGN_CENTER);//水平居中
	style.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);//垂直居中
	//建立字型
	HSSFFont font = workbook.createFont();
	font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
	font.setFontHeightInPoints(fontsize);
	//載入字型
	style.setFont(font);
	return style;
	}
}
