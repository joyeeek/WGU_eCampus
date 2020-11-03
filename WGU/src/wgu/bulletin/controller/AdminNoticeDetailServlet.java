package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bulletin.model.service.NoticeService;
import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Notice;

/**
 * Servlet implementation class AdminNoticeDetailServlet
 */
@WebServlet("/AdminNoticeDetail.nr")
public class AdminNoticeDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nNo = request.getParameter("nNo");
		
		// 첨부파일/공지사항글들 가져오기
		NoticeService nService = new NoticeService();
		
		// 공지사항글 가져오기
		Notice notice = nService.selectNotice(nNo);
		
		// 첨부파일 가져오기
		ArrayList<Attachment> a = nService.selectAttachment(nNo);
		
		// 이전글 가져오기
		ArrayList<Notice> beforepage = nService.beforeList(nNo);
		// 다음글 가져오기
		ArrayList<Notice> afterpage = nService.afterList(nNo);
		
		
		String page = null;
		if(notice != null) {
			request.setAttribute("notice", notice);
			request.setAttribute("attachment", a);
			request.setAttribute("beforepage", beforepage);
			request.setAttribute("afterpage", afterpage);
			page = "WEB-INF/views/Bulletin/AdminNoticeDetail.jsp";
		} else {
			request.setAttribute("msg", "공지사항 보기 실패");
			page = "WEB-INF/views/common/error.jsp";
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
