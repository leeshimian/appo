<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><jsp:include page="isLogin.jsp"></jsp:include>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
		<title>管理员信息表</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<div id="bodyy">
			<div id="top">
				<div id="topleft"></div>
				<div id="topright">
					<marquee>管理员：<%=session.getAttribute("adm") %> 您好，欢迎登录使用！</marquee>
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
						<b>管理员信息</b>
					</div>
				</div>
				
				<div id="rigbot">
					<table border="1px" bordercolor="blue" cellspacing="0" cellpadding="" width="400px" >
						<tr>
							<th colspan="5
								">管理员信息列表</th>
						</tr>
						<tr>
							<td>管理员ID</td>
							<td>管理员姓名</td>
							<td>管理员密码</td>
							<td>修改</td>
							<td>删除</td>
						</tr>
						<% 
     request.setCharacterEncoding("UTF-8");
	 String hh = request.getParameter("hh");
     connDB.getConn();
     if("aa".equals(hh)){
    	 String s = request.getParameter("id");
    	 String sq = "delete adm_user where mange_id ="+s;
    	 connDB.updateEmp(sq);
     }
     String sql = "select*from adm_user";
     ResultSet rs = connDB.connQuery(sql);	
      while (rs.next()) {
%>				
						<tr>
							<td><%=rs.getString("mange_id")%></td>
							<td><%=rs.getString("mange_name")%></td>
							<td><%=rs.getString("mange_pwd")%></td>
							<td><a href="xiugai.jsp?id=<%=rs.getString("mange_id")%>">修改</a></td>
							<td><a href="guanlixinxi.jsp?hh=aa&id=<%=rs.getString("mange_id")%>">删除</a></td>
						</tr>
						 <% }   %>
					</table>
					<p align="center"><a href = "tianjia.jsp">添加管理員</a></p>
					<br /><br />
				</div>
			</div>
		</div>
</head>
<body>

</body>
</html>