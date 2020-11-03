package wgu.bulletin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import wgu.bulletin.model.service.NoticeService;
import wgu.bulletin.model.vo.Attachment;

/**
 * Servlet implementation class NoticeAttachmentDeleteServlet
 */
@WebServlet("/NoticeAttachmentDelete.at")
public class NoticeAttachmentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAttachmentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileId = request.getParameter("fileId");
		String changeName = request.getParameter("changeName");
		String nNo = request.getParameter("nNo");
		
		// 파일을 저장한 경로
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "AttachedFiles/";
		
		int result = new NoticeService().deleteAttachment(fileId, nNo);
		
		ArrayList<Attachment> list = new NoticeService().selectAttachment(nNo);
		
		System.out.println(list);
		
		if(result > 0) {
			File deleteFile = new File(savePath + changeName);
			deleteFile.delete();	
			
		}
		
		response.setContentType("application/json; charset=UTF-8");
		
		new Gson().toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
