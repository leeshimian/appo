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
            
			String cai_no=request.getParameter("id");
            connDB.getConn();
            String sql=" select cai_name,cai_mPrice,cai_vipPrice,cai_material,cai_kind,cai_img,cai_info,cai_num,cai_vipnum from greens where cai_no=?";
            ResultSet rs=connDB.connQuery(sql,cai_no);
            rs.next();
                 %>
                  <form action="to_update.jsp" method="post">
              <input type="hidden"  name="cai_no" value="<%=cai_no %>" />
             <table align="center">
                                      <tr><td>菜名：<input type="text" name="cai_name" value="<%=rs.getString("cai_name") %>"/><br /><br /></td></tr>
                                      <tr><td>市场价：<input type="text" name="cai_mPrice" value="<%=rs.getString("cai_mPrice") %>"/><br /><br /></td></tr>
                                      <tr><td>会员价：<input type="text" name="cai_vipPrice" value="<%=rs.getString("cai_vipPrice") %>"/><br /><br /></td></tr>
                                     <tr><td>原料：<input type="text" name="cai_material" value="<%=rs.getString("cai_material") %>"/><br /><br /></td></tr>
                                      <tr><td>菜类：<input type="text" name="cai_kind" value="<%=rs.getString("cai_kind") %>"/><br /><br /></td></tr>
                                     <tr><td>展示图：<img src="<%=rs.getString("cai_img") %>" width="50px"><input type="file" name="cai_img" /><br /><br /></td></tr>
                                     <tr><td>说明：<input type="text" name="cai_info" value="<%=rs.getString("cai_info") %>"/><br /><br /></td></tr>
                                     <tr><td>市场价销售数量：<input type="text" name="cai_num" value="<%=rs.getString("cai_num") %>"/><br /><br /></td></tr>
                                     <tr><td>会员价销售数量：<input type="text" name="cai_vipnum" value="<%=rs.getString("cai_vipnum") %>"/><br /><br /></td></tr>
             
            <tr align="center"><td><input type="submit" value="提交"/></td></tr>
            </table><br /><br />
           </form>
				</div>


			</div>
		</div>
	</body>
</html>
