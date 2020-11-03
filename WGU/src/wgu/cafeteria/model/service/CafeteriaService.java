package wgu.cafeteria.model.service;

import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.rollback;
import static wgu.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.ArrayList;

import wgu.cafeteria.model.dao.CafeteriaDAO;
import wgu.cafeteria.model.vo.Cafeteria;

public class CafeteriaService {

	public ArrayList<Cafeteria> selectList() {
		Connection conn = getConnection();
		
		ArrayList<Cafeteria> cList = null;
		cList = new CafeteriaDAO().selectCList(conn);
		
		close(conn);
		
		return cList;
	}

	public int insertCafeteria(Cafeteria cafeteria) {
		Connection conn = getConnection();
		
		int result = new CafeteriaDAO().insertCafeteria(conn, cafeteria);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}

	public int updateCafeteria(Cafeteria cafeteria) {
		Connection conn = getConnection();
		
		int result = new CafeteriaDAO().updateCafeteria(conn, cafeteria);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Cafeteria selectCafeList(String cafeteriaTitle) {
		Connection conn = getConnection();
		
		Cafeteria cafeteria = new CafeteriaDAO().selectCafeList(conn, cafeteriaTitle);
		
		close(conn);
		
		return cafeteria;
	}

	public int deleteCafeList(String cafeteriaTitle) {
		Connection conn = getConnection();
		
		int result = new CafeteriaDAO().deleteCafeList(conn, cafeteriaTitle);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}



}
