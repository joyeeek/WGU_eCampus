package wgu.subject.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import wgu.subject.model.service.SubjectService;
import wgu.subject.model.vo.Subject;

/**
 * Servlet implementation class ApplySubjectFormServlet
 */
@WebServlet("/apply.su")
public class ApplySubjectFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ApplySubjectFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subjectType = request.getParameter("subjectType");   // 전공구분
		String subjectMajor = request.getParameter("subjectMajor"); // 학과
		String subjectName = request.getParameter("subjectName");   // 과목명		
		
		if(subjectType.equals("없음") && subjectMajor.equals("없음") && subjectName.equals("")) {
			// JSP 페이지 내에서 ERROR ALERT창 띄우기(항목을 하나 이상 입력해주세요)
		} else if(!subjectType.equals("없음") && subjectMajor.equals("없음") && subjectName.equals("")) { // 전공탭만 입력
			ArrayList<Subject> searchList = new SubjectService().selectType(subjectType);
			response.setContentType("application.json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(searchList, response.getWriter());
			
		} else if(subjectType.equals("없음") && !subjectMajor.equals("없음") && subjectName.equals("")) { // 학과만 입력
			ArrayList<Subject> searchList = new SubjectService().selectMajor(subjectMajor);
			response.setContentType("application.json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(searchList, response.getWriter());
		} else if(subjectType.equals("없음") && subjectMajor.equals("없음") && !subjectName.equals("")) { // 과목명만 입력
			ArrayList<Subject> searchList = new SubjectService().selectSubjectName(subjectName);
			response.setContentType("application.json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(searchList, response.getWriter());
		} else if(!subjectType.equals("없음") && !subjectMajor.equals("없음") && subjectName.equals("")) { // 전공탭, 학과
			ArrayList<Subject> searchList = new SubjectService().selectTypeMajor(subjectType,subjectMajor);
			response.setContentType("application.json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(searchList, response.getWriter());
		} else if(subjectType.equals("없음") && !subjectMajor.equals("없음") && !subjectName.equals("")) { // 학과, 과목명
			ArrayList<Subject> searchList = new SubjectService().selectMajorSub(subjectMajor,subjectName);
			response.setContentType("application.json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(searchList, response.getWriter());
		} else if(!subjectType.equals("없음") && subjectMajor.equals("없음") && !subjectName.equals("")) { // 전공탭, 과목명
			ArrayList<Subject> searchList = new SubjectService().selectTypeSub(subjectType,subjectName);
			response.setContentType("application.json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(searchList, response.getWriter());
		} else if(!subjectType.equals("없음") && !subjectMajor.equals("없음") && !subjectName.equals("")) { // 모두 입력
			ArrayList<Subject> searchList = new SubjectService().selectTypeMajorSub(subjectType, subjectMajor, subjectName);
			response.setContentType("application.json; charset=UTF-8");
			
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(searchList, response.getWriter());
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
