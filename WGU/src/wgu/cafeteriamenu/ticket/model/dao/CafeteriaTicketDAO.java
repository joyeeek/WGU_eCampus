package wgu.cafeteriamenu.ticket.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import wgu.cafeteria.model.dao.CafeteriaDAO;
import wgu.cafeteriamenu.ticket.model.vo.CafeteriaTicket;
import static wgu.common.JDBCTemplate.close;

public class CafeteriaTicketDAO {
	
private Properties prop = new Properties();
	
	public CafeteriaTicketDAO() {
		String fileName = CafeteriaDAO.class.getResource("/sql/cafeteria/cafeteriaTicket-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertCafeteria(Connection conn, CafeteriaTicket cafeteriaTicket) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCafeteriaTicket");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cafeteriaTicket.getMemberNo());
			pstmt.setString(2, cafeteriaTicket.getTodayMenuTitle());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<CafeteriaTicket> selectList(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<CafeteriaTicket> cafeList = null;
		
		String query = prop.getProperty("selectCafeList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			
			rset = pstmt.executeQuery();
			cafeList = new ArrayList<CafeteriaTicket>();
			
			while(rset.next()) {
				cafeList.add(new CafeteriaTicket(rset.getInt("ticket_no"),
												 rset.getString("member_no"),
												 rset.getString("cafeteria_title"),
												 rset.getString("use_yn")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return cafeList;
	}

	public int updateCafeteria(Connection conn, CafeteriaTicket cafeteriaTicket) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCafeteria");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, cafeteriaTicket.getTicketNo());
			pstmt.setString(2, cafeteriaTicket.getMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
