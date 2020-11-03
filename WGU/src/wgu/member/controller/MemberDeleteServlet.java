package wgu.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wgu.member.model.service.MemberService;
import wgu.member.model.vo.Member;

/**
 * Servlet implementation class memberDeleteServlet
 */
@WebServlet(urlPatterns = "/delete.me", name = "deleteMemberServlet")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//세션에 담긴 아이디 받아오기
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println("Login userId : " + userId);
		System.out.println("Login userPwd : " + userPwd);
		
		//멤버에 아이디와 패스워드 보내기
		Member member = new Member(userId, userPwd);
		int result = new MemberService().deleteMember(member);
		
		PrintWriter writer = response.getWriter();
		if(result > 0) {
			writer.println("<script>alert('회원탈퇴가 성공적으로 완료되었습니다. 이용해주셔서 감사합니다.'); location.href='index.jsp';</script>");
			session.invalidate();//세션 무효화
			writer.close();
		     
		} else {
			writer.println("<script>alert('회원탈퇴 실패 : 비밀번호가 맞지 않습니다.'); location.href='deleteForm.me';</script>");
		    writer.close();
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
