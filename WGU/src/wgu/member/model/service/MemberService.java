package wgu.member.model.service;

import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.close;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.rollback;

import java.sql.Connection;

import wgu.member.model.dao.MemberDAO;
import wgu.member.model.vo.Member;

public class MemberService {

	public Member selectMember(String memberId) {
		Connection conn = getConnection();
		
		Member member = new MemberDAO().selectMember(conn, memberId);
		
		close(conn);		
		
		return member;
	}
	
	//로그인
		public Member loginMember(Member member) {
			Connection conn = getConnection();
			Member loginUser = new MemberDAO().loginMember(conn, member);
		
			close(conn);
			
			return loginUser;
		}

		
		//회원가입 
		public int insertMember(Member member) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().insertMember(conn, member);
			
			//트랜잭션 처리
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}

		//정보수정
		public int updateMember(Member member) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().updateMember(conn, member);

			//트랜잭션 처리
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}
		
		
		//회원탈퇴
		public int deleteMember(Member member) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().deleteMember(conn, member);

			//트랜잭션 처리
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}


		//아이디 찾기
		public Member fineIdMember(Member member) {
			Connection conn = getConnection();
			Member userFineId = new MemberDAO().fineIdMember(conn, member);
		
			close(conn);
			
			System.out.println("서비스 fine정보 : "+ userFineId);
			return userFineId;
		}

		
		//비밀번호 찾기
		public Member finePwdMember(Member member) {
			Connection conn = getConnection();
			Member userFinePwd = new MemberDAO().finePwdMember(conn, member);
		
			close(conn);
			
			System.out.println("서비스 fine정보 : "+ userFinePwd);
			return userFinePwd;
		}

		
		//아이디 중복확인
		public int checkIdMember(String userId) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().checkIdMember(conn, userId);
		
			close(conn);
			
			System.out.println("서비스 checkId정보 : "+ result);
			return result;
			
		}

}
