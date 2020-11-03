package wgu.subject.model.service;

import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.close;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import wgu.member.model.vo.Member;
import wgu.subject.model.dao.SubjectDAO;
import wgu.subject.model.vo.OkSubject;
import wgu.subject.model.vo.Subject;

public class SubjectService {

	public int insertSubject(Subject subject) {
		Connection conn = getConnection();
		
		int result = new SubjectDAO().insertSubject(conn, subject);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	// 교수가 수강하고 있는 과목명
	public ArrayList<Subject> selectSubject(String memberNo) {
		Connection conn = getConnection();
		
		ArrayList<Subject> list = new SubjectDAO().selectSubject(conn, memberNo);
		
		close(conn);
		
		return list;
	}

	// 모든 과목
	public ArrayList<Subject> selectSubject() {
        Connection conn = getConnection();
		
		ArrayList<Subject> list = new SubjectDAO().selectSubject(conn);
		
		close(conn);
		
		return list;
	}

	// 수강신청 버튼 클릭 시 status Y로 저장
	public int okSubject(OkSubject oksubject) {
        Connection conn = getConnection();
		
		int result = new SubjectDAO().okSubject(conn, oksubject);		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<OkSubject> selectOk(String memberNo) {
        Connection conn = getConnection();
		
		ArrayList<OkSubject> okList = new SubjectDAO().selectOk(conn,memberNo);
		close(conn);
		return okList;
	}

	public int selectTime(String memberNo, String subjectTime) {
        Connection conn = getConnection();
		
		int time = new SubjectDAO().selectTime(conn, memberNo, subjectTime);
		
		close(conn);
		
		return time;
	}

	public int delSubject(OkSubject oksubject) {
       Connection conn = getConnection();
		
		int result = new SubjectDAO().delSubject(conn, oksubject);		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public ArrayList<Member> selectStu(String subjectNo) {
        Connection conn = getConnection();
		
		ArrayList<Member> studentList = new SubjectDAO().selectStu(conn,subjectNo);
		close(conn);
		return studentList;
	}

	public ArrayList<OkSubject> selectEval(String memberNo) {
        Connection conn = getConnection();
		
		ArrayList<OkSubject> evalList = new SubjectDAO().selectEval(conn,memberNo);
		close(conn);
		return evalList;
	}

	public ArrayList<Subject> selectType(String subjectType) {
        Connection conn = getConnection();
		
		ArrayList<Subject> list = new SubjectDAO().selectType(conn, subjectType);		
		close(conn);		
		return list;
	}

	public ArrayList<Subject> selectMajor(String subjectMajor) {
        Connection conn = getConnection();
		
		ArrayList<Subject> list = new SubjectDAO().selectMajor(conn, subjectMajor);		
		close(conn);		
		return list;
	}

	public ArrayList<Subject> selectSubjectName(String subjectName) {
       Connection conn = getConnection();
		
		ArrayList<Subject> list = new SubjectDAO().selectSubjectName(conn, subjectName);		
		close(conn);		
		return list; 
	}

	public ArrayList<Subject> selectTypeMajor(String subjectType, String subjectMajor) {
       Connection conn = getConnection();
		
		ArrayList<Subject> list = new SubjectDAO().selectTypeMajor(conn, subjectType, subjectMajor);		
		close(conn);		
		return list; 
	}

	public ArrayList<Subject> selectMajorSub(String subjectMajor, String subjectName) {
        Connection conn = getConnection();
		
		ArrayList<Subject> list = new SubjectDAO().selectMajorSub(conn, subjectMajor, subjectName);		
		close(conn);		
		return list; 
	}

	public ArrayList<Subject> selectTypeSub(String subjectType, String subjectName) {
        Connection conn = getConnection();
		
		ArrayList<Subject> list = new SubjectDAO().selectTypeSub(conn, subjectType, subjectName);		
		close(conn);		
		return list; 
	}

	public ArrayList<Subject> selectTypeMajorSub(String subjectType, String subjectMajor, String subjectName) {
        Connection conn = getConnection();
		
		ArrayList<Subject> list = new SubjectDAO().selectTypeMajorSub(conn, subjectType, subjectMajor, subjectName);		
		close(conn);		
		return list; 
	}
}
