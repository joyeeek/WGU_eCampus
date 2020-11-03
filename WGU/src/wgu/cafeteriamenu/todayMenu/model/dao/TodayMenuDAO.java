package wgu.cafeteriamenu.todayMenu.model.dao;

import static wgu.common.JDBCTemplate.close;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import wgu.cafeteriamenu.todayMenu.model.vo.TodayMenu;

public class TodayMenuDAO {
	
	private Properties prop = new Properties();
	
	public TodayMenuDAO() {
		String fileName = TodayMenuDAO.class.getResource("/sql/cafeteria/today-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	public TodayMenu selectTMenu(Connection conn, String cafeteriaTitle) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		TodayMenu tMenu = null;
		
		String query = prop.getProperty("selectTMenu");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cafeteriaTitle);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				tMenu = new TodayMenu(rset.getString("cafeteria_title"),
									  rset.getString("mon_menu"),
									  rset.getString("tue_menu"),
									  rset.getString("wen_menu"),
									  rset.getString("thu_menu"),
									  rset.getString("fri_menu"),
									  rset.getString("sat_menu"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tMenu;
	}

	public int insertTodayMenu(Connection conn, TodayMenu todayMenu) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertTodayMenu");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, todayMenu.getCafeteriaTitle());
			pstmt.setString(2, todayMenu.getMonMenu());
			pstmt.setString(3, todayMenu.getTueMenu());
			pstmt.setString(4, todayMenu.getWenMenu());
			pstmt.setString(5, todayMenu.getThuMenu());
			pstmt.setString(6, todayMenu.getFriMenu());
			pstmt.setString(7, todayMenu.getSatMenu());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateTodayMenu(Connection conn, TodayMenu todayMenu) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateTodayMenu");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, todayMenu.getMonMenu());
			pstmt.setString(2, todayMenu.getTueMenu());
			pstmt.setString(3, todayMenu.getWenMenu());
			pstmt.setString(4, todayMenu.getThuMenu());
			pstmt.setString(5, todayMenu.getFriMenu());
			pstmt.setString(6, todayMenu.getSatMenu());
			pstmt.setString(7, todayMenu.getCafeteriaTitle());

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


}
