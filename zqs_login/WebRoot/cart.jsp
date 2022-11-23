<%@ page language="java" import="java.sql.*" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/test";
    String username = "root";
    String password = "root1234";
    Connection conn = DriverManager.getConnection(url, username, password);   //通过url连接数据库
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    Statement statement = conn.createStatement();    //获取可执行sql语句的对象
    String sql = "SELECT * FROM goods";    //sql语句，遍历数据表的参数
    ResultSet rs = statement.executeQuery(sql);    //执行sql语句并将数据表返回给ResultSet
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车管理</title>
    <link rel="stylesheet" href="cart.css" type="text/css">
</head>

<body>
    <div class="wrap clearfix">
        <div class="location">当前位置：首页<span>&gt;</span><b class="red">购物车</b></div>
        <table width="100%" class="cartTable" cellspacing="0" cellpadding="10px">
            <!-- 首行 -->
            <tr class="title">
                <td width="50"><input type="checkbox" name="" class="choose_all"></td>
                <td width="100" class=""><span style="margin-left: -10px;">全选</span></td>
                <td width="400">商品信息</td>
                <td width="150">单价（元）</td>
                <td width="150">数量</td>
                <td width="150">金额（元）</td>
                <td width="80">操作</td>
            </tr>

            <!-- 商品具体信息 -->
            <% while (rs.next()) { %>
            <tr class="row">
                <td><input type="checkbox" name="" class="choose"></td>
                <td class="tal"><a href="#" class="pic"><img src= '
                <%=rs.getString("picturepath")%>
                '></a></td>
                <td class="tal"><a href="#"><%=rs.getString("goodsname")%></a></td>
                <td>
                    <span class="unit"><%=rs.getFloat("price")%></span>
                </td>
                <td>
                    <div class="amount">
                        <a href="#" class="Increase">+</a>
                        <input type="text" value="1" class="unum">
                        <a href="#" class="Reduce">-</a>
                    </div>
                </td>
                <td><b class="u-price"><%=rs.getFloat("price")%></b></td>
                <td><a href="#" class="btn-del">删除</a></td>
            </tr>
            <% } %>
            

            <tr class="count">
                <td colspan="7">
                    <div class="jiesuan clearfix">
                        <div class="left fl">
                            <p><input type="checkbox" name="" class="choose_all"> 全选&nbsp;&nbsp;&nbsp;<a href="#" class="del_check">删除选中商品</a></p>
                        </div>
                        <div class="right fr clearfix">
                            <p>已选商品<span class="red t-number"> 0 </span>件 总价(不含运费、税费)：<span class="red t-price">￥0.00</span></p>
                            <!-- <div><a href="#" class="btn pay">结算</a></div> -->
                            <a href="#" class="btn pay fr">结算</a>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>    

    <!-- 引入JS文件 -->
    <script language='javascript' src='cart.js'></script>
</body>

</html>