package wgu.bulletin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import wgu.bulletin.model.service.BulletinService;
import wgu.bulletin.model.vo.Comments;

/**
 * Servlet implementation class CommentInsertServlet
 */
@WebServlet("/insertComment.bu")
public class CommentInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 로그인 유저 받아오기
		/* String writer = */
		String bNo = request.getParameter("bNo");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		String nick = request.getParameter("nick");
		
		Comments c = new Comments();
		
		c.setBulletinNo(bNo);
		c.setComments(content);
		c.setMemberNo(writer);
		c.setCommentsNick(nick);
		
		
		
		ArrayList<Comments> list = new BulletinService().insertComments(c);
		
		response.setContentType("application/json; charset=UTF-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
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
