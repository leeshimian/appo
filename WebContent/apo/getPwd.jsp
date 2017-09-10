<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>忘记密码</title>
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
							<% 
						if(session.getAttribute("userNo") != null){%>
							<marquee behavior="slide">亲爱的<%=session.getAttribute("userName") %>用户，您好！欢迎光临！</marquee><%
						}else{%>
							<marquee behavior="slide">阿婆私房菜，做最好吃的菜！</marquee><%
						}%>
						</div>
					
					
						<ul>
							<li><a href="main.jsp">首页</a></li>
							<li><a href="myEat.jsp">我的餐车</a></li>
							<li><a href="order.jsp">我的订单</a></li>
							<li><a href="userCenter.jsp">用户中心</a></li>
							<!--<li><a href="description.html">配送说明</a></li>
							<li><a href="aboutUs.html">关于我们</a></li>-->
							<li><a href="getout.jsp">注销退出</a></li>
						</ul>
					</div>
				</div>	
			</div>			
			<%	request.setCharacterEncoding("utf-8");
			String action = request.getParameter("action"); %>
			<div id="usInfo"><center>
				<form action="getPwd.jsp?action=get" method="post">
					<p align="center" style="font-size: 30px; font-family: '微软雅黑';"><b>我的密码呢</b></p><br />
					<p>输入用户名：<span style="color: red;"><input type="text" name="userName" required="required"></span></p><br />
					<p>输入手机号：<span style="color: red;"><input type="text" name="userTel" required="required"></span></p><br />
					<input type="submit" id="tijiao" value=""/>
				</from></center><br />
					<%
					if("get".equals(action)){
						connDB.getConn();
						String userNa = request.getParameter("userName");
						String userTe = request.getParameter("userTel");
						String sql = " select * from userinfo where user_Name=? and user_tel=? ";
						connDB.getConn();
						ResultSet p=connDB.connQuery(sql, userNa,userTe);
						if(p.next()){%>
							<center><h4>账号：<span style="color: red;"><%=p.getString("user_id") %></span></h4><br />
							<h4>用户名：<span style="color: red;"><%=p.getString("user_name") %></span></h4><br />
							<h4>密码：<span style="color: red;"><%=p.getString("user_pwd") %></span></h4><br />
							<a href="Login.jsp">返回登录</a></center>
						<%
						}else{
							%><span style="color: red;">用户不存在</span><%
						}
					}
					%>
			</div>
			
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