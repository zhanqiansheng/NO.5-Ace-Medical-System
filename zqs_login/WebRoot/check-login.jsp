<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/test";
    String username = "root";
    String password = "root1234";
    conn = DriverManager.getConnection(url, username, password);
    request.setCharacterEncoding("UTF-8");
    String name = request.getParameter("name");
    String pwd = request.getParameter("password");
    String sql = " SELECT * FROM usr WHERE username = '"+name+"' AND password = '"+pwd+"'";
    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
    if(name!=null){
	    if (rs.next()) {
	        response.sendRedirect("../zqs_login/succeed.jsp");
	    }else{
	    	out.print("登陆失败！账号/密码错误！"+"请重新<a href=\"login.jsp\">登录</a>");
	    }
    }
%>
