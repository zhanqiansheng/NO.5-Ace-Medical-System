<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    PreparedStatement pd = null;
    ResultSet cz = null;
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/test";
    String username = "root";
    String password = "root1234";
    conn = DriverManager.getConnection(url, username, password);
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String sjk="select * from usr where username='"+name+"';";
    pd = conn.prepareStatement(sjk);
    cz = pd.executeQuery();


        if(name!=null){
    		if(cz.next()){
				out.print("用户已经存在！"+"请<a href=\"login.jsp\">登录</a>");
			}
	    	else{
	    	    String pwd = request.getParameter("password");
			    String sql = "INSERT INTO usr(username,password) VALUES('" + name + "','" + pwd + "');";
			    ps = conn.prepareStatement(sql);
			    int rs=ps.executeUpdate();
			    response.sendRedirect("./registersucceed.jsp");
	    	}
		}
%>
