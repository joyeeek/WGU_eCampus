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
 * Servlet implementation class CafeteriaTicket
 */
@WebServlet("/buy.foodTicket")
public class CafeteriaTicketBuy extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CafeteriaTicketBuy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		String todayMenuTitle = request.getParameter("inputCafeTitle");
		
		CafeteriaTicket cafeteriaTicket = new CafeteriaTicket(memberNo, todayMenuTitle);
		System.out.println(cafeteriaTicket);
		int result = new CafeteriaTicketService().insertCafeteriaTicket(cafeteriaTicket);
		
		
		if(result > 0) {
			request.setAttribute("cafeteriaTicket", cafeteriaTicket);
			request.getRequestDispatcher("WEB-INF/views/cafeteria/insertCafeteriaEnd.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "식권 구매 실패");
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
