package wgu.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.member.model.service.MemberService;
import wgu.member.model.vo.Member;

/**
 * Servlet implementation class insertMemberServlet
 */
@WebServlet(urlPatterns = "/insert.me", name = "insertMemberServlet")
public class InsertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userNo = request.getParameter("userNo");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("userName");

		String years = request.getParameter("years");
		String month = request.getParameter("month");
		String day = request.getParameter("days");
		
		//month와 day가 10이하이면 앞에 0을 붙여주기
		/*
		 * if(month > '10') { String bMonth = String.format("%02d","month"); } if(day >
		 * 10) { String bDays = String.format("%02d","days"); }
		 */
		
		//위의 선택한 생년월일 한꺼번에 가져오기
		String userBirthDay = years + month + day;
		
		String gender = request.getParameter("gender");
		String userEmail = request.getParameter("userEmail");
		String userAddress = request.getParameter("userAddress");
		String userPhone = request.getParameter("userPhone");
		String userGrade = request.getParameter("userGrade");
		String userGroup = request.getParameter("userGroup");
		String department = request.getParameter("department");
		
		
	
		
		//member에 넘겨주기
		Member member = new Member(userNo, userId, userPwd, userName, userBirthDay, gender, userEmail, userAddress, userPhone, userGrade, userGroup, department);
	
		int result = new MemberService().insertMember(member);
		
		PrintWriter writer = response.getWriter();
		if(result > 0) {
			writer.println("<script>alert('회원가입이 성공적으로 완료되었습니다.<br>로그인화면으로 이동합니다.'); location.href='loginForm.me';</script>");
		    writer.close();
		} else {
			writer.println("<script>alert('회원가입이 정상적으로 이루어지지 않았습니다.'); location.href='goSignUp.me';</script>");
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
