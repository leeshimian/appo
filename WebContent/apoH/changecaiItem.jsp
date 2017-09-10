<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="UTF-8">
		<title>修改</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<style type="text/css">
			#c2 table{
				margin: auto;
				text-align: center;
			}
		</style>
</head><jsp:include page="isLogin.jsp"></jsp:include>
<body>
		<div id="bodyy">
			<div id="top">
				<div id="topleft"></div>
				<div id="topright">
					<marquee>管理员：<%=session.getAttribute("adm")%>您好，欢迎登录使用！</marquee>
				</div>
				<div id="toprr">
					<a href="main.jsp"><img src="img/out.gif"/></a>
				</div>
			</div>
			
			<div id="left">
				<ul>
					<li class="menutitle"><b>菜单管理</b>
						<ul>
							<li class="meunPic"><img src="img/menu_topline.gif"/></li>
							<li class="menu"><a href="newcaidan.jsp" class="liA">添加新菜单</a></li>
							<li class="menu"><a href="caidanxinxi.jsp" class="liA">菜单信息列表</a></li>
						</ul>
					</li>
					<li class="menutitle">
						<b>菜单类别管理</b>
						<ul>
							<li class="meunPic"><img src="img/menu_topline.gif"/></li>
							<li class="menu"><a href="addItem.jsp" class="liA">添加新类别</a></li>
							<li class="menu"><a href="leibiexinxibiao.jsp" class="liA">类别信息列表</a></li>
						</ul>
					</li>
					<li class="menutitle">
						<b>公告信息管理</b>
						<ul>
							<li class="meunPic"><img src="img/menu_topline.gif"/></li>
							<li class="menu"><a href="addnews.jsp" class="liA">添加新公告</a></li>
							<li class="menu"><a href="listnews.jsp" class="liA">通告信息列表</a></li>
						</ul>
					</li>
					<li class="menutitle">
						<b>销售订单管理</b>
						<ul>
							<li class="meunPic"><img src="img/menu_topline.gif"/></li>
							<li class="menu"><a href="xiaoshoudingdan.jsp" class="liA">销售订单信息列表</a></li>
							<li class="menu"><a href="xiaoshoudingdanchaxun.jsp" class="liA">销售订单查询</a></li>
							<li class="menu"><a href="benrixiaoshoujilu.jsp" class="liA">本日销售记录</a></li>
						</ul>
					</li>
					<li class="menutitle"><a href="guanlixinxi.jsp" class="leftBA"><b>系统用户管理</b></a><br /></li>
					<li class="menutitle"><a href="main.jsp" class="leftBA"><b>注销退出</b></a></li>
				</ul>
			</div>
			
			<div id="right">
				<div id="rigtop">
					<div id="rigtitle" >
						<b>修改</b>
					</div>
				</div>
				
				<%
					request.setCharacterEncoding("UTF-8");
					String action = request.getParameter("action");
					//打开数据库连接
					if("getchange".equals(action)){
					String typeid = request.getParameter("id");
					connDB.getConn();
					String sql = "select*from caitype where  type_id=?";
					ResultSet rs = connDB.connQuery( sql,typeid);
					rs.next();
				%>
				
				<div id="c2">
					<form action="do_changecaiItem.jsp?id=<%=typeid %>" method="post">
						<table cellspacing="0px" width="500px" height="200px" border="1px" style=" margin-top: 60px; border-color:cornflowerblue;">
							<tr>
								<td>类别ID</td>
								<td><%=typeid %></td>
							</tr>
							<tr>
								<td>类别名字</td>
								<td><input type="text" name="newname" value="<%=rs.getString("type_name") %>" /></td>
							</tr>
							<tr>
								<td colspan="2"><input type = "submit" value = "修改"/></td>
							</tr><%connDB.closeConn();} %>
						</table>
					</form><br /><br />
					
				</div>



			</div>
		</div>
	</body>
</html>