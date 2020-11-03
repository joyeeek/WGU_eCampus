package wgu.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import wgu.bus.model.service.BusService;
import wgu.bus.model.vo.Bus;
import wgu.cafeteriamenu.ticket.model.service.CafeteriaTicketService;
import wgu.cafeteriamenu.ticket.model.vo.CafeteriaTicket;
import wgu.member.model.vo.Member;

/**
 * Servlet implementation class memberMyPageServlet
 */
@WebServlet("/memberMyPage.me")
public class MemberMyPageServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {   
	   HttpSession session = request.getSession();
	   String memberNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
      //다정 서블릿
      ArrayList<CafeteriaTicket> cafeList = new CafeteriaTicketService().selectList(memberNo);    
      
      //지원서블릿
      ArrayList<Bus> busList = new BusService().selectList(memberNo);
      System.out.println(busList);
      
      request.setAttribute("cafeList", cafeList);
      request.setAttribute("busList", busList);      
	  request.getRequestDispatcher("WEB-INF/views/member/myPage.jsp").forward(request, response);         
	  
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}