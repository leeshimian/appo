<%@ page import="java.sql.*" %>
<%@ page import="com.yc.sql.connDB" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加新类别</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<style type="text/css">
			#c2 table{
				margin: auto;
			}
		</style>
	</head><jsp:include page="isLogin.jsp"></jsp:include>
	<body>
		<div id="bodyy">
			<div id="top">
				<div id="topleft"></div>
				<div id="topright">
					<marquee>管理员：sa您好，欢迎登录使用！</marquee>
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
					<li class="menutitle"><a href="#" class="leftBA"><b>系统用户管理</b></a><br /></li>
					<li class="menutitle"><a href="main.jsp" class="leftBA"><b>注销退出</b></a></li>
				</ul>
			</div>
			
			<div id="right">
				<div id="rigtop">
					<div id="rigtitle" >
						<b>修改菜单</b>
					</div>
				</div>
				
				<div id="c2">
					<%
request.setCharacterEncoding("utf-8");
String cai_no =request.getParameter("cai_no");
String cai_name=request.getParameter("cai_name");	
String cai_material=request.getParameter("cai_material");
String cai_mPrice=request.getParameter("cai_mPrice");
String cai_vipPrice=request.getParameter("cai_vipPrice");
String cai_info=request.getParameter("cai_info");
String cai_kind=request.getParameter("cai_kind");
String img="img/1256607214.jpg";
String cai_num=request.getParameter("cai_num");
String cai_vipnum=request.getParameter("cai_vipnum");

connDB.getConn();
String sql="update greens set cai_name=?,cai_mPrice=?,cai_vipPrice=?,cai_material=?,cai_kind=?,cai_img=?,cai_info=?,cai_num=?,cai_vipnum=? where cai_no=? ";
int i=connDB.updateEmp(sql,cai_name,cai_mPrice,cai_vipPrice,cai_material,cai_kind,img,cai_info,cai_num,cai_vipnum,cai_no);
if(i>0){System.out.println("修改成功");%>
        <br /><br />
        <p style="margin-top:10px;text-align:center">您修改成功</p>
        
		<p style="margin-top:20px;text-align:center"><form action="caidanxinxi.jsp" style="display: inline-block;margin-top: 30px;margin-left:560px;"><input type="submit" value="查看菜单"></form></p><br /><br />
<%
       }
else {System.out.println("修改失败"); %>
        <br /><br />
        <p style="margin-top:10px;text-align:center">您修改失败</p>
      
			<p style="margin-top:20px;text-align: center;"><form action="candanupdate.jsp" style="display: inline-block;margin-top: 30px;margin-left:560px;"><input type="submit" value="重新修改"></form></p>
	 <br /><br />  <% }

%>
					
				</div>


			</div>
		</div>
	</body>
</html>
