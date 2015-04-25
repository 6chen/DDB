package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBConHelper;
import Model.Sentence;

public class SentenceDAO {
	private List<Sentence> sentences = new ArrayList<Sentence>();
	
	public List<Sentence> getAllSentences() {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConHelper.getConnection();
			String sql = "select * from requir_sentences order by biz_requir_no, sentence_no";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				Sentence sentence = new Sentence();

				String sentenceNo = rs.getString("sentence_no");
				String sentenceContent = rs.getString("sentence_contents");
				String sentenceInsertDate = rs.getString("sentence_insert_date");
				String bizRequirNo = rs.getString("biz_requir_no");
				
				sentence.setSentenceNo(sentenceNo);
				sentence.setSentenceContent(sentenceContent);
				sentence.setSentenceInsertDate(sentenceInsertDate);
				sentence.setBizRequirNo(bizRequirNo);
				
				sentences.add(sentence);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		if (stmt != null) {
			try {
				stmt.close();
				stmt = null;
			} catch (Exception ex) {
				ex.printStackTrace();
			}
		}
		
		return sentences;
	}
}
