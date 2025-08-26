package study2.exam;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet("/study2/exam/LoginOk")
public class LoginOk extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String idSave = request.getParameter("idSave")==null ? "off" : "on";
		
		LoginDAO dao = new LoginDAO();
		
		LoginVO vo = dao.getLoginIdCheck(mid, pwd);
		//System.out.println("vo : " + vo);
		
		PrintWriter out = response.getWriter();
		
		if(vo.getMid() != null) {
			// 정상적으로 인증이 확인되었다면 아이디를 쿠키에 저장할시 판별한다.
			Cookie cookieMid = new Cookie("cMid", mid);
			cookieMid.setPath("/");
			if(idSave.equals("on")) cookieMid.setMaxAge(60*60*24*7);
			else cookieMid.setMaxAge(0);
			response.addCookie(cookieMid);
			
			// 로그인중에 항상 기억하고자 하는 값이 있다면 세션에 저장처리한다.(아이디,닉네임)
			HttpSession session = request.getSession();
			session.setAttribute("sMid", mid);
			session.setAttribute("sNickName", vo.getNickName());
			
//			String viewPage = "/WEB-INF/study2/login/loginMain.jsp";
//			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
//			dispatcher.forward(request, response);
			
			out.println("<script>");
			out.println("alert('"+mid+"님 로그인 되셨습니다.');");
			out.println("location.href='"+request.getContextPath()+"/study2/exam/LoginMain';");
			out.println("</script>");
		}
		else {
			out.println("<script>");
			out.println("alert('로그인 실패~~');");
			out.println("location.href='"+request.getContextPath()+"/study2/exam/Login';");
			out.println("</script>");
		}
	}
	
}
