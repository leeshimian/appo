<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
	<link rel="stylesheet" type="text/css" href="css/styl.css"/>
</head>
<body>
	<div id="back">
			<div id="top">
				<div id="top1">
					<ul>
						<li><a href="Login.jsp">会员登录</a></li>|
						<li><a href="userCenter.jsp">会员注册</a></li>
					</ul>
				</div>
				
				<div id="">
					<div style="float: left;">
						<img src="img/1257477260.gif"/>
					</div>
					
					<div id="top2">
						<div id="wel">
							<marquee>阿婆私房菜，做最好吃的菜！</marquee>
						</div>
					
					
						<ul>
							<li><a href="main.jsp">首页</a></li>
							<li><a href="myEat.jsp">我的餐车</a></li>
							<li><a href="order.jsp">我的订单</a></li>
							<li><a href="userinfo.jsp">用户中心</a></li>
							<!--<li><a href="description.html">配送说明</a></li>
							<li><a href="aboutUs.html">关于我们</a></li>-->
							<li><a href="getout.jsp">注销退出</a></li>
						</ul>
					</div>
				</div>	
			</div>
			
			<%
			if(session.getAttribute("userNo") != null){
				%><h3>您已登录，请先注销！</h3><% 
			}else{
			%>
			
			<%
			request.setCharacterEncoding("utf-8");
			String action = request.getParameter("action");
			
			if("login".equals(action)){
				String userNa = request.getParameter("userName");
				String userPwd = request.getParameter("userPwd");
				connDB.getConn();
				String sql = " select * from userinfo where user_name=? and user_pwd=? ";
	
					ResultSet p=connDB.connQuery(sql, userNa,userPwd);
					if(p.next()){
						String userNo = p.getString("user_id");
						session.setAttribute("userNo", userNo);
						String userNN = p.getString("user_name");
						session.setAttribute("userName", userNN);
						String userPass = p.getString("user_pwd");
						session.setAttribute("userpsa", userPass);
						String userRen = p.getString("user_relname");
						session.setAttribute("userren", userRen);
						String userSex = p.getString("user_sex");
						session.setAttribute("usersex", userSex);
						String userBirth = p.getString("user_birdate");
						session.setAttribute("userbir", userBirth);
						String userIdca = p.getString("idcard");
						session.setAttribute("useridca", userIdca);
						String useraddress = p.getString("user_address");
						session.setAttribute("useraddre", useraddress);
						String userTel = p.getString("user_tel");
						session.setAttribute("usertel", userTel);
						String userEmail = p.getString("user_email");
						session.setAttribute("useremail", userEmail);
						
						request.getRequestDispatcher("main.jsp").forward(request, response);
						connDB.closeConn();
					}else{
						request.setAttribute("error_msg", "用户名或者密码错误");
						connDB.closeConn();
					}
			}
			%>
			
			<div id="userlogin">
				<div id="logi">
					<form action="Login.jsp?action=login" method="post">
						<div id="user"><label for="userCo">账号：</label><input type="text" name="userName" id="userCo" maxlength="12" placeholder="请输入账号" required="required"/>
						</div>
						<br />
						<div id="pasw"><label for="passW">密码：</label><input type="password" name="userPwd" id="passW" minlength="5" maxlength="12" placeholder="请输入密码" required="required"/></div>
						<br />
						<% String na = request.getParameter("userName"); %>
						<div align="center">
							<input type="submit" id="denglu" value=""/>
							<a href="userCenter.jsp"><img src="img/zhuce.gif"/></a>
							<a href="getPwd.jsp" id="forget">忘记密码</a>
						</div><br />
						<%
						String errorMsg =(String) request.getAttribute("error_msg");
								if(errorMsg != null){
									out.print(errorMsg);
								}
								%>
					</form>
				</div>
			</div>
			<%} %>
			<div id="bottom">
				<ul>
					<li>
						<a href="aboutUs.jsp">关于我们</a>
					</li>|
					<li>
						<a href="description.jsp">配送说明</a>
					</li>
				</ul>
				Copyright(C)2015-2020
			</div>

		</div>
</body>
</html>