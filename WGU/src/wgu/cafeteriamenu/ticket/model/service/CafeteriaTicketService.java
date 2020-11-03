package wgu.cafeteriamenu.ticket.model.service;

import static wgu.common.JDBCTemplate.close;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import wgu.cafeteriamenu.ticket.model.dao.CafeteriaTicketDAO;
import wgu.cafeteriamenu.ticket.model.vo.CafeteriaTicket;

public class CafeteriaTicketService {

	public int insertCafeteriaTicket(CafeteriaTicket cafeteriaTicket) {
		Connection conn = getConnection();
		
		int result = new CafeteriaTicketDAO().insertCafeteria(conn, cafeteriaTicket);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}

	public ArrayList<CafeteriaTicket> selectList(String memberNo) {
		Connection conn = getConnection();
		
		ArrayList<CafeteriaTicket> cafeList = null;
		cafeList = new CafeteriaTicketDAO().selectList(conn, memberNo);
		close(conn);
	
		return cafeList;
	}

	public int updateCafeteriaTicket(CafeteriaTicket cafeteriaTicket) {
		Connection conn = getConnection();
		
		int result = new CafeteriaTicketDAO().updateCafeteria(conn, cafeteriaTicket);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
