

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnection;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mchange.v2.c3p0.impl.DbAuth;

/**
 * Servlet implementation class FindCity
 */
@WebServlet("/findCity.do")
public class FindCity extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindCity() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//接受请求的参数
		String pidstr = request.getParameter("pid");
		int pid = Integer.parseInt(pidstr);
		List<Area> list = new ArrayList<Area>();
		//语句
		String sql = "select * from area where  pid = ?";
		Connection connection = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
		    pstmt.setInt(1, pid);
		    ResultSet rs  = pstmt.executeQuery();
		    while(rs.next()){
		    	Area a = new Area();
		    	a.setAid(rs.getInt("aid"));
		    	a.setAname(rs.getString("aname"));
		    	a.setPid(rs.getInt("pid"));
		    	list.add(a);
		    }
		    ObjectMapper om = new ObjectMapper();
		    String s = om.writeValueAsString(list);
		    System.out.println(s);
		    response.getWriter().write(s);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
