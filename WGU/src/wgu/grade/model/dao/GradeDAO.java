package wgu.grade.model.dao;

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

import wgu.grade.model.vo.Grade;
import wgu.grade.model.vo.GradeAvg;
import wgu.grade.model.vo.GradeInfo;
import wgu.subject.model.dao.SubjectDAO;

public class GradeDAO {
	
private Properties prop = new Properties();
	
	public GradeDAO() {
		String fileName = SubjectDAO.class.getResource("/sql/grade/grade-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<Grade> selectSubject(Connection conn, String subjectNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Grade> list = null;
		
		String query = prop.getProperty("selectGSubject");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Grade>();
			
			while(rset.next()) {
				Grade grade = new Grade(rset.getString("major_name"),
						                 rset.getString("member_no"),
						                 rset.getString("member_names"),
						                 rset.getString("member_grade"),
						                 rset.getString("member_result"),
						                 rset.getString("subject_no"));
				list.add(grade);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int updateGrade(Connection conn, Grade grade) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateGrade");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, grade.getMemberResult());
			pstmt.setString(2, grade.getMemberNo());
			pstmt.setString(3, grade.getSubjectNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<GradeInfo> selectResultSubject(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<GradeInfo> list = null;
		
		String query = prop.getProperty("selectResultSubject");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<GradeInfo>();
			
			while(rset.next()) {
				GradeInfo grade = new GradeInfo(rset.getString("subject_type"),
						                        rset.getString("subject_major"),
						                        rset.getString("subject_name"),
						                        rset.getString("subject_credit"),
						                        rset.getString("subject_time"),
						                        rset.getString("subject_no"),
						                        rset.getString("member_result"));
				list.add(grade);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<GradeAvg> selectAvg(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<GradeAvg> avgList = null;
		
		String query = prop.getProperty("selectAvg");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberNo);
			rset = pstmt.executeQuery();
			
			avgList = new ArrayList<GradeAvg>();
			
			while(rset.next()) {
				GradeAvg grade = new GradeAvg(rset.getInt("SUBJECT_COUNT"),
						                      rset.getInt("RESULT_SUM"),
						                      rset.getFloat("RESULT_AVG"));
				avgList.add(grade);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return avgList;
	}

}
