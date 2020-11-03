package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import wgu.bulletin.model.service.BulletinService;
import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Bulletin;
import wgu.bulletin.model.vo.Comments;
import wgu.bulletin.model.vo.PageNum;

/**
 * Servlet implementation class AdminBulletinDetailServlet
 */
@WebServlet("/AdminBulletinDetail.bu")
public class AdminBulletinDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminBulletinDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bNo = request.getParameter("bNo");
		
		BulletinService bService = new BulletinService();
		
		// 게시글 디테일
		Bulletin b = bService.selectBulletin(bNo);
		
		// 이전글
		ArrayList<Bulletin> beforepage = bService.beforeList(bNo);
		
		// 다음글
		ArrayList<Bulletin> afterpage = bService.afterList(bNo);
		
		// 첨부파일 이름가져오기
		ArrayList<Attachment> a = bService.selectAttachment(bNo);
		
		
		// 댓글 페이징
		int listCount;
		int currentPage;
		int pageLimit;
		int commentLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		listCount = bService.getCommentCount(bNo);
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		commentLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount/commentLimit);
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageNum p = new PageNum(currentPage, listCount, pageLimit, commentLimit, maxPage, startPage, endPage);
		
		ArrayList<Comments> comm = bService.selectCommentList(bNo);
		
		
		String page = null;
		if(b != null) {
			page = "WEB-INF/views/Bulletin/AdminBulletinDetail.jsp";
			request.setAttribute("bulletin", b);
			request.setAttribute("comm", comm);
			request.setAttribute("Attach", a);
			request.setAttribute("p", p);
			request.setAttribute("beforepage", beforepage);
			request.setAttribute("afterpage", afterpage);
		} else {
			request.setAttribute("msg", "게시물을 볼 수 없습니다.");
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
