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
			<td align=right>���ͷ�������ѯ:</td>
			<td>���� <input type="text" name="kuda" size="8"><input type="submit" value="��ѯ">
			С�� <input type="text" name="kuxiao" size="8"><input type="submit" value="��ѯ"></td>
				
		</tr>
		<tr>
			<td align=right>��Ԥ��������ѯ:</td>
			<td>���� <input type="text" name="souda" size="8"><input type="submit" value="��ѯ">
			С�� <input type="text" name="souxiao" size="8"><input type="submit" value="��ѯ"></td>
				
		</tr>
	</table>
	</form>
  	<table width="99%" class="table_style"  align="center">
		<tr>
			<td align="center">�ͷ�����</td>
			<td align="center">���</td>
			<td align="center">�Ƽ�ָ��</td>
			<td align="center">ÿ�����(Ԫ)</td>
			<td align="center">ʣ��</td>
			<td align="center">Ԥ������</td>
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