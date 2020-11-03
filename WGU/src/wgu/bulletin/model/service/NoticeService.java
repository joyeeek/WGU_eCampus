package wgu.bulletin.model.service;

import static wgu.common.JDBCTemplate.close;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import wgu.bulletin.model.dao.NoticeDAO;
import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Notice;
import wgu.bulletin.model.vo.PageNum;

public class NoticeService {

	public int getListCount() {
		Connection conn = getConnection();
		int result = 0;
		
		result = new NoticeDAO().getListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	// 공지사항 가져오기
	public ArrayList<Notice> selectList(PageNum np) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDAO().selectList(conn, np);
		
		close(conn);
		
		return list;
	}

	public Notice selectNotice(String nNo) {
		Connection conn = getConnection();
		Notice notice = null;
		
		// 두번 갔다와야함 (조회수/detail)
		NoticeDAO dao = new NoticeDAO();
		
		// 조회수먼저 가져오기
		int count = dao.updateCount(conn, nNo);
		
		if(count > 0) {
			notice = dao.selectNotice(conn, nNo);
		}
		
		if(notice != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return notice;
	}

	public ArrayList<Attachment> selectAttachment(String nNo) {
		Connection conn = getConnection();
		
		ArrayList<Attachment> a = new NoticeDAO().selectAttachment(conn, nNo);
		
		if(a != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return a;
	}

	// 이전글 가져오기
	public ArrayList<Notice> beforeList(String nNo) {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDAO().beforeList(conn, nNo);
		
		close(conn);
		
		return list;
	}
	
	// 다음글 가져오기
	public ArrayList<Notice> afterList(String nNo) {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDAO().afterList(conn, nNo);
		
		
		close(conn);
		
		return list;
	}

	public int deleteNotice(String nNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().deleteNotice(conn, nNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	public int insertNotice1(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().insertNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int insertNotice2(Notice n, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		NoticeDAO dao = new NoticeDAO();
		
		int result1 = dao.insertNotice(conn, n);
		
		int result2 = dao.insertAttachment(conn, fileList);
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result1;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().updateNotice(conn, n);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}

	public ArrayList<Notice> searchList(String searchtext, PageNum np) {
		Connection conn = getConnection();
		ArrayList<Notice> list = new NoticeDAO().searchList(conn, searchtext, np);
		
		close(conn);
		
		return list;
	}

	public int updateAttachment(String nNo, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().updateAttachment(conn, nNo, fileList);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);	
		
		
		return result;
	}

	public int deleteAttachment(String fileId, String nNo) {
		Connection conn = getConnection();
		
		int result = new NoticeDAO().deleteAttachment(conn, fileId, nNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public ArrayList<Notice> previewNotice(int pageLimit) {
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDAO().previewNotice(conn, pageLimit);
		
		close(conn);
		
		return list;
	}

	

}
