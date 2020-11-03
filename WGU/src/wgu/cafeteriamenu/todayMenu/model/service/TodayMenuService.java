package wgu.cafeteriamenu.todayMenu.model.service;

import static wgu.common.JDBCTemplate.close;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.rollback;

import java.sql.Connection;

import wgu.cafeteriamenu.todayMenu.model.dao.TodayMenuDAO;
import wgu.cafeteriamenu.todayMenu.model.vo.TodayMenu;

public class TodayMenuService {


	public TodayMenu selectTMenu(String cafeteriaTitle) {
		Connection conn = getConnection();
		
		TodayMenu tMenu = new TodayMenuDAO().selectTMenu(conn, cafeteriaTitle);
		
		close(conn);
		
		return tMenu;
	}

	public int insertTodayMenu(TodayMenu todayMenu) {
		Connection conn = getConnection();
		
		int result = new TodayMenuDAO().insertTodayMenu(conn, todayMenu);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateTodayMenu(TodayMenu todayMenu) {
		Connection conn = getConnection();
		
		int result = new TodayMenuDAO().updateTodayMenu(conn, todayMenu);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}


}
