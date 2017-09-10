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

</head><jsp:include page="isLogin.jsp"></jsp:include>
<body>
<%
request.setCharacterEncoding("UTF-8");
String no = request.getParameter("id");
//打开数据库连接
connDB.getConn();
String sql = "select*from adm_user where  mange_id=?";
ResultSet rs = connDB.connQuery( sql, no);
rs.next();
%>
<%
String hh = request.getParameter("hh");
if("bb".equals(hh)){
	String num01 =  request.getParameter("em");
	String num   =	request.getParameter("id01");
	String name  =	request.getParameter("name");
	String mima  =	request.getParameter("mima");
	connDB.getConn();
	String sq = "update adm_user set mange_id = ?,mange_name = ?,mange_pwd =?where mange_id = ?";
	int i = connDB.updateEmp(sq,num,name,mima,num01);
	if (i > 0) {
		System.out.println("操作成功");
		request.getRequestDispatcher("guanlixinxi.jsp").forward(request, response);
	}else{
	System.out.println("操作失败");
	}
}

%>
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
				
				<div id="rigbot" align="center" style="margin-top: 100px;">
<form action="xiugai.jsp"method="post">
<input type="hidden"  name="em" value="<%=rs.getString("mange_id")%>"/>
管理员ID:<input type = "text" name = "id01" value="<%=rs.getString("mange_id")%>"/><br/><br/>
姓&nbsp;&nbsp;名:<input type = "text" name = "name" value="<%=rs.getString("mange_name") %>"/><br/><br/> 
登录密码:<input type = "text" name = "mima" value="<%=rs.getString("mange_pwd") %>"/><br/><br/> 
<input type="hidden" name = "hh" value="bb"/>
<input type="submit" value="提交"/>
<input type = "reset" value = "重置"/>
</form>
				</div>
			</div>
		</div>
</body>
</html>