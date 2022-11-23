<%@ page language="java" import="java.sql.*" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%
	String picturepath = null;
	String goodsprice = null;
	String goodsname = null;
	
	String temp = "";
	String str = "";
	
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://localhost:3306/test";
    String username = "root";
    String password = "root1234";
    conn = DriverManager.getConnection(url, username, password);
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
    
    String sql = " SELECT * FROM goods";
    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
    
    while (rs.next()) {
		picturepath = rs.getString("picturepath");
		goodsprice = rs.getString("price");
		goodsname = rs.getString("goodsname");
		
		temp = picturepath + "$";
		str += temp;
		temp = goodsprice + "$";
		str += temp;
		System.out.println(goodsprice);
		temp = goodsname + "$";
		str += temp;
	}
	request.setAttribute("str",str);
	
%>

<html>
  <head>
    <base href="<%=basePath%>">

	<style type="text/css">
		.headtitle{
			font-size:30px;
			font-weight:bold;
			background: linear-gradient(to right,#f0610e, #e8771a, #fff34a);
  			-webkit-background-clip: text;
  			color: transparent;
			margin:10px;
		}
		.mainhead{
			width:99%;
			text-align:center;
			background:rgba(255,255,255,0.4);
			border: 5px solid black;
		}
		.mainbody{
			width:92%;
			height:auto;
			text-align:center;
			border: 5px solid black;
			margin:auto;
			background-color:#73b9a2;
			background:rgba(115,185,162,0.5);
		}
		.img{
			height:50px;
			width:400px;
			vertical-align:middle;
		}
		.atcenter{
			text-align:center;
			vertical-align:middle;
			border: 5px solid red;
		}
		.button{
			height:40px;
			width:100px;
		}
		.searchwindows{	    /*搜索框样式*/
			background:"img/搜索框.png";
			height:50px;
			width:400px;
		}
		.goodslineview{	    /*一行商品摆放样式*/
    		display: flex;
    		justify-content: flex-start;
			background-color:white;
			border: 5px solid black;
			margin:10px;
			background:rgba(255,255,255,0.3);
		}
		.goods{	        /*商品框样式*/
			width:200px;
			height:210px;
			background-color:#d3d7d4;
			border: 5px solid black;
            margin: 30px;
		}
		.goodsimg{	    /*商品图片样式*/
			width:90%;
			height:65%;
			margin:5px;
			border: 2px solid black;
		}
		.goodsprice{	/*商品价格样式*/
			width:90%;
			text-align:left;
			margin:0 auto;
			border: 2px solid black;
			color:red;
		}
		.goodsname{		/*商品名字样式*/
			width:90%;
			text-align:center;
			margin:0 auto;
			margin-top:5px;
			border: 2px solid black;
		}
		.end{
			width:100%;
			height:150px;
			margin-top:0px;
			background-color:#f6f5ec;
			color:#a1a3a6;
			text-align:center;
		    top:50%;   
		    margin-top:50px;  
		}
	</style>
  </head>
  
  <body>
  <div style="background:url(https://ts1.cn.mm.bing.net/th/id/R-C.29cb8799413dda678c0a3196a8ffc12d?rik=YxRQUUH38EBBPQ&riu=http%3a%2f%2fimg.mm4000.com%2ffile%2f6%2f44%2f69b70f99a2.jpg%3fdown&ehk=ErYrGd1gkPOJoyVzebZXD8%2bCXageH8F0KceKv%2bzD8Q8%3d&risl=&pid=ImgRaw&r=0);">
  	<div class="mainhead">
      <div style="height:120px;width: 100%;">
      
      	<form action="search.jsp" method="POST" name="searchForm">
	      <div class="headtitle">5号艾斯医药系统</div>
	      <div class="atcenter">
	        <div style="background-color:#73b9a2;border: 5px solid black;vertical-align:middle;text-align:center;">
	        <a href="./main.jsp" style="text-decoration: none;">
	       	  <img src="img/首页.png" style="vertical-align:bottom;height:50px;width:113px;">
	       	</a>
	       	  	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
	       	  <input type="text" name="name" class="searchwindows">
	       	  	&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
	       	  <button class="button" type="submit" onclick="return search()">搜索</button>
	       	</div>
	      </div>
	  	</form>
	  	
	  </div>
	</div>
	
	&nbsp;
	
	<div class="mainbody">
      	<form method="POST" name="getgoodsForm" id="row">
			<input hidden name="str" value="${str}">
			
			<div class="goodslineview"  id="addhere1">
<!-- 			    在这里添加 -->
			</div>
			
		</form>
	</div>
    </div>
	      
    <div class="end">
  		<br /><br /> 你已到达了世界的尽头<br /><br />
    	<img src="img/end.png" style="width:122px;height:49px;">
    	<br /><br /><br /><br />
    	<a href="login.jsp">退出登录</a>
    	<br /><br />
    </div>
  </body>
  
  <script type="text/javascript">
  	window.onload = getgoods();
	function search() {
		var name = searchForm.name.value;
		if (name == "" || name == null) {
	        alert("请输入关键字进行查询!");
	        searchForm.name.focus();
	        return false;
	    }
	    else
	    {
	     return true;
	    }
	}
    function getgoods() 
    {
    	var i = 0, r = 0, c = 0;
    	var temp = "";
    	var column = 3;
    	var judge = 0;
        var goodslist = [[0]];
        var listrow = [];
        var str = getgoodsForm.str.value;
        
        var tempstr = "";
        var targetrow = 1;
        var targetpage = "addhere" + targetrow;
        var target = document.getElementById(targetpage);
        var row    = document.getElementById("row");
       	
       	for(i=0;i<str.length;i++)
       	{
       		if(str.charAt(i) == "$")
       		{
       			listrow.push(temp);
       			temp = "";
       			c++;
       			if(c==column)
       			{
       				goodslist.push(listrow);
       				listrow = [];
       				r++;
       				c = 0;
       			}
       		}
       		else
       		{
       			temp += str.charAt(i);
       		}
       	}
       	
       	for(i=1;i<=r;i++)
       	{
       		if(judge==1)
       		{
       			judge = 0;
       			tempstr = '<div class="goodslineview"  id="' + targetpage + '"></div>';
       			row.innerHTML += tempstr;
       			target=document.getElementById(targetpage);
       		}
       		
   			tempstr = '<div class="goods"><img src="' + goodslist[i][0] + '" class="goodsimg"><h5 class="goodsprice">￥' +goodslist[i][1]+ '</h5><h4 class="goodsname">' + goodslist[i][2] + '</h4></div>';
   			target.innerHTML += tempstr;
   			if(i%5==0)
       		{
       			judge = 1;	//为1, 准备创建新行
       			targetrow++;
       			targetpage = "addhere" + targetrow;
       		}
       	}
    }
  </script>
  
</html>
