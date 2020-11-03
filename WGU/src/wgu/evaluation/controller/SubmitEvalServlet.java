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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import wgu.evaluation.model.service.EvaluationService;
import wgu.evaluation.model.vo.EvalQuestion;
import wgu.subject.model.service.SubjectService;
import wgu.subject.model.vo.OkSubject;


/**
 * Servlet implementation class SubmitEvalServlet
 */
@WebServlet("/evalSub.ev")
public class SubmitEvalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitEvalServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String subjectNo = request.getParameter("subjectNo");
        String memberNo = request.getParameter("memberNo");
        String queone = request.getParameter("queone");
        String quetwo = request.getParameter("quetwo");
        String quethree = request.getParameter("quethree");
        String quefour = request.getParameter("quefour");
        String quefive = request.getParameter("quefive");
        String quememo = request.getParameter("quememo");
        
        EvalQuestion eval = new EvalQuestion(subjectNo, memberNo, queone, quetwo, quethree,
        		                             quefour, quefive, quememo);
        
       int result = new EvaluationService().insertEval(eval);
       
       if(result > 0) {
    	 // status 'Y'로 업데이트 해주기
    	int updateResult = new EvaluationService().updateApply(subjectNo,memberNo);   
    	   if(updateResult > 0) {
    	// 해당 학생이 수강하고 있는 과목 리스트
   		ArrayList<OkSubject> evalList = new SubjectService().selectEval(memberNo);
   		response.setContentType("application/json; charset=UTF-8");		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(evalList, response.getWriter());
    	   }
       } else if(queone==null || quetwo==null || quethree==null || quefour==null || quefive==null || quememo==null) {
    	   PrintWriter out = response.getWriter();
    	    out.print("<script>");
			out.print("alert('모든 항목을 채워주세요'); history.back(-2);");
			out.print("</script>");
       } else {
    	   request.setAttribute("msg", "강의평가에 실패하였습니다.");
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
