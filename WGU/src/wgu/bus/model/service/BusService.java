package wgu.bus.model.service;

import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.rollback;
import static wgu.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import wgu.bus.model.dao.BusDAO;
import wgu.bus.model.vo.Bus;
import wgu.bus.model.vo.BusTicket;

public class BusService {

	public int insertBus(Bus bus) {
		Connection conn = getConnection();
		
		int result = new BusDAO().insertBus(conn, bus);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Bus> selectList(String memberNo) {
		Connection conn = getConnection();
		
		ArrayList<Bus> list = new BusDAO().selectList(conn, memberNo);
		
		close(conn);
		
		return list;
	}

	public int insertBusTicket(BusTicket busTicket) {
		Connection conn = getConnection();
		
		int result = new BusDAO().insertBusTicket(conn, busTicket);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn); 
		}
		
		close(conn);
		
		return result;
	}

	public int insertAdminBus(Bus bus) {
		Connection conn = getConnection();
		
		int result = new BusDAO().insertAdminBus(conn, bus);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn); 
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Bus> selectAllBus() {
		Connection conn = getConnection();
		
		ArrayList<Bus> list = new BusDAO().selectAllBus(conn);
		
		close(conn);
		
		return list;
	}

	public int deleteAdminBus(int busNo) {
		Connection conn = getConnection();
		
		int result = new BusDAO().deleteAdminBus(conn, busNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn); 
		}
		
		close(conn);
		
		return result;
	}

}