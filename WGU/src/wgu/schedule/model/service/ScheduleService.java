package wgu.schedule.model.service;

import static wgu.common.JDBCTemplate.close;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import wgu.schedule.model.dao.ScheduleDAO;
import wgu.schedule.model.vo.Schedule;

public class ScheduleService {
	
	// 학사일정가져오기
	public ArrayList<Schedule> selectList() {
		Connection conn = getConnection();
		ArrayList<Schedule> list = new ScheduleDAO().selectList(conn);
		
		close(conn);
		
		return list;
	}
	
	// 학사일정 등록
	public ArrayList<Schedule> insertSchedule(Schedule s) {
		Connection conn = getConnection();
		ArrayList<Schedule> list = null;
		
		ScheduleDAO dao = new ScheduleDAO();
		
		int result = dao.insertSchedule(conn, s);
		
		if(result > 0) {
			commit(conn);
			list = dao.selectList(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return list;
	}
	
	// 학사일정 삭제
	public int deleteSchedule(String sNo) {
		Connection conn = getConnection();
		
		int result = new ScheduleDAO().deleteSchedule(conn, sNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 수정할 학사일정 가져오기
	public ArrayList<Schedule> selectOneSchedule(String sNo) {
		Connection conn = getConnection();
		
		ArrayList<Schedule> list = new ScheduleDAO().selectOne(conn, sNo);
		
		close(conn);
		
		return list;
	}
	
	// 학사일정수정하기
	public int updateSchedule(Schedule s) {
		Connection conn = getConnection();
		
		int result = new ScheduleDAO().updateSchedule(conn, s);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Schedule> selectMList(String ym) {
		Connection conn = getConnection();
		
		ArrayList<Schedule> list = new ScheduleDAO().selectMList(conn, ym);
		
		close(conn);
		return list;
	}
	

}
