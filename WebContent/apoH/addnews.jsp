<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加新公告</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		
		<style type="text/css">
					#c2{
			width: 100%;
			height: 300px;
			margin: auto;
	        float: left;
		}
		
		#c2 table{
			width: 80%;
			font-family: "微软雅黑";
			text-align: center;
			margin: auto;
		}
		</style>
	</head><jsp:include page="isLogin.jsp"></jsp:include>
	<body>
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
						<b>添加公告</b>
					</div>
				</div>
				
				<div id="c2">
					<table width="86%" align="center" height="200px" cellspacing="0px" border="1px" style="margin-top: 60px; border-color:cornflowerblue;">
						<form action="addnews.jsp?action=addnews" method="post">
						<tr height="20px">
								<td align="right" width="100px"><label for="cname"><font face="黑体">公告标题</font>：</label></td>
								<td>
									<input type="text" id="cname" name="annoc_title" required="required" autofocus="autofocus"/>
								</td>
						</tr>
						<tr height="160px">
							<td align="right" width="100px"><label for="sname"><font face="黑体">公告内容</font>：</label></td>
							<td>
								<textarea id="sname" name="annoc_text" required="required" cols="20" rows="10" wrap="hard">
									
								</textarea>
							</td>
						</tr>
						<tr height="30px">
								<td colspan="2" align="center">
									<input type="submit" value="提交"  />
								</td>
						</tr>	
						</form>
					</table>
					
					<%
						request.setCharacterEncoding("utf-8");
						String action = request.getParameter("action");
						if("addnews".equals(action)){
							
							String annoc_title = request.getParameter("annoc_title");
							String annoc_text = request.getParameter("annoc_text");
							String sql = " insert into annoc values(annoc_id.nextval,?,?,sysdate) ";
							
							connDB.getConn();
							int ans = connDB.updateEmp(sql,annoc_title,annoc_text);
							if(ans > 0){
								System.out.println("操作成功");connDB.closeConn();
								request.getRequestDispatcher("listnews.jsp").forward(request, response);
							}else{
								%><center><h1>添加失败</h1></center><% connDB.closeConn();
								System.out.println("操作失败");
							}
							connDB.closeConn();
						}
					%>	
				</div>

			</div>
		</div>
	</body>
</html>