<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date" import="java.text.SimpleDateFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
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
							<li><a href="userinfo.jsp">用户中心</a></li>
							<!--<li><a href="description.html">配送说明</a></li>
							<li><a href="aboutUs.html">关于我们</a></li>-->
							<li><a href="getout.jsp">注销退出</a></li>
						</ul>
					</div>
				</div>	
			</div>
			
			<div id="myorder">
				<table border="0px" cellspacing="0" cellpadding="0" width="400px" bgcolor="beige">
					<tr>
						<form action="cainame_order.jsp" method="post">
						<td width="40%">按菜名查询</td>
						<td width="60%"><input type="text" name="searCai" id="searCai" value="" maxlength="12" size="15" placeholder="请输入菜名" required="required"/>
							<input type="submit" value="搜索"/>
						</td></form>
					</tr>				
					<tr><td colspan="2"><a href="order.jsp" class="dingdan">我的所有订单</a>&nbsp;<a href="notsend_order.jsp" class="dingdan">未派送订单</a>&nbsp;<a href="send_order.jsp" class="dingdan">已派送订单</a></td></tr>
				</table>
				<br /><br /><br />
				
				<table border="1px" bordercolor="aqua" cellspacing="0px" cellpadding="2px" bgcolor="aliceblue">
					<tr><td colspan="9">订单查询结果信息列表</td></tr>
					<tr>
						<td>菜品名称</td>
						<td>真实姓名</td>
						<td>订购电话</td>
						<td>派送地址</td>
						<td>订购数量</td>
						<td>单价（元）</td>
						<td>合计（元）</td>
						<td>订购时间</td>
						<td>是否派送</td>
					</tr>
					
					<%	
							request.setCharacterEncoding("utf-8");
							String cainame = request.getParameter("searCai");
							String userId = (String)session.getAttribute("userNo");
							String sql = " select sell_id,userinfo.user_id,userinfo.user_relname,user_tel,user_address, "+
								       " cai_name,sell_num, cai_vipPrice,sell_date,sell_send from userinfo,greens,sellinfo "+
								       " where userinfo.user_id=sellinfo.user_id and sellinfo.cai_no=greens.cai_no and sellinfo.user_id=? "+
								       " and cai_name=? ";
							connDB.getConn();
							ResultSet p=connDB.connQuery(sql,userId,cainame);
							Double aPrice = 0.0;
							while(p.next()){
								aPrice=p.getDouble("cai_vipPrice")*p.getDouble("sell_num");
						%>
						<tr align="center">
							<td ><%=p.getString("cai_name") %></td>
							<td ><%=p.getString("user_relname") %></td>
							<td ><%=p.getString("user_tel") %></td>
							<td ><%=p.getString("user_address") %></td>
							<td ><%=p.getString("sell_num") %></td>
							<td ><%=p.getString("cai_vipPrice") %></td>
							<td ><%=aPrice %></td>
							<td ><%=p.getString("sell_date") %></td>
							<td ><%=p.getString("sell_send") %></td>
							
						</tr><% 
							}
							connDB.closeConn();
							%>
				</table>
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