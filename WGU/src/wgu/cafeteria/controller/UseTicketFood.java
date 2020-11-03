package wgu.cafeteria.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.cafeteriamenu.ticket.model.service.CafeteriaTicketService;
import wgu.cafeteriamenu.ticket.model.vo.CafeteriaTicket;
import wgu.member.model.vo.Member;

/**
 * Servlet implementation class UseTicketFood
 */
@WebServlet("/use.ticketFood")
public class UseTicketFood extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UseTicketFood() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		int ticketNo = Integer.parseInt(request.getParameter("inputCafeTitle"));
		String useYN = request.getParameter("inputCafeTitle1");
		
		CafeteriaTicket cafeteriaTicket = new CafeteriaTicket(ticketNo, memberNo, useYN);
		int result = new CafeteriaTicketService().updateCafeteriaTicket(cafeteriaTicket);
		
		if(result > 0) {
			request.setAttribute("cafeteriaTicket", cafeteriaTicket);
			request.getRequestDispatcher("WEB-INF/views/cafeteria/useCafeTicketEnd.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "식권사용 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
