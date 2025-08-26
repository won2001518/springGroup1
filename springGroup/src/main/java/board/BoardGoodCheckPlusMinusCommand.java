package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.CommonInterface;

public class BoardGoodCheckPlusMinusCommand implements CommonInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = (request.getParameter("idx")==null || request.getParameter("idx").equals("")) ? 0 : Integer.parseInt(request.getParameter("idx"));
		int gooCnt = (request.getParameter("gooCnt")==null || request.getParameter("gooCnt").equals("")) ? 0 : Integer.parseInt(request.getParameter("gooCnt"));
		
		BoardDAO dao = new BoardDAO();
		
		// 좋아요 1씩 증가시키기
		int res = dao.setBoardGoodCheckPlusMinus(idx, gooCnt);
		
		response.getWriter().write(res + "");
	}

}
