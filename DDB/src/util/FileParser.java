package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class FileParser {
	public void startParsing(String fileName) {
		ReadFiles rfs = new ReadFiles();
		List<String> paraList = rfs.readDocxFile(fileName);

		String identifier;
		Connection conn = null;
		try {
			conn = DBConHelper.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt
					.executeQuery("select 'REQ'||lpad(biz_requir_no_seq.currval, 5, '0') biz_requir_no from dual");
			rs.next();
			identifier = rs.getString("biz_requir_no");

			for (String paraString : paraList) {
				String[] splitStrings = paraString.split("[.]+");

				for (String splitString : splitStrings) {
					if (!splitString.equals("")) {
						String statInsertSQL = "insert into requir_sentences values('STE'||lpad(requir_sentence_no_seq.nextval, 5, '0'), ?, sysdate, ?)";
						PreparedStatement ptmt = conn
								.prepareStatement(statInsertSQL);
						ptmt.setString(1, splitString.trim()+".");
						ptmt.setString(2, identifier);
						ptmt.execute();
					}
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
