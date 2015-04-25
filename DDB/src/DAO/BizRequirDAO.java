package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DBConHelper;
import Model.BizRequir;

public class BizRequirDAO {
	private List<BizRequir> bizRequirs = new ArrayList<BizRequir>();
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	public List<BizRequir> getAllBizRequirs() {
		try {
			conn = DBConHelper.getConnection();
			String sql = "select * from biz_requir order by biz_requir_no";
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				BizRequir bizRequir = new BizRequir();
				
				String bizRequirNo = rs.getString("biz_requir_no");
				String bizRequirSavePath = rs.getString("biz_requir_save_path");
				String bizRequirParseDate = rs.getString("biz_requir_parse_date");
				
				bizRequir.setBizRequirNo(bizRequirNo);
				bizRequir.setBizRequirSavePath(bizRequirSavePath);
				bizRequir.setBizRequirParseDate(bizRequirParseDate);
				
				
				bizRequirs.add(bizRequir);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return bizRequirs;
	}
	
//	public static void main(String[] args) {
//		BizRequirDAO bizRequirDAO = new BizRequirDAO();
//		List<BizRequir> bizRequirsList =  bizRequirDAO.getAllBizRequirs();
//		
//		for (BizRequir bizRequir : bizRequirsList) {
//			System.out.println(bizRequir.getBizRequirNo()+", "+bizRequir.getBizRequirSavePath());
//		}
//	}
	
}
