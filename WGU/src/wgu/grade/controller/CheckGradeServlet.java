package wgu.grade.controller;

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

import wgu.grade.model.service.GradeService;
import wgu.grade.model.vo.GradeAvg;
import wgu.grade.model.vo.GradeInfo;
import wgu.member.model.vo.Member;

/**
 * Servlet implementation class CheckGradeServlet
 */
@WebServlet("/checkStu.gr")
public class CheckGradeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckGradeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		  ArrayList<GradeInfo> list = new GradeService().selectResultSubject(memberNo);
		  ArrayList<GradeAvg> avgList = new GradeService().selectAvg(memberNo);
		
		if(memberNo.charAt(0) == 'S') {
			request.setAttribute("list", list);
			request.setAttribute("avgList", avgList);
			request.getRequestDispatcher("WEB-INF/views/grade/checkGrade.jsp").forward(request, response);
		} else if(memberNo.charAt(0) == 'P') {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('학생만 이용할 수 있습니다'); history.back(-1);</script>");
			out.flush();
			out.close(); 
		} else {		
			request.setAttribute("msg", "성적 조회 접속에 실패하였습니다.");
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
