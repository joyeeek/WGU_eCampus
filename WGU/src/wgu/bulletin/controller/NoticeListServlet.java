package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bulletin.model.service.NoticeService;
import wgu.bulletin.model.vo.Notice;
import wgu.bulletin.model.vo.PageNum;

/**
 * Servlet implementation class NoticeListServlet
 */
@WebServlet("/NoticeList.nr")
public class NoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이징
		NoticeService nService = new NoticeService();
		
		int listCount; // 총 공지글 갯수
		int currentPage; // 현재보고있는페이지
		int pageLimit; // 우리가 볼 페이징수(1~5)(6~10)
		int noticeLimit; // 한페이지에 나타낼 공지글 갯수
		int maxPage; // 전체 페이지중 가장 마지막페이지
		int startPage; // 페이징 시작페이지
		int endPage; // 페이징 마지막 페이지
		
		
		// 총 공지글 갯수 구하기
		listCount = nService.getListCount();
		
		currentPage = 1;
		//페이징 번호 눌렀을때 값이 null이 아니면(페이지를 눌렀다) >> URL로 보내줄것
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 각 페이지별 나타나는 공지글갯수 + 페이징수
		pageLimit = 5;
		noticeLimit = 10;
		/*
		 * listCount = 11 / noticeLimit = 10
		 * 7/10 = 0.7 -> 1페이지
		 * 10/10 = 1.0 -> 1페이지
		 * 11/10 = 1.1 -> 2페이지
		 */
		
		maxPage = (int)Math.ceil((double)listCount/noticeLimit);
		
		
		// 페이징 정리
		// startPage는 1, 11, 21, 31.....
		// 1~10 -> n = 0 / 11~20 -> n = 1 / 21~30 -> n = 2 이기때문에
		// 현재페이지 - 1을 해줘야한다  = n
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageNum p = new PageNum(currentPage, listCount, pageLimit, noticeLimit, maxPage, startPage, endPage);
		
		ArrayList<Notice> list = nService.selectList(p);
		
		String page = null;
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("p", p);
			page = "WEB-INF/views/Notice/NoticeList.jsp";
		} else {
			request.setAttribute("msg", "공지사항게시판에 들어갈 수 없습니다.");
			page = "WEB-INF/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
