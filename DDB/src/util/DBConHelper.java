package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConHelper {
	private static final String URL = "jdbc:oracle:thin:@210.110.136.101:1521:DBECRDB";
	private static final String USER = "scott";
	private static final String PASSWORD = "tiger";
	private static Connection conn = null;
		
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static Connection getConnection() throws SQLException {
		return conn;
	}
}
