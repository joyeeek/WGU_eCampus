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

import wgu.bulletin.model.service.BulletinService;
import wgu.bulletin.model.vo.Attachment;

/**
 * Servlet implementation class AttachmentDeleteServlet
 */
@WebServlet("/BulletinAttachmentDelete.at")
public class BulletinAttachmentDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BulletinAttachmentDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String fileId = request.getParameter("fileId");
		String changeName = request.getParameter("changeName");
		String bNo = request.getParameter("bNo");
		
		// 파일을 저장한 경로
		String root = request.getSession().getServletContext().getRealPath("/");
		String savePath = root + "AttachedFiles/";
		
		int result = new BulletinService().deleteAttachment(fileId, bNo);
		
		ArrayList<Attachment> list = new BulletinService().selectAttachment(bNo);
		
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
