package wgu.evaluation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import wgu.evaluation.model.service.EvaluationService;
import wgu.evaluation.model.vo.Evaluation;

/**
 * Servlet implementation class evalListFormServlet
 */
@WebServlet("/evalList.ev")
public class EvalListFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvalListFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subjectNo = request.getParameter("subjectNo");
		String status = request.getParameter("status");
		
		if(status.equals("N")) {
			ArrayList<Evaluation> memoList = new EvaluationService().selectMemo(subjectNo); 
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(memoList,response.getWriter());
			
		} else if(status.equals("Y")) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 강의평가 된 과목입니다.'); history.back(-1);</script>");
			out.flush();
			out.close();
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('페이지 오류'); history.back(-1);</script>");
			out.flush();
			out.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
