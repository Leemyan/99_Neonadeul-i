package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
					
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("phone");
		// Date birth = request.getParameter("birth");
		//Date[] birthArr = request.getParameter("birth");
		/*
		String birth = "";
		if(birthArr != null) {
			birth = String.join("/", birthArr);
		}
		*/
		Member m = new Member(userName, email, userPwd, phone);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0){
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg","성공적으로 회원가입이 되었습니다.");
			
			response.sendRedirect(request.getContextPath());
			
		} else {
			request.setAttribute("errorMsg", "회원가입에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
			view.forward(request, response);
		}
		
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
