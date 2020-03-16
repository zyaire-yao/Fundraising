package com.fund.controller.testPOI;

import java.io.File;
import java.io.FileOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.bind.annotation.RequestMapping;

public class testPOI2 {
	//2007以前
//	public static void main(String[] args) throws Exception {
//		/**
//		* 注意這只是07版本以前的做法對應的excel檔案的字尾名為.xls
//		* 07版本和07版本以後的做法excel檔案的字尾名為.xlsx
//		*/
//		//建立新工作簿
//		HSSFWorkbook workbook = new HSSFWorkbook();
//		//新建工作表
//		HSSFSheet sheet = workbook.createSheet("hello");
//		//建立行,行號作為引數傳遞給createRow()方法,第一行從0開始計算
//		HSSFRow row = sheet.createRow(0);
//		//建立單元格,row已經確定了行號,列號作為引數傳遞給createCell(),第一列從0開始計算
//		HSSFCell cell = row.createCell(2);
//		//設定單元格的值,即C1的值(第一行,第三列)
//		cell.setCellValue("hello sheet");
//		//輸出到磁碟中
//		FileOutputStream fos = new FileOutputStream(new File("D:\\testpoi\\11.xls"));
//		workbook.write(fos);
//		workbook.close();
//		fos.close();
//		}
	
	//2007後
	public static void main(String[] args) throws Exception {
		//建立工作簿
		XSSFWorkbook workbook = new XSSFWorkbook();
		//新建工作表
		XSSFSheet sheet = workbook.createSheet("hello");
		//建立行,0表示第一行
		XSSFRow row = sheet.createRow(0);
		//建立單元格行號由row確定,列號作為引數傳遞給createCell;第一列從0開始計算
		XSSFCell cell = row.createCell(2);
		//給單元格賦值
		cell.setCellValue("hello sheet");
		//建立輸出流
		FileOutputStream fos = new FileOutputStream(new File("D:\\testpoi\\cc.xlsx"));
		workbook.write(fos);
		workbook.close();
		fos.close();
	}
}
