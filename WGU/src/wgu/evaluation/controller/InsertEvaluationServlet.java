package wgu.evaluation.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wgu.member.model.vo.Member;
import wgu.subject.model.service.SubjectService;
import wgu.subject.model.vo.OkSubject;

/**
 * Servlet implementation class insertEvaluationServlet
 */
@WebServlet("/insertEvaluation.ev")
public class InsertEvaluationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertEvaluationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		// 해당 학생이 수강하고 있는 과목 리스트
		ArrayList<OkSubject> evalList = new SubjectService().selectEval(memberNo);
		
		if(!memberNo.isEmpty()) {
		if(memberNo.charAt(0) == 'S') {
			request.setAttribute("evalList", evalList);
			request.getRequestDispatcher("WEB-INF/views/evaluation/stuEvaluation.jsp").forward(request, response);
		} else if(memberNo.charAt(0) == 'P') {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('학생만 이용할 수 있습니다'); history.back(-1);</script>");
			out.flush();
			out.close(); }
		} else {		
			request.setAttribute("msg", "강의 평가 접속에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/error.jsp");
			view.forward(request, response);
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
