package wgu.schedule.model.dao;

import static wgu.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import wgu.schedule.model.vo.Schedule;

public class ScheduleDAO {
	private Properties prop = new Properties();
	
	public ScheduleDAO() {
		String fileName = ScheduleDAO.class.getResource("/sql/Schedule/schedule.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Schedule> selectList(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Schedule> list = null;
		
		String query = prop.getProperty("selectList");
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Schedule>();
			while(rset.next()) {
				list.add(new Schedule(rset.getString("schedule_no"),
										rset.getDate("schedule_date"),
										rset.getString("schedule_content"),
										rset.getString("schedule_title")));
				
				System.out.println(list);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		return list;
	}
	
	// 스케쥴등록
	public int insertSchedule(Connection conn, Schedule s) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSchedule");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, s.getScheduleDate());
			pstmt.setString(2, s.getScheduleContent());
			pstmt.setString(3, s.getScheduleTitle());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 학사일정 삭제
	public int deleteSchedule(Connection conn, String sNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteSchedule");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 수정할 학사일정 가져오기
	public ArrayList<Schedule> selectOne(Connection conn, String sNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Schedule> list = null;
		
		String query = prop.getProperty("selectOne");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, sNo);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Schedule>();
			while(rset.next()) {
				Schedule s = new Schedule(rset.getString("schedule_no"),
										rset.getDate("schedule_date"),
										rset.getString("schedule_content"),
										rset.getString("schedule_title"));
				
				list.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateSchedule(Connection conn, Schedule s) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateSchedule");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setDate(1, s.getScheduleDate());
			pstmt.setString(2, s.getScheduleContent());
			pstmt.setString(3, s.getScheduleTitle());
			pstmt.setString(4, s.getScheduleNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	// 월별로 가져오기
	public ArrayList<Schedule> selectMList(Connection conn, String ym) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Schedule> list = null;
		
		String query = prop.getProperty("selectMList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, ym);
			
			rset = pstmt.executeQuery();
			list = new ArrayList<Schedule>();
			
			while(rset.next()) {
				Schedule s = new Schedule(rset.getString("schedule_no"),
										rset.getDate("schedule_date"),
										rset.getString("schedule_content"),
										rset.getString("schedule_title"));
				list.add(s);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	
	
	
	
	
	
}
