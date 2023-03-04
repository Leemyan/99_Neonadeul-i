package com.kh.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalTime;

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
 * Servlet implementation class AdminPageController
 */
@WebServlet("/delete.me")
public class deleteMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteMemberController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 탐. 야호");
		String email = request.getParameter("email");
		String userpwd = request.getParameter("userpwd");
		
		
		
		Member deleteMem = new MemberService().deleteMember(email, userpwd);
		HttpSession session = request.getSession();
		System.out.println("컨트롤러 deleteMem = " + deleteMem);
		
		if(deleteMem == null) {
			System.out.println("탈퇴실패");
			System.out.println("회원탈퇴에 실패했습니다.");
			response.sendRedirect(request.getContextPath() + "/mypage.me");
			
		} else {
			System.out.println("탈퇴성공");
			session.setAttribute("alertMsg", "성공적으로 탈퇴했습니다. 그동안 이용해주셔서 감사합니다.");
			response.sendRedirect(request.getContextPath());
			
		}
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
