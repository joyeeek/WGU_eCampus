package wgu.evaluation.model.service;

import static wgu.common.JDBCTemplate.getConnection;
import static wgu.common.JDBCTemplate.close;
import static wgu.common.JDBCTemplate.commit;
import static wgu.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import wgu.evaluation.model.dao.EvaluationDAO;
import wgu.evaluation.model.vo.EvalQuestion;
import wgu.evaluation.model.vo.Evaluation;

public class EvaluationService {
	
	public ArrayList<Evaluation> selectMemo(String subjectNo) {
		Connection conn = getConnection();
		
		ArrayList<Evaluation> memoList = new EvaluationDAO().selectMemo(conn,subjectNo);
		close(conn);
		return memoList;
	}

	public int insertEval(EvalQuestion eval) {
        Connection conn = getConnection();
		
		int result = new EvaluationDAO().insertEval(conn, eval);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int updateApply(String subjectNo, String memberNo) {
		Connection conn = getConnection();
		
		int updateResult = new EvaluationDAO().updateApply(conn, subjectNo, memberNo);
		
		if(updateResult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return updateResult;
	}

	public ArrayList<EvalQuestion> showMemo(String subjectNo) {
		Connection conn = getConnection();
		
		ArrayList<EvalQuestion> stuMemoList = new EvaluationDAO().showMemo(conn,subjectNo);
		close(conn);
		return stuMemoList;
	}

}
