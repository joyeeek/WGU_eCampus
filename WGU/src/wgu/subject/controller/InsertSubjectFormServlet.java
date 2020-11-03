package wgu.subject.controller;

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

import wgu.subject.model.service.SubjectService;
import wgu.subject.model.vo.Subject;

/**
 * Servlet implementation class InsertSubjectServlet
 */
@WebServlet("/subject.su")
public class InsertSubjectFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertSubjectFormServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String subjectType = request.getParameter("subjectType"); // 전공구분
		String subjectMajor = request.getParameter("subjectMajor"); // 학과
		String subjectTime = request.getParameter("subjectTime"); // 강의시간
		String subjectGrade = request.getParameter("subjectGrade"); // 수강학년
		String subjectName = request.getParameter("subjectName"); // 과목명
		int subjectCredit = Integer.parseInt(request.getParameter("subjectCredit")); // 학점
		int subjectLimit = Integer.parseInt(request.getParameter("subjectLimit")); // 정원
		String memberNo = request.getParameter("memberNo");
		
		int time = new SubjectService().selectTime(memberNo, subjectTime);
			
		Subject subject = new Subject(subjectType,subjectName,subjectMajor,subjectCredit,				
				subjectTime,subjectLimit,subjectGrade,memberNo);	
		
		PrintWriter out = response.getWriter();
		
		// 멤버 번호와 강의시간이 같으면 수강 불가능				
		int result = new SubjectService().insertSubject(subject);
		
		if(result > 0) {	
			ArrayList<Subject> list = new SubjectService().selectSubject(memberNo);
			response.setContentType("application/json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(list, response.getWriter());

		} else if(result == 0 && time == 1){	
			out.print("<script>");
			out.print("alert('같은 시간에 개설된 과목이 존재합니다.'); history.back(-2);");
			out.print("</script>");
		}
			else {
			request.setAttribute("msg", "과목 개설에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/error.jsp");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
