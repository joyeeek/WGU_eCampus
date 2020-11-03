package wgu.member.model.dao;

import static wgu.common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import wgu.member.model.vo.Member;

public class MemberDAO {
	
	private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member selectMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		String query = prop.getProperty("selectMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member(rset.getString("MEMBER_NO"),
						            rset.getString("MEMBER_ID"),
						            rset.getString("MEMBER_PWD"),
						            rset.getString("MEMBER_NAMES"),
						            rset.getString("MEMBER_BIRTHDAY"),
						            rset.getString("MEMBER_GENDER"),
						            rset.getString("MEMBER_EMAIL"),
						            rset.getString("MEMBER_ADDRESS"),
						            rset.getString("PHONE_NO"),
						            rset.getString("MEMBER_GRADE"),
						            rset.getString("MEMBER_GROUP"),
						            rset.getString("MAJOR_NAME"),
						            rset.getString("STATUS")
						            );
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	public Member loginMember(Connection conn, Member member) {
		//SELECT * FROM MEMBER WHERE MEMBER_ID =? AND MEMBER_PWD =? STATUS='Y';
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더에 값 채워넣기
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			
			//select이기 때문에 executeQuery로 받아온다.
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(
								rset.getString("MEMBER_NO"),
								rset.getString("MEMBER_ID"),
								rset.getString("MEMBER_PWD"),
								rset.getString("MEMBER_NAMES"),
								rset.getString("MEMBER_BIRTHDAY"),
								rset.getString("MEMBER_GENDER"),
								rset.getString("MEMBER_EMAIL"),
								rset.getString("MEMBER_ADDRESS"),
								rset.getString("PHONE_NO"),
								rset.getString("MEMBER_GRADE"),
								rset.getString("MEMBER_GROUP"),
								rset.getString("MAJOR_NAME"),
								rset.getString("STATUS")
								);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberNo());
			pstmt.setString(2, member.getMemberId());
			pstmt.setString(3, member.getMemberPwd());
			pstmt.setString(4, member.getMemberName());
			pstmt.setString(5, member.getBirthDay());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getAddress());
			pstmt.setString(9, member.getPhone());
			pstmt.setString(10, member.getMemberGrade());
			pstmt.setString(11, member.getMemberGroup());
			pstmt.setString(12, member.getMajorName());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberPwd());
			pstmt.setString(2, member.getBirthDay());
			pstmt.setString(3, member.getGender());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getMemberId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	

	
	public int deleteMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		//delete문이기때문에 int로 받기 
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMemberPwd());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	

	//아이디 찾기
	public Member fineIdMember(Connection conn, Member member) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		Member userFineId = null;

		String query = prop.getProperty("fineIdMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더에 값 채워넣기
			pstmt.setString(1, member.getMemberNo());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getPhone());
			
			//select이기 때문에 executeQuery로 받아온다.
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userFineId = new Member(rset.getString("MEMBER_ID"));
				}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return userFineId;
	}

	
	//비밀번호 찾기
	public Member finePwdMember(Connection conn, Member member) {
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		Member userFinePwd = null;

		String query = prop.getProperty("finePwdMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			//위치 홀더에 값 채워넣기
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberName());
			pstmt.setString(3, member.getPhone());
			
			//select이기 때문에 executeQuery로 받아온다.
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				userFinePwd = new Member(rset.getString("MEMBER_PWD"));
				}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return userFinePwd;
	}
	
	
	//아이디 중복확인
	public int checkIdMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkIdMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				 result = rset.getInt(1);
				}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

}
