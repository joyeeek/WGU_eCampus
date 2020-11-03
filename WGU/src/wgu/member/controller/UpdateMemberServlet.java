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
 * Servlet implementation class updateMemberServlet
 */
@WebServlet(urlPatterns = "/update.me", name = "updateMemberServlet")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
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

	int result = new MemberService().updateMember(member);
	PrintWriter writer = response.getWriter();
	if(result > 0) {
		writer.println("<script>alert('정보수정이 성공적으로 완료되었습니다.'); location.href='memberMyPage.me';</script>");
	    writer.close();
	} else {
		writer.println("<script>alert('정보수정이 정상적으로 이루어지지 않았습니다.'); location.href='memberMyPage.me';</script>");
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
