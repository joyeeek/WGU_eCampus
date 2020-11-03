package wgu.grade.model.service;

import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.close;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import wgu.grade.model.dao.GradeDAO;
import wgu.grade.model.vo.Grade;
import wgu.grade.model.vo.GradeAvg;
import wgu.grade.model.vo.GradeInfo;

public class GradeService {

	public ArrayList<Grade> selectStudent(String subjectNo) {
        Connection conn = getConnection();
		
		ArrayList<Grade> list = new GradeDAO().selectSubject(conn, subjectNo);
		
		close(conn);
		
		return list;
	}

	public int updateGrade(Grade grade) {
		Connection conn = getConnection();
		int result = new GradeDAO().updateGrade(conn, grade);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<GradeInfo> selectResultSubject(String memberNo) {
		Connection conn = getConnection();
		
		ArrayList<GradeInfo> list = new GradeDAO().selectResultSubject(conn, memberNo);
		
		close(conn);
		
		return list;
	}

	public ArrayList<GradeAvg> selectAvg(String memberNo) {
        Connection conn = getConnection();
		
		ArrayList<GradeAvg> avgList = new GradeDAO().selectAvg(conn, memberNo);
		
		close(conn);
		
		return avgList;
	}

}
