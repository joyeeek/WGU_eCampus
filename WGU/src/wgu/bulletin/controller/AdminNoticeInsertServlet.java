package wgu.bulletin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import wgu.bulletin.model.service.BulletinService;
import wgu.bulletin.model.service.NoticeService;
import wgu.bulletin.model.vo.Attachment;
import wgu.bulletin.model.vo.Bulletin;
import wgu.bulletin.model.vo.Notice;
import wgu.common.MyFileRenamePolicy;

/**
 * Servlet implementation class AdminNoticeInsertServlet
 */
@WebServlet("/AdminNInsert.bu")
public class AdminNoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 * if(ServletFileUpload.isMultipartContent(request)) { int maxSize = 1024 * 1024
		 * * 10;
		 * 
		 * String root = request.getSession().getServletContext().getRealPath("/");
		 * 
		 * String savePath = root + "AttachedFiles/";
		 * 
		 * File f = new File(savePath); if(!f.exists()) { f.mkdirs(); }
		 * 
		 * // 파일이름 바꿔주기 MultipartRequest multiRequest = new MultipartRequest(request,
		 * savePath, maxSize, "UTF-8", new MyRenamePolicy());
		 * 
		 * ArrayList<String> changeFiles = new ArrayList<String>(); ArrayList<String>
		 * originFiles = new ArrayList<String>();
		 * 
		 * Enumeration<String> files = multiRequest.getFileNames();
		 * 
		 * 
		 * while(files.hasMoreElements()) { String name = files.nextElement();
		 * 
		 * if(multiRequest.getFilesystemName(name) != null) {
		 * changeFiles.add(multiRequest.getFilesystemName(name));
		 * originFiles.add(multiRequest.getOriginalFileName(name)); } }
		 * 
		 * // 입력받은 값들 가져오기 String title = multiRequest.getParameter("title"); String
		 * content = multiRequest.getParameter("content"); String writer =
		 * multiRequest.getParameter("n_writer");
		 * 
		 * Notice n = new Notice();
		 * 
		 * n.setMember_no(writer); n.setNoticeTitle(title); n.setNoticeContent(content);
		 * 
		 * 
		 * 
		 * 
		 * // 파일 ArrayList<Attachment> fileList = new ArrayList<Attachment>(); for(int i
		 * = originFiles.size() -1; i >= 0; i--) { Attachment at = new Attachment();
		 * at.setFilePath(savePath); at.setOriginName(originFiles.get(i));
		 * at.setChangeName(changeFiles.get(i));
		 * 
		 * fileList.add(at); }
		 * 
		 * System.out.println("파일이름" + fileList);
		 * 
		 * 
		 * int result = 0;
		 * 
		 * if(fileList.isEmpty()) { result = new NoticeService().insertNotice1(n); }
		 * else { result = new NoticeService().insertNotice2(n, fileList); }
		 * 
		 * if(result > 0) { response.sendRedirect("AdminList.bu"); } else { for(int i =
		 * 0; i <changeFiles.size(); i++) { File failedFile = new File(changeFiles +
		 * changeFiles.get(i)); failedFile.delete(); } request.setAttribute("msg",
		 * "게시물 등록에 실패했습니다");
		 * request.getRequestDispatcher("WEB-INF/views/common/error.jsp").forward(
		 * request, response); }
		 * 
		 * }
		 */
		
		
		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1024 * 1024 * 10; // 파일최대크기지정(넘으면 오류)
			
			
			// 웹서버 Context경로
			String root = request.getSession().getServletContext().getRealPath("/");
			// root >> D:\Project\WGU\WebContent\
			// 첨부파일 저장경로
			String savePath = root + "AttachedFiles/";
			
			// 폴더가 없으면 만들어주게 한다
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			// 파일이름 바꿔주기
			MultipartRequest multiRequest =
					new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
		
			
			ArrayList<String> changeFiles = new ArrayList<String>(); // 바뀐 파일의 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); // 원본 파일의 이름을 저장할 ArrayList
			
			Enumeration<String> files = multiRequest.getFileNames(); // getFileNames : form에서 전송된 파일list들의 이름을 나열
			
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multiRequest.getFilesystemName(name) != null	) {
					
					// 바뀐이름을 넣는다
					changeFiles.add(multiRequest.getFilesystemName(name));
					// 원래넣을때의 이름을 넣는다
					originFiles.add(multiRequest.getOriginalFileName(name));
					//=============================================================여기까지 파일을 가져온것
				}
			}
			
			
			
			String title = multiRequest.getParameter("title"); 
			String content = multiRequest.getParameter("content"); 
			String writer = multiRequest.getParameter("n_writer");
			
			Notice n = new Notice();
			
			n.setNoticeTitle(title);
			n.setNoticeContent(content);
			n.setMember_no(writer);
			
			
			
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			// 파일 역순으로 저장된것을 다시 돌려주는것
			for(int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(changeFiles.get(i));
				
				fileList.add(at);
			}
			
	//=================================================================================파일정리 완료
				
				int result = 0;
				
				if(fileList.isEmpty()) {
					result = new NoticeService().insertNotice1(n);
				} else {
					result = new NoticeService().insertNotice2(n,fileList);
				}
				
				
				if(result > 0) {
					response.sendRedirect("AdminNoticeList.nr");
				} else {
					// 실패는 insert가 안됐다는것
					// 실패하더라도 파일은 저장이 되기때문에 그것을 방지하기 위해 파일삭제시킨다
					for(int i = 0; i < changeFiles.size(); i++) {
						File failedFile = new File(changeFiles + changeFiles.get(i));
						failedFile.delete();
					}
	
					request.setAttribute("msg", "공지등록에 실패했습니다");
					request.getRequestDispatcher("WEB-INF/views/common/error.jsp").forward(request, response);
					
				}
				
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
