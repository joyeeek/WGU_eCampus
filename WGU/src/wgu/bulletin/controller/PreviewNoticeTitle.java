package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import wgu.bulletin.model.service.NoticeService;
import wgu.bulletin.model.vo.Notice;

/**
 * Servlet implementation class PriviewNoticeTitile
 */
@WebServlet("/PreviewNotice")
public class PreviewNoticeTitle extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreviewNoticeTitle() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pageLimit; // 한페이지에 표시될 페이징 갯수
		
		pageLimit = 5;
		
		ArrayList<Notice> list = new NoticeService().previewNotice(pageLimit);
		
		
		Gson gson = new Gson();
		
		gson.toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
