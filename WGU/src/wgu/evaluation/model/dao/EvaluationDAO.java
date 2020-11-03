package wgu.evaluation.model.dao;

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

import wgu.evaluation.model.vo.EvalQuestion;
import wgu.evaluation.model.vo.Evaluation;
import wgu.subject.model.dao.SubjectDAO;


public class EvaluationDAO {
	
	private Properties prop = new Properties();
	
	public EvaluationDAO() {
        String fileName = SubjectDAO.class.getResource("/sql/evaluation/eval-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public ArrayList<Evaluation> selectMemo(Connection conn, String subjectNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Evaluation> memoList = null;
		
		String query = prop.getProperty("selectMemoList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectNo);
			rset = pstmt.executeQuery();
			memoList = new ArrayList<Evaluation>();
			
			while(rset.next()) {
				Evaluation memo = new Evaluation(rset.getString("subject_name"),
			                                     rset.getString("subject_no"),
			                                     rset.getString("member_names"));
				memoList.add(memo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return memoList;
	}


	public int insertEval(Connection conn, EvalQuestion eval) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertEval");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, eval.getSubjectNo());
			pstmt.setString(2, eval.getMemberNo());
			pstmt.setString(3, eval.getQueone());
			pstmt.setString(4, eval.getQuetwo());
			pstmt.setString(5, eval.getQuethree());
			pstmt.setString(6, eval.getQuefour());
			pstmt.setString(7, eval.getQuefive());
			pstmt.setString(8, eval.getQuememo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}


	public int updateApply(Connection conn, String subjectNo, String memberNo) {
		PreparedStatement pstmt = null;
		int updateResult = 0;
		
		String query = prop.getProperty("updateApply");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectNo);
			pstmt.setString(2, memberNo);
			
			updateResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return updateResult;
	}


	public ArrayList<EvalQuestion> showMemo(Connection conn, String subjectNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<EvalQuestion> stuMemoList = null;
		
		String query = prop.getProperty("showMemoList");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, subjectNo);
			rset = pstmt.executeQuery();
			stuMemoList = new ArrayList<EvalQuestion>();
			
			while(rset.next()) {
				EvalQuestion memo = new EvalQuestion(rset.getString("subject_no"),
						                             rset.getString("memo"));
				stuMemoList.add(memo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return stuMemoList;
	}
	
	
	
	
	
	

}
