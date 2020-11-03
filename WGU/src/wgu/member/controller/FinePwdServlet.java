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
 * Servlet implementation class finePwdServlet
 */
@WebServlet("/finePwd.me")
public class FinePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("pwdUserId");
		String userName = request.getParameter("pwdUserName");
		String userPhone = request.getParameter("pwdUserPhone");
		
		System.out.println("pwdUserId : " + userId );
		System.out.println("pwdUserName : " + userName);
		System.out.println("pwdUserPhone : " + userPhone);
		
		Member member = new Member(userId, userName, userPhone);
		Member userFinePwd = new MemberService().finePwdMember(member);
		System.out.println("서비스 : " + userFinePwd);
	
		if(userFinePwd != null) {
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(300);
			session.setAttribute("userFinePwd", userFinePwd);
			response.sendRedirect("finePwdForm.me");
		} else {
			response.sendRedirect("failFinePwdForm.me");
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
