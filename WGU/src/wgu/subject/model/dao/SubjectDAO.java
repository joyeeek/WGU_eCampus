package wgu.subject.model.dao;

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

import wgu.member.model.vo.Member;
import wgu.subject.model.vo.OkSubject;
import wgu.subject.model.vo.Subject;

public class SubjectDAO {
	
	private Properties prop = new Properties();
	
	public SubjectDAO() {
		String fileName = SubjectDAO.class.getResource("/sql/subject/subject-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 과목개설 - 데이터 베이스에 값 저장
	public int insertSubject(Connection conn, Subject subject) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertSubject");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subject.getSubjectName());
			pstmt.setString(2, subject.getSubjectType());
			pstmt.setInt(3, subject.getSubjectCredit());
			pstmt.setInt(4, subject.getSubjectLimit());
			pstmt.setString(5, subject.getSubjectGrade());
			pstmt.setString(6, subject.getSubjectTime());
			pstmt.setString(7, subject.getSubjectMajor());
			pstmt.setString(8, subject.getMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	// 과목개설 - 값 제일 처음 띄우기
	public ArrayList<Subject> selectSubject(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		//Subject subject = null;
		ArrayList<Subject> list = null;
		
		String query = prop.getProperty("selectSubject");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Subject>();
			
			while(rset.next()) {
				Subject subject = new Subject(rset.getString("subject_no"),
						              rset.getString("subject_name"),
						              rset.getString("subject_type"),
						              rset.getInt("subject_credit"),
						              rset.getInt("subject_limit"),
						              rset.getString("subject_grade"),
						              rset.getString("subject_time"),
						              rset.getString("subject_major"),
						              rset.getString("member_no"));
				list.add(subject);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<Subject> selectSubject(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Subject> list = null;
		
		String query = prop.getProperty("selectAllSubject");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Subject>();
			
			while(rset.next()) {
				Subject subject = new Subject(rset.getString("subject_no"),
			                                  rset.getString("subject_name"),
			                                  rset.getString("subject_type"),
			                                  rset.getInt("subject_credit"),
			                                  rset.getInt("subject_limit"),
			                                  rset.getString("subject_grade"),
			                                  rset.getString("subject_time"),
			                                  rset.getString("subject_major"),
			                                  rset.getString("member_names"));
				list.add(subject);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}


	public int okSubject(Connection conn, OkSubject oksubject) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("okSubject");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, oksubject.getMemberNo());
			pstmt.setString(2, oksubject.getSubjectNo());
			pstmt.setString(3, oksubject.getSubjectTime());
			pstmt.setString(4, oksubject.getStatus());
			pstmt.setString(5, oksubject.getMemberResult());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<OkSubject> selectOk(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OkSubject> okList = null;
		
		String query = prop.getProperty("selectOkSubject");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			okList = new ArrayList<OkSubject>();
			
			while(rset.next()) {
				OkSubject oksubject = new OkSubject(rset.getString("subject_no"),
						                        rset.getString("subject_name"),
			                                    rset.getString("subject_type"),
			                                    rset.getInt("subject_credit"),
			                                    rset.getInt("subject_limit"),
			                                    rset.getString("subject_grade"),
			                                    rset.getString("subject_time"),
			                                    rset.getString("subject_major"),
			                                    rset.getString("member_no"),
			                                    rset.getString("status"));
				okList.add(oksubject);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return okList;
	}

	public int selectTime(Connection conn, String memberNo, String subjectTime) {
		PreparedStatement pstmt = null;
		int time = 0;
		String query = prop.getProperty("selectTime");
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, memberNo);
			pstmt.setString(2, subjectTime);
			
			time = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return time;
	}

	public int delSubject(Connection conn, OkSubject oksubject) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("delSubject");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, oksubject.getMemberNo());
			pstmt.setString(2, oksubject.getSubjectNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Member> selectStu(Connection conn, String subjectNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> studentList = null;
		
		String query = prop.getProperty("selectStuList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectNo);
			rset = pstmt.executeQuery();
			studentList = new ArrayList<Member>();
			
			while(rset.next()) {
				Member student = new Member(rset.getString("major_name"),
						                    rset.getString("member_no"),
			                                rset.getString("member_names"),
			                                rset.getString("member_grade"),
			                                rset.getString("phone_no"),
			                                rset.getString("member_email"));
				studentList.add(student);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return studentList;
	}

	public ArrayList<OkSubject> selectEval(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<OkSubject> evalList = null;
		
		String query = prop.getProperty("selectEvalList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			evalList = new ArrayList<OkSubject>();
			
			while(rset.next()) {
				OkSubject eval = new OkSubject(rset.getString("subject_type"),
						                       rset.getString("subject_major"),
			                                   rset.getString("subject_name"),
			                                   rset.getString("subject_time"),
			                                   rset.getString("subject_no"),
			                                   rset.getString("status"));
				evalList.add(eval);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return evalList;
	}

	public ArrayList<Subject> selectType(Connection conn, String subjectType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Subject> list = null;
		
		String query = prop.getProperty("selectType");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectType);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Subject>();
			
			while(rset.next()) {
				Subject subject = new Subject(rset.getString("subject_no"),
						              rset.getString("subject_name"),
						              rset.getString("subject_type"),
						              rset.getInt("subject_credit"),
						              rset.getInt("subject_limit"),
						              rset.getString("subject_grade"),
						              rset.getString("subject_time"),
						              rset.getString("subject_major"),
						              rset.getString("member_no"));
				list.add(subject);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}

	public ArrayList<Subject> selectMajor(Connection conn, String subjectMajor) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Subject> list = null;
		
		String query = prop.getProperty("selectMajor");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectMajor);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Subject>();
			
			while(rset.next()) {
				Subject subject = new Subject(rset.getString("subject_no"),
						              rset.getString("subject_name"),
						              rset.getString("subject_type"),
						              rset.getInt("subject_credit"),
						              rset.getInt("subject_limit"),
						              rset.getString("subject_grade"),
						              rset.getString("subject_time"),
						              rset.getString("subject_major"),
						              rset.getString("member_no"));
				list.add(subject);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}

	public ArrayList<Subject> selectSubjectName(Connection conn, String subjectName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Subject> list = null;
		
		String query = prop.getProperty("selectSubName");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectName);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Subject>();
			
			while(rset.next()) {
				Subject subject = new Subject(rset.getString("subject_no"),
						              rset.getString("subject_name"),
						              rset.getString("subject_type"),
						              rset.getInt("subject_credit"),
						              rset.getInt("subject_limit"),
						              rset.getString("subject_grade"),
						              rset.getString("subject_time"),
						              rset.getString("subject_major"),
						              rset.getString("member_no"));
				list.add(subject);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}

	public ArrayList<Subject> selectTypeMajor(Connection conn, String subjectType, String subjectMajor) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Subject> list = null;
		
		String query = prop.getProperty("selectTypeMajor");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectType);
			pstmt.setString(2, subjectMajor);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Subject>();
			
			while(rset.next()) {
				Subject subject = new Subject(rset.getString("subject_no"),
						              rset.getString("subject_name"),
						              rset.getString("subject_type"),
						              rset.getInt("subject_credit"),
						              rset.getInt("subject_limit"),
						              rset.getString("subject_grade"),
						              rset.getString("subject_time"),
						              rset.getString("subject_major"),
						              rset.getString("member_no"));
				list.add(subject);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}

	public ArrayList<Subject> selectMajorSub(Connection conn, String subjectMajor, String subjectName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Subject> list = null;
		
		String query = prop.getProperty("selectMajorSub");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectMajor);
			pstmt.setString(2, subjectName);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Subject>();
			
			while(rset.next()) {
				Subject subject = new Subject(rset.getString("subject_no"),
						              rset.getString("subject_name"),
						              rset.getString("subject_type"),
						              rset.getInt("subject_credit"),
						              rset.getInt("subject_limit"),
						              rset.getString("subject_grade"),
						              rset.getString("subject_time"),
						              rset.getString("subject_major"),
						              rset.getString("member_no"));
				list.add(subject);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}

	public ArrayList<Subject> selectTypeSub(Connection conn, String subjectType, String subjectName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Subject> list = null;
		
		String query = prop.getProperty("selectTypeSub");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectType);
			pstmt.setString(2, subjectName);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Subject>();
			
			while(rset.next()) {
				Subject subject = new Subject(rset.getString("subject_no"),
						              rset.getString("subject_name"),
						              rset.getString("subject_type"),
						              rset.getInt("subject_credit"),
						              rset.getInt("subject_limit"),
						              rset.getString("subject_grade"),
						              rset.getString("subject_time"),
						              rset.getString("subject_major"),
						              rset.getString("member_no"));
				list.add(subject);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}

	public ArrayList<Subject> selectTypeMajorSub(Connection conn, String subjectType, String subjectMajor,
			String subjectName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Subject> list = null;
		
		String query = prop.getProperty("selectTypeMajorSub");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectType);
			pstmt.setString(2, subjectMajor);
			pstmt.setString(3, subjectName);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Subject>();
			
			while(rset.next()) {
				Subject subject = new Subject(rset.getString("subject_no"),
						              rset.getString("subject_name"),
						              rset.getString("subject_type"),
						              rset.getInt("subject_credit"),
						              rset.getInt("subject_limit"),
						              rset.getString("subject_grade"),
						              rset.getString("subject_time"),
						              rset.getString("subject_major"),
						              rset.getString("member_no"));
				list.add(subject);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}		
		
		return list;
	}

}
