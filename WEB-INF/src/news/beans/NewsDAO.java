package news.beans;
import java.util.ArrayList;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
public class NewsDAO{
	public ArrayList<News>getAllNews(){
		News news=null;
		ArrayList<News>newsList=new ArrayList<News>();

		Connection conn=null;
		ResultSet rs=null;
		Statement stmt=null;
		try{
			conn=DBGet.getConnection();
			stmt=conn.createStatement();
			String sql="SELECT * from news";
			rs=stmt.executeQuery(sql);

			while(rs.next()){
				news=new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setAuthor(rs.getString("author"));
				news.setPubtime(rs.getString("pubtime"));
				news.setKeyword(rs.getString("keyword"));
				news.setAcnumber(rs.getInt("acnumber"));

				newsList.add(news);
			}
		}catch(SQLException el){
			System.out.println(el+"dao");
		}finally{
			DBGet.closeConnection(conn);
		}
		return newsList;
	}

	public boolean insert(News news){
		boolean result=false;
		int n=0;
		news.setPubtime(getNowStr());
		Connection conn=null;
		Statement stmt=null;
		try{
			conn=DBGet.getConnection();
			stmt=conn.createStatement();
			String sql="insert into news(title,content,author,pubtime,keyword,newstype)"+"values('"+news.getTitle()+"','"+news.getContent()+"','"+news.getAuthor()+"','"+news.getPubtime()+"','"+news.getKeyword()+"','"+news.getNewstype()+"')";
			n=stmt.executeUpdate(sql);
		}catch(SQLException el){
			System.out.println(el+"dao");
		}finally{
			DBGet.closeConnection(conn);
		}
		if(n>0)
			result=true;
		return result;
	}
	static public String getNowStr(){
		String resultStr=null;
		String pattern="yyyy-MM-dd HH:mm:ss";
			Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat(pattern);
		try{
			resultStr=sdf.format(date);
		}catch(Exception e){e.printStackTrace();}
		return resultStr;
	}
	public News getByID(String id){
		News news=null;
		Connection conn=null;
		ResultSet rs=null;
		Statement stmt=null;
		try{
			conn=DBGet.getConnection();
			stmt=conn.createStatement();
			String sql="SELECT * FROM news where id="+id;
			rs=stmt.executeQuery(sql);
			if(rs.next()){
				news=new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setAuthor(rs.getString("author"));
				news.setPubtime(rs.getString("pubtime"));
				news.setKeyword(rs.getString("keyword"));
				news.setAcnumber(rs.getInt("acnumber"));
				news.setNewstype(rs.getInt("newstype"));
			}
		}catch(SQLException el){
			System.out.println(el+"dao");
		}finally{
			DBGet.closeConnection(conn);
		}
		return news;
	}
	public boolean modify(News news){
		boolean result=false;
		int n=0;
		Connection conn=null;
		Statement stmt=null;
		String sql=null;
		try{
			conn=DBGet.getConnection();
			stmt=conn.createStatement();
			sql="update news set title='"+news.getTitle()+"',content='"+news.getContent()+"',author='"+news.getAuthor()+"',pubtime='"+news.getPubtime()+"',keyword='"+news.getKeyword()+"',acnumber='"+news.getAcnumber()+"',newstype="+news.getNewstype()+" where id="+news.getId();
			n=stmt.executeUpdate(sql);
		}catch(SQLException el){
			System.out.println(el+"dao:"+sql);
		}finally{
			DBGet.closeConnection(conn);
		}
		if(n>0)
			result=true;
		return result;
	}
	public ArrayList<News>getByKeyword(String keyword){
		News news=null;
		ArrayList<News>newsList=new ArrayList<News>();

		Connection conn=null;
		ResultSet rs=null;
		Statement stmt=null;
		try{
			conn=DBGet.getConnection();
			stmt=conn.createStatement();
			String sql="SELECT * from news where keyword='"+keyword+"'";
			rs=stmt.executeQuery(sql);

			while(rs.next()){
				news=new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setContent(rs.getString("content"));
				news.setAuthor(rs.getString("author"));
				news.setPubtime(rs.getString("pubtime"));
				news.setKeyword(rs.getString("keyword"));

				newsList.add(news);
			}
		}catch(SQLException el){
			System.out.println(el+"dao");
		}finally{
			DBGet.closeConnection(conn);
		}
		return newsList;
	}
	public boolean delete(String id){
		int n=0;
		Connection conn=null;
		ResultSet rs=null;
		Statement stmt=null;
		String sql=null;
		try{
			conn=DBGet.getConnection();
			stmt=conn.createStatement();
			sql="delete  from news where id="+id;
			n=stmt.executeUpdate(sql);
		}catch(SQLException el){
			System.out.println(el+"dao:"+sql);
		}finally{
			DBGet.closeConnection(conn);
		}
		if(n>0)
			return true;
		return false;	
	}
}