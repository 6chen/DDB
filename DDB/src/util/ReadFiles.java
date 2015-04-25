package util;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;



public class ReadFiles {
	public static List<String> readDocxFile(String fileName) {

		List<String> paraList = new ArrayList<String>();
		
		try {
			File file = new File(fileName);
			FileInputStream fis = new FileInputStream(file.getAbsolutePath());
			XWPFDocument document = new XWPFDocument(fis);
			List<XWPFParagraph> paragraphs = document.getParagraphs();
			for (XWPFParagraph para : paragraphs) {
				paraList.add(para.getText());
			}
			
			fis.close();
			
			Connection conn = DBConHelper.getConnection();
			String fileInsertSQL = "insert into biz_requir values('REQ'||lpad(biz_requir_no_seq.NEXTVAL, 5, '0'), ?, sysdate)";
			PreparedStatement ptmt = conn.prepareStatement(fileInsertSQL);
			ptmt.setString(1, fileName);
			ptmt.execute();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return paraList;
	}
}
