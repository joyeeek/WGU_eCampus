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
import wgu.bulletin.model.vo.Bulletin;
import wgu.bulletin.model.vo.Comments;
import wgu.bulletin.model.vo.PageNum;

public class BulletinDAO {
	 private Properties prop = new Properties();
	 
	 public BulletinDAO() {
		 String fileName = BulletinDAO.class.getResource("/sql/Bulletin/BandA-query.properties").getPath();
		 
		 try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
	 
	// 총 게시글 갯수 가져오기
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
			
			/* System.out.println(result); */
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return result;
	}
	
	
	
	
	// 익명게시글 가져오기 
	public ArrayList<Bulletin> selectList(Connection conn, PageNum p) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bulletin> list = null;
		
		String query = prop.getProperty("selectList");
		
		// 1페이지 눌렀을때는 1~5까지 2페이지눌렀을땐 6~10까지 나오게한다
		// int startRow int endRow
		int startRow = (p.getCurrentPage() - 1) * p.getListLimit() + 1;
		int endRow = startRow + p.getListLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			pstmt.setInt(3, 1);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Bulletin>();
			while(rset.next()) {
				Bulletin b = new Bulletin(rset.getString("bulletin_no"),
											rset.getString("bulletin_title"),
											rset.getString("bulletin_content"),
											rset.getDate("bulletin_date"),
											rset.getInt("bulletin_group"),
											rset.getString("member_no"),
											rset.getInt("bulletin_count"),
											rset.getString("status"));
				
				list.add(b);
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

	
	// 익명게시판(bulletin부분)
	public int insertBulletin(Connection conn, Bulletin b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBulletin");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBulletinTitle());
			pstmt.setString(2, b.getBulletinContent());
			pstmt.setString(3, b.getMemberNo()); //userId받으면 바꿔주기
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	// 첨부파일 넣기
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
	
	
	
	// 게시글 조회수
	public int updateCount(Connection conn, String bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public Bulletin selectBulletin(Connection conn, String bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Bulletin b = null;
		
		String query = prop.getProperty("selectBulletin");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				b = new Bulletin(rset.getString("bulletin_no"),
								rset.getString("bulletin_title"),
								rset.getString("bulletin_content"),
								rset.getDate("bulletin_date"),
								rset.getInt("bulletin_group"),
								rset.getString("member_no"),
								rset.getInt("bulletin_count"),
								rset.getString("status"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return b;
	}
	
	
	// 댓글가져오기
	public ArrayList<Comments> selectCommentsList(Connection conn, String bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comments> list = new ArrayList<Comments>();
		
		String query = prop.getProperty("selectComments");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Comments(rset.getString("comments_no"),
										rset.getString("comments_nick"),
										rset.getString("comments"),
										rset.getDate("comments_date"),
										rset.getString("member_no"),
										rset.getString("bulletin_no"),
										rset.getString("status")));
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
	
	// 첨부파일 가져오기
	public ArrayList<Attachment> selectAttachment(Connection conn, String bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = new ArrayList<Attachment>();
		
		String query = prop.getProperty("selectAttachment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Attachment(rset.getString("file_id"),
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
		
		return list;
	}

	public int insertComments(Connection conn, Comments c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertComments");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getCommentsNick());
			pstmt.setString(2, c.getComments());
			pstmt.setString(3, c.getMemberNo());
			pstmt.setString(4, c.getBulletinNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public int updateBulletin(Connection conn, Bulletin b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateBulletin");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBulletinTitle());
			pstmt.setString(2, b.getBulletinContent());
			pstmt.setString(3, b.getBulletinNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	public int deleteBulletin(Connection conn, String bId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteBulletin");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bId);
			
			result = pstmt.executeUpdate();
			
			System.out.println(bId);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	// 댓글 총갯수
	public int getCommentCount(Connection conn, String bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("getCommentCount");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

	public int deleteComment(Connection conn, String bNo, String cNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
			pstmt.setString(2, cNo);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	 
	 
	// 이전글
	public ArrayList<Bulletin> beforeList(Connection conn, String bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bulletin> list = new ArrayList<Bulletin>();
		
		String query = prop.getProperty("beforeBList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Bulletin b = new Bulletin(rset.getString("beforebulletin_no"),
											rset.getString("beforebulletin_title"));
				list.add(b);
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

	public ArrayList<Bulletin> afterList(Connection conn, String bNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bulletin> list = new ArrayList<Bulletin>();
		
		String query = prop.getProperty("afterBList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Bulletin b = new Bulletin(rset.getString("afterbulletin_no"),
											rset.getString("afterbulletin_title"));
				list.add(b);
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

	public int updateComment(Connection conn, Comments c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateComment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getComments());
			pstmt.setString(2, c.getCommentsNo());
			
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 첨부파일 삭제
	public int deleteAttachment(Connection conn, String fileId, String bNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteAttachment");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
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

	public int updateAttachment(Connection conn, String bNo, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAttachment");
		
		try {
			for(int i = 0; i <fileList.size(); i++) {
				
				Attachment a = fileList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, bNo);
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

	public ArrayList<Bulletin> searchList(Connection conn, String searchtext, PageNum bp) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Bulletin> list = null;
		
		String query = prop.getProperty("searchBulletin");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + searchtext + "%");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Bulletin>();
			
			while(rset.next()) {
				Bulletin b = new Bulletin(rset.getString("bulletin_no"),
										rset.getString("bulletin_title"),
										rset.getString("bulletin_content"),
										rset.getDate("bulletin_date"),
										rset.getInt("bulletin_group"),
										rset.getString("member_no"),
										rset.getInt("bulletin_count"),
										rset.getString("status"));
				list.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	 
	 
	 
	 
}
