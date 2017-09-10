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
					<tr><form action="cainame_order.jsp" method="post">
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
					<%connDB.getConn(); %>
					<%!
					//定义全局变量
					int count = 0; //表中共有多少条数据
					int a = 6;     //每页多少条数据
					int b = 0;     //共分多少页
					int c = 1;     //当前页数
					int min = 1;   //查询最小值
					int max = 6;   //查询最大值
					%>
					
					<%
					String sql8 = "select count(*) count from(" +
						    	       "select sell_id,u.user_id,u.user_relname,user_tel,user_address, cai_name,sell_num, cai_vipPrice,sell_date,sell_send" + 
					                        "from userinfo u,greens g,sellinfo s" +
					                             "where u.user_id=s.user_id and s.cai_no=g.cai_no and s.user_id='1000' order by sell_date)";
					ResultSet rs8 = connDB.connQuery(sql8);
					if(rs8.next()){
						count = rs8.getInt("count");
					}
					
					//计算共有多少页，不能整除就将页数加一
					if (count % a == 0 ){
						b = count / a;
					}else if (count % a != 0){
						b = count / a + 1;
					}

					//根据不同的请求切换到不同的页面
					String flag8 = request.getParameter("flag8");
						if ("first".equals(flag8)){                  //首页
							min = 1;
							max = 6;
							c = 1;
						}else if ("shang".equals(flag8)  && c > 1){  //上一页
							min = min - a;
							max = max - a;
							c = c - 1;
						}else if ("xia".equals(flag8) && c < b){     //下一页
							min = min + a;
							max = max + a;
							c = c + 1;
						}else if ("last".equals(flag8)){             //最后一页
							min = a * (b - 1) + 1;
							max = count;
							c = b;
							
						}
					
							String userId = (String)session.getAttribute("userNo");
							String sql = " select * from(" +
								               "select d.*,ROWNUM rn from(" +
								                    "select sell_id,u.user_id,u.user_relname,user_tel,user_address, cai_name,sell_num, cai_vipPrice,sell_date,sell_send" + 
								                         "from userinfo u,greens g,sellinfo s" +
								                              "where u.user_id=s.user_id and s.cai_no=g.cai_no and s.user_id=? order by sell_date)d)" +
								                                   "where rn between ? and ?";
							ResultSet p=connDB.connQuery(sql,userId,min,max);
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
				
					<p align="center">
						<a href="order.jsp?flag8=first">首页</a>&nbsp;
						<% if(c > 1){ %>
							<a href="order.jsp?flag8=shang">上一页</a>&nbsp;
						<% } %>
						<% if( c < b ){ %>
							<a href="order.jsp?flag8=xia">下一页</a>&nbsp;
						<% } %>
						<a href="order.jsp?flag8=last">末页</a>&nbsp;
						<a>第<%= c %>页</a>&nbsp;
						<a>共<%= b%>页</a>
					</p>
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