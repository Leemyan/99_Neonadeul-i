package src.com.kh.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import src.com.kh.member.model.service.MemberService;
import src.com.kh.member.model.vo.Member;



/**
 * Servlet implementation class FindIdViewController
 */
@WebServlet("/view.id")
public class FindIdViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdViewController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userName = request.getParameter("userName");
		
		Member findId = new MemberService().findId(userName);
		
		if(findId == null) { // 조회실패
			request.setAttribute("errorMsg", "아이디찾기 실패! 아직 회원이 아니시라면 가입 후 시도해주세요.");
			
		} else { // 조회성공
			RequestDispatcher view = request.getRequestDispatcher("views/member/findIdView.jsp");
			view.forward(request, response);
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
