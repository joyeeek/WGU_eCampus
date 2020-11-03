package wgu.bulletin.model.service;

import static wgu.common.JDBCTemplate.close;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import wgu.bulletin.model.dao.BulletinDAO;
import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Bulletin;
import wgu.bulletin.model.vo.Comments;
import wgu.bulletin.model.vo.PageNum;

public class BulletinService {
	
	// 총 게시물 갯수
	public int getListCount() {
		Connection conn = getConnection();
		int count = new BulletinDAO().getListCount(conn);
		
		close(conn);
		
		return count;
	}
	
	// 게시물가져오기
	public ArrayList<Bulletin> selectList(PageNum p) {
		Connection conn = getConnection();
		
		ArrayList<Bulletin> list = new BulletinDAO().selectList(conn, p);
		
		
		close(conn);
		
		return list;
	}

	public int insertBulletin1(Bulletin b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		//두번(bulletin / Attachment)
		BulletinDAO dao = new BulletinDAO();
		
		// 1. bulletin
		int result1 = dao.insertBulletin(conn, b);
		
		// 2. Attachment
		int result2 = dao.insertAttachment(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public int insertBulletin2(Bulletin b) {
		Connection conn = getConnection();
		int result = new BulletinDAO().insertBulletin(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 게시글 디테일(가져오기)
	public Bulletin selectBulletin(String bNo) {
		Connection conn = getConnection();
		Bulletin b = null;
		
		BulletinDAO dao = new BulletinDAO();
		
		// 두번가져와야함(조회수, 데이터가져오기)
		int result = dao.updateCount(conn, bNo);
		
		if(result > 0) { // 게시글을 보는순간 조회수가 1이 되기때문에
			b = dao.selectBulletin(conn, bNo);
		}
		
		if(b != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return b;
	}

	// 댓글가져오기
	public ArrayList<Comments> selectCommentList(String bNo) {
		Connection conn = getConnection();
		ArrayList<Comments> list = new BulletinDAO().selectCommentsList(conn, bNo);
		
		close(conn);
		
		return list;
	}
	
	// 첨부파일
	public ArrayList<Attachment> selectAttachment(String bNo) {
		Connection conn = getConnection();
		ArrayList<Attachment> list = new BulletinDAO().selectAttachment(conn, bNo);
		return list;
	}
	
	
	// 댓글 등록
	public ArrayList<Comments> insertComments(Comments c) {
		Connection conn = getConnection();
		
		BulletinDAO dao = new BulletinDAO();
		
		int result = dao.insertComments(conn, c);
		
		ArrayList<Comments> list = null;
		if(result > 0) {
			commit(conn);
			list = dao.selectCommentsList(conn, c.getBulletinNo());
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return list;
	}
	
	
	// 게시글 수정
	public int updateBulletin(Bulletin b) {
		Connection conn = getConnection();
		
		int result = new BulletinDAO().updateBulletin(conn, b);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	
	// 게시글 삭제
	public int deleteBulletin(String bId) {
		Connection conn	 = getConnection();
		
		int result = new BulletinDAO().deleteBulletin(conn, bId);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 댓글 총갯수
	public int getCommentCount(String bNo) {
		Connection conn = getConnection();
		
		int result = new BulletinDAO().getCommentCount(conn, bNo);
		
		
		close(conn);
		
		return result;
	}
	
	// 댓글 삭제
	public int deleteComment(String bNo, String cNo) {
		Connection conn = getConnection();
		
		int result = new BulletinDAO().deleteComment(conn, bNo, cNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Bulletin> beforeList(String bNo){
		Connection conn = getConnection();
		
		ArrayList<Bulletin> list = new BulletinDAO().beforeList(conn, bNo);
		
		if(list != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return list;
	}

	public ArrayList<Bulletin> afterList(String bNo) {
		Connection conn = getConnection();
		
		ArrayList<Bulletin> list = new BulletinDAO().afterList(conn, bNo);
		
		return list;
	}

	
	
	// 댓글 수정
	public int updateComment(Comments c) {
		Connection conn = getConnection();
		
		BulletinDAO dao = new BulletinDAO();
		
		int result = dao.updateComment(conn, c);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 파일삭제
	public int deleteAttachment(String fileId, String bNo) {
		Connection conn = getConnection();
		
		int result = new BulletinDAO().deleteAttachment(conn, fileId, bNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertAttachment(ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		int result = new BulletinDAO().insertAttachment(conn, fileList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);	
		
		return result;
	}

	// 
	public int updateAttachment(String bNo, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		int result = new BulletinDAO().updateAttachment(conn, bNo, fileList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);	
		
		return result;
	}

	public ArrayList<Bulletin> searchList(String searchtext, PageNum bp) {
		Connection conn = getConnection();
		ArrayList<Bulletin> list = new BulletinDAO().searchList(conn, searchtext, bp);
		
		close(conn);
		
		return list;
	}

	
	
}
