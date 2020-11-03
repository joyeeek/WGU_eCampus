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
 * Servlet implementation class loginServlet
 */
@WebServlet(urlPatterns = "/memberLogin.me", name = "loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String wguId = request.getParameter("wguId");
		String wguPwd = request.getParameter("wguPwd");
		
		System.out.println("Login wguId : " + wguId);
		System.out.println("Login wguPwd : " + wguPwd);
		
		Member member = new Member(wguId, wguPwd);
		Member loginUser = new MemberService().loginMember(member);
		
		
		//회원가입이 되어있으면
		if(loginUser != null) {
			//세션의 영역사용 -->브라우저 관리하는 영역사용
			HttpSession session = request.getSession();
			//세션 유효시간 설정하기 ->기본 30분이라 설정안해도되서 일단 주석처리
			/* session.setMaxInactiveInterval(18000); */
			
			//세션에 객체에 받아온 정보 담기
			session.setAttribute("loginUser", loginUser);
			
			//뷰에게 보내야할 데이터가 있지만 세션에 담았기때문에 forward를 쓰지 않아도됨 
			//그렇기 때문에 
			response.sendRedirect("index.jsp");
		} else {
			PrintWriter writer = response.getWriter();
			writer.println("<script>alert('입력한 정보가 올바르지 않습니다.'); location.href='loginForm.me';</script>");
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
