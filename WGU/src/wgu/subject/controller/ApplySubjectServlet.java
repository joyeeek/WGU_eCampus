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
import javax.servlet.http.HttpSession;

import wgu.member.model.service.MemberService;
import wgu.member.model.vo.Member;
import wgu.subject.model.service.SubjectService;
import wgu.subject.model.vo.OkSubject;
import wgu.subject.model.vo.Subject;

/**
 * Servlet implementation class ApplySubjectServlet
 */
@WebServlet("/applySubject.su")
public class ApplySubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplySubjectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  HttpSession session = request.getSession();
		  String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		  String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
		    
		  ArrayList<OkSubject> okList = new SubjectService().selectOk(memberNo);
		  ArrayList<Subject> list = new SubjectService().selectSubject();		  
		  Member member = new MemberService().selectMember(memberId);	
		  
		    if(member.getMemberNo().charAt(0) == 'S') {
				request.setAttribute("member", member);
				request.setAttribute("list", list);
				request.setAttribute("okList", okList);
				request.getRequestDispatcher("WEB-INF/views/subject/applySubject.jsp").forward(request, response);
			} else if(member.getMemberNo().charAt(0) == 'P') {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('학생만 이용할 수 있습니다'); history.back(-1);</script>");
				out.flush();
				out.close();
			} else {		
				request.setAttribute("msg", "수강 신청 접속에 실패하였습니다.");
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
