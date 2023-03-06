package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class FindIdController
 */
@WebServlet("/find.id")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		request.getRequestDispatcher("views/member/findIdForm.jsp").forward(request, response);
		System.out.println("controller 탔나?");
		
		
		String userName = request.getParameter("userName");
		String phone = request.getParameter("phone");
		
		String Id = new MemberService().findId(userName, phone);
		
		System.out.println("컨트롤러 id = "+Id);
		if(Id == null) { // 조회실패
			
			request.setAttribute("errorMsg", "아이디찾기 실패! 아직 회원이 아니시라면 가입 후 시도해주세요.");
			response.sendRedirect(request.getContextPath());
			return;
		} else { // 조회성공
			RequestDispatcher view = request.getRequestDispatcher("views/member/findIdView.jsp");
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
