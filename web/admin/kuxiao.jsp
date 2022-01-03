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
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/KuXiaoServlet" name="form1" method="post">
	<table width="99%" class="table_style"  align="center">
		<tr>
			<td align=right>按客房数量查询:</td>
			<td>大于 <input type="text" name="kuda" size="8"><input type="submit" value="查询">
			小于 <input type="text" name="kuxiao" size="8"><input type="submit" value="查询"></td>
				
		</tr>
		<tr>
			<td align=right>按预定数量查询:</td>
			<td>大于 <input type="text" name="souda" size="8"><input type="submit" value="查询">
			小于 <input type="text" name="souxiao" size="8"><input type="submit" value="查询"></td>
				
		</tr>
	</table>
	</form>
  	<table width="99%" class="table_style"  align="center">
		<tr>
			<td align="center">客房名称</td>
			<td align="center">编号</td>
			<td align="center">推荐指数</td>
			<td align="center">每日租金(元)</td>
			<td align="center">剩余</td>
			<td align="center">预定次数</td>
		</tr>
		<%
		ArrayList books = (ArrayList)request.getAttribute("books");
		if(books != null){
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td  align="center" height="20"><a href="servlet/HotelinfServlet?id=<%=alRow.get(0) %>&adminshow=1"><%=alRow.get(1) %></a></td>
			<td  align="center" height="20"><%=alRow.get(2) %></td>
			<td  align="center" height="20"><%=alRow.get(3) %></td>
			<td  align="center" height="20"><%=alRow.get(5) %></td>
			<td  align="center" height="20"><%=alRow.get(6) %></td>
			<td  align="center" height="20"><%=alRow.get(10) %></td>
		</tr>
		<%}} %>
	</table>
  	</div>
  </body>
</html>