package wgu.bus.model.dao;

import static wgu.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import wgu.bus.model.vo.Bus;
import wgu.bus.model.vo.BusTicket;

public class BusDAO {
	
	private Properties prop = new Properties();
	
	public BusDAO() {
		String fileName = BusDAO.class.getResource("/sql/bus/bus-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertBus(Connection conn, Bus bus) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBus");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bus.getBusNo());
			pstmt.setDate(2, bus.getBusDate());
			pstmt.setString(3, bus.getBusLine());
			pstmt.setString(4, bus.getBusSeat());
			pstmt.setInt(5, bus.getBusPrice());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Bus> selectList(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bus> list = null;
		
		String query = prop.getProperty("selectList");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			
			rset = pstmt.executeQuery(); 
			list = new ArrayList<Bus>();
			
			while(rset.next()) {
				Bus bus = new Bus(rset.getInt("bus_no"),
									   rset.getDate("bus_date"),
									   rset.getString("bus_line"),
									   rset.getString("bus_seat"),
									   rset.getInt("bus_price"));
				list.add(bus);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int insertBusTicket(Connection conn, BusTicket busTicket) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBusTicket");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, busTicket.getTicketNo());
			pstmt.setString(2, busTicket.getMemberNo());
			pstmt.setInt(3, busTicket.getBusNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertAdminBus(Connection conn, Bus bus) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdminBus");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bus.getBusNo());
			pstmt.setDate(2, bus.getBusDate());
			pstmt.setString(3, bus.getBusLine());
			pstmt.setString(4, bus.getBusSeat());
			pstmt.setInt(5, bus.getBusPrice());
			pstmt.setString(6, bus.getBusComment());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public ArrayList<Bus> selectAllBus(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bus> list = null;
		
		String query = prop.getProperty("selectAllBus");

		try {
			pstmt = conn.prepareStatement(query);

			rset = pstmt.executeQuery();
			list = new ArrayList<Bus>();
			
			while(rset.next()) {
				Bus bus = new Bus(rset.getInt("bus_no"),
									   rset.getDate("bus_date"),
									   rset.getString("bus_line"),
									   rset.getString("bus_seat"),
									   rset.getInt("bus_price"),
									   rset.getString("bus_comment"));
				list.add(bus);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int deleteAdminBus(Connection conn, int busNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAdminBus");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, busNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
}
