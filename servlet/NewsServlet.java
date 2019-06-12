package news.servlet;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import news.beans.News;
import news.beans.NewsDAO;

public class NewsServlet extends HttpServlet{
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<News>newsList=new ArrayList<News>();
		NewsDAO newsDAO=new NewsDAO();

		String func=request.getParameter("action");
		if(func==null){
			func="";
		}
		if(func.equals("query")){
			String keyword=request.getParameter("keyword");
			keyword=new String(keyword.getBytes("UTF-8"),"utf-8");
			newsList=newsDAO.getByKeyword(keyword);
			request.setAttribute("newsList",newsList);
			request.getRequestDispatcher("listNews.jsp").forward(request,response);
		}else{
			newsList=newsDAO.getAllNews();
			request.setAttribute("newsList",newsList);
			request.getRequestDispatcher("listNews.jsp").forward(request,response);
		}
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}
}