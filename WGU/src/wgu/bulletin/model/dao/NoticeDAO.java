package wgu.bulletin.model.dao;

import static wgu.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Notice;
import wgu.bulletin.model.vo.PageNum;

public class NoticeDAO {
	
	private Properties prop = new Properties();
	
	public NoticeDAO() {
		String fileName = NoticeDAO.class.getResource("/sql/Notice/notice-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	// 공지글 목록 가져오기
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	
	// 공지글 가져오기(List)
	public ArrayList<Notice> selectList(Connection conn, PageNum np) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("selectList");
		
		
		// currentPage(현재페이지)를 가지고 시작페이지와 끝페이지 구하기
		int startRow = (np.getCurrentPage() - 1) * np.getListLimit() + 1;
		int endRow = startRow + np.getListLimit() - 1;
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"),
									rset.getString("notice_title"),
									rset.getString("notice_content"),
									rset.getDate("notice_date"),
									rset.getInt("notice_Count"),
									rset.getString("status"),
									rset.getString("member_no"));
				list.add(n);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 공지 조회수
	public int updateCount(Connection conn, String nNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 공지글 가져오기(detail)
	public Notice selectNotice(Connection conn, String nNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice list = null;
		
		String query = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list = new Notice(rset.getString("notice_no"),
								rset.getString("notice_title"),
								rset.getString("notice_content"),
								rset.getDate("notice_date"),
								rset.getInt("notice_count"),
								rset.getString("status"),
								rset.getString("member_no"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Attachment> selectAttachment(Connection conn, String nNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> a = new ArrayList<Attachment>();
		
		String query = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				a.add(new Attachment(rset.getString("file_id"),
									rset.getString("bulletin_no"),
									rset.getString("notice_no"),
									rset.getString("origin_name"),
									rset.getString("change_name"),
									rset.getString("file_path"),
									rset.getString("status")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return a;
	}
	
	// 이전글 가져오기
	public ArrayList<Notice> beforeList(Connection conn, String nNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query = prop.getProperty("beforeNList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice(rset.getString("beforenotice_no"),
									rset.getString("beforenotice_title"));
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 다음글 가져오기
	public ArrayList<Notice> afterList(Connection conn, String nNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = new ArrayList<Notice>();
		
		String query = prop.getProperty("afterNList");
		
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nNo);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice(rset.getString("afternotice_no"),
									rset.getString("afternotice_title"));	
				
				list.add(n);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deleteNotice(Connection conn, String nNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int insertNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getMemberNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertAttachment(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i <fileList.size(); i++) {
				
				Attachment a = fileList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, a.getOriginName());
				pstmt.setString(2, a.getChangeName());
				pstmt.setString(3, a.getFilePath());
				
				result += pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNotice(Connection conn, Notice n) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNotice");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, n.getNoticeTitle());
			pstmt.setString(2, n.getNoticeContent());
			pstmt.setString(3, n.getNoticeNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Notice> searchList(Connection conn, String searchtext, PageNum np) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("searchNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searchtext + "%");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"),
									rset.getString("notice_title"),
									rset.getString("notice_content"),
									rset.getDate("notice_date"),
									rset.getInt("notice_Count"),
									rset.getString("status"),
									rset.getString("member_no"));
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}

	public int updateAttachment(Connection conn, String nNo, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAttachment");
		
		try {
			for(int i = 0; i <fileList.size(); i++) {
				
				Attachment a = fileList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, nNo);
				pstmt.setString(2, a.getOriginName());
				pstmt.setString(3, a.getChangeName());
				pstmt.setString(4, a.getFilePath());
				
				result += pstmt.executeUpdate();
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteAttachment(Connection conn, String fileId, String nNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nNo);
			pstmt.setString(2, fileId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Notice> previewNotice(Connection conn, int pageLimit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("previewNotice");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, pageLimit);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			while(rset.next()) {
				Notice n = new Notice(rset.getString("notice_no"),
									rset.getString("notice_title"),
									rset.getString("notice_content"),
									rset.getDate("notice_date"),
									rset.getInt("notice_Count"),
									rset.getString("status"),
									rset.getString("member_no"));
				
				
				list.add(n);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	
	
	
	
	

}
