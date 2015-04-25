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
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public List<Sentence> getAllSentByFileNo(String fileNo) {
		
		
		try {
			conn = DBConHelper.getConnection();
			String sql = "select * from requir_sentences where biz_requir_no = ? order by biz_requir_no, sentence_no";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, fileNo);
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
	
	public static void main(String[] args) {
		SentenceDAO sentenceDAO = new SentenceDAO();
		List<Sentence> sentences = sentenceDAO.getAllSentByFileNo("REQ00002");
		
		for (Sentence sentence : sentences) {
			System.out.println(sentence.getBizRequirNo()+", "+sentence.getSentenceNo());
		}
	}
	
}
