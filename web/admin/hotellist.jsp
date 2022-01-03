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
<%
String ok = (String)request.getAttribute("ok");
if(ok != null && ok.equals("1")){
%><script>alert('添加成功!')</script><%
}
 %>
  <jsp:include flush="true" page="/servlet/SessAdminServlet"/>
  <body>
	<div class="bg_color" style="height:100%;">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
  	<table width="99%" class="table_style"  align="center">
		<tr>
			<td align="center">客房名称</td>
			<td align="center">编号</td>
			<td align="center">推荐指数</td>
			<td align="center">每日租金(元)</td>
			<td align="center">　</td>
			<td align="center">　</td>
		</tr>
		<%
		ArrayList books = (ArrayList)request.getAttribute("books");
		for(int i = 0;i < books.size();i++){
			ArrayList alRow = (ArrayList)books.get(i);
		 %>
		<tr>
			<td  align="center" height="20"><%=alRow.get(1) %></td>
			<td  align="center" height="20"><%=alRow.get(2) %></td>
			<td  align="center" height="20"><%=alRow.get(3) %></td>
			<td  align="center" height="20"><%=alRow.get(5) %></td>

			<td  align="center" height="20"><a href="servlet/DelServlet?id=<%=alRow.get(0) %>">删除</a></td>
		</tr>
		<%} %>
		<tr>
			<td  align="center" colspan="6" height="25"><a href="admin/addhotel.jsp">添加客房</a></td>
		</tr>
	</table>
  	</div>
  </body>
</html>