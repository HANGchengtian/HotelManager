<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  </head>
  <jsp:include flush="true" page="/servlet/SessAdminServlet"/>
  <body>
	<div class="bg_color" style="height:100%;">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
  	<table width="99%" class="table_style"  align="center">
		<tr>
			<td align="center">会员用户名</td>
			<td align="center">会员真实姓名</td>
			<td align="center">性别</td>
			<td align="center">年龄</td>
			<td align="center">联系方式</td>
			<td align="center">家庭住址?</td>
			<td align="center"> </td>
		</tr>
		<%
		ArrayList books = (ArrayList)request.getAttribute("users");
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td  align="center" height="20"><%=alRow.get(1) %></td>
			<td  align="center" height="20"><%=alRow.get(3) %></td>
			<td  align="center" height="20"><%=alRow.get(4) %></td>
			<td  align="center" height="20"><%=alRow.get(5) %></td>
			<td  align="center" height="20"><%=alRow.get(8) %></td>
			<td  align="center" height="20"><%=alRow.get(7) %></td>
			<td  align="center" height="20"><a href="servlet/DelServlet?userid=<%=alRow.get(0) %>">删除</a></td>
		</tr>
		<%} %>
	</table>
  	</div>
  </body>
</html>