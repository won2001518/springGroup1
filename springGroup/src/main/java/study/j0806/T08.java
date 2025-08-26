package study.j0806;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings({"serial","deprecation"})
@WebServlet("/j0806/T08")
public class T08 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		// null체크처리하기
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String job = request.getParameter("job");
		String[] mountains = request.getParameterValues("mountain");
		String content = request.getParameter("content");
		String fileName = request.getParameter("fileName");
		
		// 정상적으로 넘어왔는지를 서버에서 체크(찍어본다.)
		System.out.println("성명 : " + name);
		System.out.println("나이 : " + age);
		System.out.println("성별 : " + gender);
		
		// 배열로 넘어오는 자료의 편집

		// 취미 편집
		String hobby = "";
		if(hobbys != null) {
			for(String h : hobbys) {
				hobby += h + "/";
			}
			hobby = hobby.substring(0, hobby.length()-1);
		}
		System.out.println("취미 : " + hobby);
		System.out.println("직업 : " + job);
		
		// 가본산 편집
		String mountain = "";
		if(hobbys != null) {
			for(String m : mountains) {
				mountain += m + "/";
			}
			mountain = mountain.substring(0, mountain.length()-1);
		}
		System.out.println("mountain : " + mountain);
		System.out.println("자기소개 : " + content);
		System.out.println("파일명 : " + fileName);
		
		// 서버에 정상적으로 처리된 자료(찍어본 자료)를 View(JSP)페이지로 전송시켜서 예쁘게 출력시켜준다.
		content = content.replace("\n", "<br/>");
		
		response.sendRedirect(request.getContextPath()+"/study/0806/t08Ok.jsp?name="+URLEncoder.encode(name)+"&age="+age+"&gender="+URLEncoder.encode(gender)+"&hobby="+URLEncoder.encode(hobby)+"&job="+URLEncoder.encode(job)+"&mountain="+URLEncoder.encode(mountain)+"&content="+URLEncoder.encode(content)+"&fileName="+URLEncoder.encode(fileName));
	}
	
}
