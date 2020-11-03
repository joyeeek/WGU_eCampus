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
import wgu.subject.model.vo.OkSubject;

/**
 * Servlet implementation class ApplyDelServlet
 */
@WebServlet("/applyDel.su")
public class ApplyDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplyDelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subjectNo = request.getParameter("subjectNo");   
		String memberNo = request.getParameter("memberNo"); 

		OkSubject oksubject = new OkSubject(memberNo,subjectNo);
		
        int result = new SubjectService().delSubject(oksubject);
		
		if(result > 0) {
			ArrayList<OkSubject> okList = new SubjectService().selectOk(memberNo);
			response.setContentType("application/json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(okList, response.getWriter());
		} else if(result == 0){
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('과목취소에 실패했습니다'); history.back(-2);");
			// out.print("location.href = ''");
			out.print("</script>");			
		} else {		
			request.setAttribute("msg", "과목 취소에 실패하였습니다.");
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
