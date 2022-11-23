<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
	<head>
		<title>登录界面</title>
		<style type="text/css">
			.headtitle{
				width:99%;
				font-size:30px;
				font-weight:bold;
				background: linear-gradient(to right,#f0610e, #e8771a, #fff34a);
	  			-webkit-background-clip: text;
	  			color: transparent;
				margin:10px;
				margin-top:150px;
				margin-bottom:50px;
			}
			.mainhead{
				width:99%;
				height:700px;
				text-align:center;
				background:rgba(255,255,255,0.5);
				border: 5px solid black;
			}
			.thetext{
				width:200px;
				height:50px;
				font-size:20px;
			}
			.searchwindows{
				width:300px;
				height:25px;
				margin-bottom:10px;
			}
			.lineview{
	    		display: center;
	    		justify-content: flex-center;
				margin:10px;
			}
			.button{
            	margin: auto;
				width:99%;
				height:30px;
				text-decoration: none;
				font-weight:bold;
			}
			.atcenter{
            	margin: auto;
            	margin-top: 30px;
            	height:30px;
				width:300px;
			}
		</style>
	</head>
	
	<body>
	  <div style="background:url(https://ts1.cn.mm.bing.net/th/id/R-C.29cb8799413dda678c0a3196a8ffc12d?rik=YxRQUUH38EBBPQ&riu=http%3a%2f%2fimg.mm4000.com%2ffile%2f6%2f44%2f69b70f99a2.jpg%3fdown&ehk=ErYrGd1gkPOJoyVzebZXD8%2bCXageH8F0KceKv%2bzD8Q8%3d&risl=&pid=ImgRaw&r=0);
				  width:100%;
				  text-align:center;">
  		<div class="mainhead">
      		<div style="width: 99%;">
      		
			    <div class="headtitle">
			      	  5号艾斯医药系统 - 登陆界面
			    </div>
			    
		        <form action="check-login.jsp" method="POST" name="loginForm">
		          <div style="width:30%;margin:auto;border: 5px solid black;">
		        	<div class="lineview">
		                <label for="name" class="thetext">用户名</label>
		                &nbsp;&nbsp;&nbsp;
	                	<input type="text" class="searchwindows" name="name" placeholder="请输入用户名">
	                </div>
	                
	                <div class="lineview">
	                	<label for="" class="thetext">&nbsp;&nbsp;&nbsp;密码</label>
	                	&nbsp;&nbsp;&nbsp;
						<input type="password" class="searchwindows" name="password" placeholder="请输入密码">
	                </div>  
		          </div>
		          
	                <div style="margin-top:40px;"></div>
	                
	                <div class="atcenter">
			            <button type="submit" class="button" onclick="return checkForm()">登录</button>
			               &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
		        	</div>
		        </form>
			            
                <div class="atcenter">
		        	<button class="button" onclick="window.location.href='http://localhost:8080/zqs_login/registerpage.jsp'">注册</button>
		        </div>
	       </div>
			    
		</div>
	  </div>
	</body>
	
	
	<script type="text/javascript">
	    function checkForm() {
	        var name = loginForm.name.value;
	        var password = loginForm.password.value;
	        if (name == "" || name == null) {
	            alert("请输入用户名");
	            loginForm.name.focus();
	            return false;
	        } else if (password == "" || password== null) {
	            alert("请输入密码");
	            loginForm.password.focus();
	            return false;
	        }
	        return true;
	    }
	</script>
</html>
