package wgu.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wgu.member.model.service.MemberService;
import wgu.member.model.vo.Member;

/**
 * Servlet implementation class fineIdServlet
 */
@WebServlet("/fineId.me")
public class FineIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FineIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userNo = request.getParameter("userNo");
		String userPhone = request.getParameter("userPhone");
		
		System.out.println("userName : " + userName);
		System.out.println("userNo : " + userNo);
		System.out.println("userPhone : " + userPhone);
		
		Member member = new Member(userName, userNo, userPhone);
		Member userFineId = new MemberService().fineIdMember(member);
		System.out.println("서비스 : " + userFineId);
	
		if(userFineId != null) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(300);
			session.setAttribute("userFineId", userFineId);
			response.sendRedirect("fineIdForm.me");
		} else {
			response.sendRedirect("failFineIdForm.me");
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
