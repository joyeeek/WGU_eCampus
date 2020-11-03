package wgu.cafeteria.model.dao;

import static wgu.common.JDBCTemplate.close;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import wgu.cafeteria.model.vo.Cafeteria;

public class CafeteriaDAO {
	
	private Properties prop = new Properties();
	
	public CafeteriaDAO() {
		String fileName = CafeteriaDAO.class.getResource("/sql/cafeteria/cafeteria-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Cafeteria> selectCList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Cafeteria> cList = null;
		
		String query =  prop.getProperty("selectCList");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			cList = new ArrayList<Cafeteria>();
			
			while(rset.next()) { 
				cList.add(new Cafeteria(rset.getString("cafeteria_title"),
										rset.getString("cafeteria_time"),
										rset.getString("cafeteria_location"),
										rset.getInt("cafeteria_price")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return cList;
	}

	public int insertCafeteria(Connection conn, Cafeteria cafeteria) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCafeteria");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cafeteria.getCafeteriaTitle());
			pstmt.setString(2, cafeteria.getCafeteriaTime());
			pstmt.setString(3, cafeteria.getCafeteriaLocation());
			pstmt.setInt(4, cafeteria.getCafeteriaPrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(conn);
		}
		
		return result;
	}

	public int updateCafeteria(Connection conn, Cafeteria cafeteria) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCafeteria");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cafeteria.getCafeteriaTime());
			pstmt.setString(2, cafeteria.getCafeteriaLocation());
			pstmt.setInt(3, cafeteria.getCafeteriaPrice());
			pstmt.setString(4, cafeteria.getCafeteriaTitle());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Cafeteria selectCafeList(Connection conn, String cafeteriaTitle) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Cafeteria cafeteria = null;
		
		String query = prop.getProperty("selectCafeList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cafeteriaTitle);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				cafeteria = new Cafeteria(rset.getString("cafeteria_title"),
										  rset.getString("cafeteria_time"),
										  rset.getString("cafeteria_location"),
										  rset.getInt("cafeteria_price"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cafeteria;
	}

	public int deleteCafeList(Connection conn, String cafeteriaTitle) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteCafeList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, cafeteriaTitle);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

}
