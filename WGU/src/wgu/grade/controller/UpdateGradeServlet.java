package wgu.grade.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import wgu.grade.model.service.GradeService;
import wgu.grade.model.vo.Grade;

/**
 * Servlet implementation class UpdateGradeServlet
 */
@WebServlet("/updateG.gr")
public class UpdateGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subjectNo = request.getParameter("subjectNo");
		String memberNo = request.getParameter("memberNo");
		String memberResult = request.getParameter("memberResult");
		
		Grade grade = new Grade(memberNo, subjectNo, memberResult);
		// 업데이트
		int result = new GradeService().updateGrade(grade);
		
		if(result > 0) {
		// 바뀐 리스트 보내주기
		ArrayList<Grade> list = new GradeService().selectStudent(subjectNo);
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(list,response.getWriter());
		
		} else {
			request.setAttribute("msg", "성적 입력에 실패하였습니다.");
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
