<%@page import="java.sql.*"%>
<%@ page import="com.yc.sql.connDB" %>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
						<div id="wel"><% 
						if(session.getAttribute("userNo") != null){%>
							<marquee behavior="slide">亲爱的<%=session.getAttribute("userName") %>用户，您好！欢迎光临！</marquee>
							<%
						}else{%>
							<marquee behavior="slide">请先登录！</marquee>
							<%
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
			
			<div id="middle">
			<%!
				//定义全局变量
				int count = 0; //表中共有多少条数据
				int a = 6;     //每页多少条数据
				int b = 0;     //共分多少页
				int c = 1;     //当前页数
				int min = 1;   //查询最小值
				int max = 6;   //查询最大值
			%>
				
				<div id="middle_left">
				<%
				connDB.getConn();
				
				//将表中的记录数查出来放在count中
				String sql8 = " SELECT COUNT(*) count FROM greens ";
				ResultSet rs8 = connDB.connQuery(sql8);
				if(rs8.next()){
					count = rs8.getInt("count");
				}
				
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
				
				String sql9 = " SELECT * FROM (SELECT g.*, ROWNUM rn FROM greens g) WHERE rn between ? and ?";
				ResultSet p=connDB.connQuery(sql9,min, max);
				while(p.next()){
				%>
				
					<div class="context">
						<div class="context_top">
							<div class="context_img">
								<img src="<%=p.getString("cai_img")%>" />
							</div>
							<div class="context_font">
								菜名: <b><%=p.getString("cai_name") %></b><br />市场价格: <%=p.getString("cai_mprice") %><br/> 会员价格:<span style="color: red;"><b> <%=p.getString("cai_vipPrice") %></b></span><br/> 
								配料: <%=p.getString("cai_material") %><br/><br/> 菜品类型: <%=p.getString("cai_kind") %>
							</div>
						</div>
						<div class="context_button"><br />
							<a href="main.jsp?flag=add&cai_no=<%=p.getString("cai_no") %>&cai_name=<%=p.getString("cai_name") %>&cai_mPrice=<%=p.getFloat("cai_mPrice") %>"><img src="img/cart.png" /></a>
						</div>
					</div><% 
				}
				%>	
				<p align="center">
					<a href="main.jsp?flag8=first">首页</a>&nbsp;
					<% if(c > 1){ %>
						<a href="main.jsp?flag8=shang">上一页</a>&nbsp;
					<% } %>
					<% if( c < b ){ %>
						<a href="main.jsp?flag8=xia">下一页</a>&nbsp;
					<% } %>
					<a href="main.jsp?flag8=last">末页</a>&nbsp;
					<a>第<%= c %>页</a>&nbsp;
					<a>共<%= b%>页</a>
				</p>
					
				</div>
				
				<div id="middle_right">
					
					<%
						String sqlannoce = " select * from annoc where annoc_id = (select max(annoc_id)from annoc) ";
						connDB.getConn();
						ResultSet q=connDB.connQuery(sqlannoce);
						q.next();
					%>
					
					<div id="annoce">
						<table border="0px" bordercolor="orange" bgcolor="papayawhip" width="100%" height="70px" cellspacing="0px"  cellpadding="2px">
							<tr><td background="img/bg.jpg">
								<font style="margin-left: 50px;color: orange;">餐厅公告</font> 
								<a href="#"><font style="margin-left: 70px;">更多</font> </a></td></tr>
							<tr><td>
							<marquee width=100% behavior="scroll" style="color: darkcyan;"><%=q.getString("annoc_title") %>
							<%=q.getString("annoc_text") %><%=q.getString("annoc_time") %></marquee>
							</td></tr>
						</table><%connDB.closeConn(); %>
					</div>
					<br />
					
					<%
					connDB.getConn();
					//用户登录了才能添加购物车
					if(session.getAttribute("userNo") != null){
						String userId = (String)session.getAttribute("userNo");
						
						String flag = request.getParameter("flag");
						 if("add".equals(flag)){
							 //将菜的ID添加进我的餐车里
							 String add_cai_no =  request.getParameter("cai_no");
							 String add_cai_name =  request.getParameter("cai_name");
							 String cai_mPrice =  request.getParameter("cai_mPrice");
							 String addSql = "insert into dinner values(dinner_sequence.nextval ,?,?,?,?) " ;
							 connDB.updateEmp(addSql,userId,add_cai_no, add_cai_name,cai_mPrice);
						 }
					}else{ %>
					<script>
						alert('请先登录');
					</script>
					<%
					}
					connDB.closeConn();
					%>
					
					<div id="myeat">
						<table border="0px" width="100%" cellspacing="0" cellpadding="0px">
							<tr height="35px"><td colspan="3"><img src="img/car.PNG"/>
								<font style="margin-left: 0px;color: orange;">我的餐车</font> 
								<a href="#"><font style="margin-left: 70px;">更多</font> </a></td></tr>
							</td></tr>
							<tr bgcolor="#FFC0CB" style="font-size: 15px">
								<td width="33%" align="right">菜单名称</td>
								<td width="33%" align="right">单价</td>
								<td width="33%" align="right"><font style="margin-right: 20px;">数量</font></td>
							</tr>
							
							<% 
							//清空购物车
							Double allPrice = 0.0;
						 	int allCount = 0;
						 	ArrayList<String> caino = new ArrayList<String>();
						 	ArrayList<String> cainum = new ArrayList<String>();
				if(session.getAttribute("userNo") != null){			
							String flagdel = request.getParameter("flagdel");
							 if("delall".equals(flagdel)){
								 String delSql = "DELETE FROM dinner" ;
								 connDB.getConn();
								 connDB.updateEmp(delSql);
								 connDB.closeConn();
							 }
												
							String sql2 = "SELECT cai_name,cai_no, AVG(cai_price),COUNT(cai_name) from dinner group by cai_name,cai_no";
							connDB.getConn();
							ResultSet rs2 = connDB.connQuery(sql2); 					    
						 	
							while(rs2.next()){
								caino.add(rs2.getString("cai_no"));
								cainum.add(rs2.getString("COUNT(cai_name)"));
						 %>
							<tr bgcolor="azure">
								<% allPrice += (rs2.getFloat("AVG(cai_price)")) * (rs2.getInt("COUNT(cai_name)")); %>
								<% allCount= allCount+ rs2.getInt("COUNT(cai_name)"); %>
								<td align="right"><%= rs2.getString("cai_name") %></td>
								<td align="right"><span style="color: red;"><%= rs2.getFloat("AVG(cai_price)") %></span>元</td>
								<td align="right"><font style="margin-right: 20px;"><span style="color: red;"><%= rs2.getInt("COUNT(cai_name)") %></span>份</font></td>
							</tr><%}
							} %>
							<tr bgcolor="azure">
								<td align="right">小计</td>
								<td align="right"><span style="color: red;"><%=allPrice %></span>元</td>
								<td align="right"><font style="margin-right: 20px;"><span style="color: red;"><%= allCount %></span>份</font></td>
							</tr>	
							<tr>
								<td colspan="3">&nbsp;&nbsp;&nbsp;<a href="main.jsp?d_flag=dinnercar"><img src="./img/canche_submit.gif"></a>&nbsp;<a href="main.jsp?flagdel=delall"><img src="./img/quxiao2.gif" /></a></td>
							</tr>
						</table>
						<%		
					String d_flag = request.getParameter("d_flag"); 
					if ("dinnercar".equals(d_flag)){
						String userId = (String)session.getAttribute("userNo");
						connDB.getConn();
						int j=0,ans;
						for(int i=0;i<caino.size();i++){
							String insertSell = " insert into sellinfo values(sell_id.nextval,?,?,?,sysdate,'否') ";
							String deletd = " delete dinner ";
							
							ans = connDB.updateEmp(insertSell,userId,caino.get(i),cainum.get(i));
							if(ans > 0){
								j++;
								connDB.updateEmp(deletd);
								System.out.println("操作成功");
							}else{							
								System.out.println("操作失败");
							}
						}
						
						connDB.closeConn();
						if(j==caino.size()){	
							request.getRequestDispatcher("order.jsp").forward(request, response);
						}else{
							System.out.println("操作失败");
						}
					}
					%>
					</div>
							
					<br />
					<div id="rec">
						<table border="0" width="100%" cellspacing="0" cellpadding="0">
							<tr height="30px">
								<td colspan="2"><img src="img/mon.PNG" width="30px"/>
									<font style="margin-left: 0px;color: orange;">销售排行榜</font> 
									<a href="#"><font style="margin-left: 70px;">更多</font> </a>
								</td>
							</tr>
							
							<%
								String sqlgeens = " select * from greens where rownum<4 order by cai_vipnum desc ";
								connDB.getConn();
								ResultSet a=connDB.connQuery(sqlgeens);
								while(a.next()){
							%>
							
							<tr bgcolor="antiquewhite" >
								<td align="left">	
									<img src="img/43.gif"/><%=a.getString("cai_name") %>
								</td>
								<td align="right"><span style="color: gray;">已售<%=a.getString("cai_vipnum") %>次</span></td>
							</tr><% 
								}%>
						</table>
					</div>
					<br />
					<div id="rigbot">
						<h2><font style="color: slateblue;">菜品欣赏</font></h2>
						<marquee onmouseover=this.stop() onmouseout=this.start()>
							<a href="#" class="caipp"><img src="img/1257395866.jpg" title="这个难吃的很"/></a>
							<a href="#" class="caipp"><img src="img/1257396058.jpg" title="这个也难吃的很"/></a>
							<a href="#" class="caipp"><img src="img/1257396517.jpg" title="这个也难吃的很"/></a>
							<a href="#" class="caipp"><img src="img/1257396703.jpg" title="这个也难吃的很"/></a>
							<a href="#" class="caipp"><img src="img/1257396792.jpg" title="这个也难吃的很"/></a>
							<a href="#" class="caipp"><img src="img/1257396864.jpg" title="这个更难吃的很"/></a>
							<a href="#" class="caipp"><img src="img/1257397027.jpg" title="这个更难吃的很"/></a>
							<a href="#" class="caipp"><img src="img/1257397349.jpg" title="这个更难吃的很"/></a>
							<a href="#" class="caipp"><img src="img/1257397703.jpg" title="这个更难吃的很"/></a>
						</marquee>
					</div>
				</div>
				
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
