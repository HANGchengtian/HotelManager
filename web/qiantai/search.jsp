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
  
  <body>
  <jsp:include flush="true" page="top.jsp"/>
  	<form name="form1" method="post" action="servlet/SearchServlet">
  		<div align="center">
  		<table width="95%" border="0" cellspacing="0" cellpadding="10" bordercolor="#EDECEC" style="border-style: solid; border-width: 1px">
	<tr>
		<td align="center">
		<table border="1" bordercolorlight="#C0C0C0" bordercolordark="#C0C0C0" bordercolor="#C0C0C0" width="484">
			<tr>
				<td colspan="3" align="center" valign="middle">
				<font color="#FF0000">客&nbsp; 房&nbsp; 搜&nbsp; 索</font></td>
			</tr>
			<tr>
				<td align="right">按客房名称：</td>
				<td>
				<input class="input7" type="text" name="name" /></td>
				<td align="center"><input type="submit" value="搜索"></td>
			</tr>
			<tr>
				<td align="right">按推荐指数：</td>
				<td>
				<input class="input7" type="text" name="cuban" /></td>
				<td align="center"><input type="submit" value="搜索"></td>
			</tr>
			<jsp:include flush="false" page="/servlet/ListServlet"></jsp:include>
			<%
			ArrayList alType = (ArrayList)request.getAttribute("type");
			%>
			<tr>
				<td align="right">客房类别：</td>
				<td>
				<select name="types">
				<option value="">所有类别</option>
				<%
				for(int i = 0;i<alType.size();i++){
				ArrayList alTypeRow = (ArrayList)alType.get(i);
				%>
				<option value="<%=alTypeRow.get(0)%>"><%=alTypeRow.get(1)%></option>
				<%}%>
				</select></td>
				<td align="center"><input type="submit" value="搜索"></td>
			</tr>
			</table>
		</td>
	</tr>
</table><br>
<table width="95%" height="500">
<tr valign="top"><td>
<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#FFCC00" align="center">
				<tr>
					<td align="center">客房名称</td>
					<td align="center">客房编号</td>
					<td align="center">推荐指数</td>
					<td align="center">每日费用(元)</td>
					<td align="center">客房类别</td>
					<td align="center">预订</td>
				</tr>				
				<%
				ArrayList bookSearch = (ArrayList)request.getAttribute("search");
				if(bookSearch != null){
				for(int i = 0;i < bookSearch.size();i++){
				ArrayList alRow = (ArrayList)bookSearch.get(i);
				%>
				<tr bgcolor="#FFFFFF">
					<td align="center"><a href="qiantai/loan_hotel.jsp?bookId==<%=alRow.get(0)%>" title="点击查看详细信息"><%=alRow.get(1)%></a></td>
					<td align="center"><%=alRow.get(2)%></td>
					<td align="center"><%=alRow.get(3)%></td>
					<td align="center"><%=alRow.get(5)%></td>
					<td align="center">
					<%
            for(int j = 0;j < alType.size();j++){
            	ArrayList alTypeRow = (ArrayList)alType.get(j);
            	if(alTypeRow.get(0).equals(alRow.get(8))){ 
            %><a href="servlet/SearchServlet?types=<%=alTypeRow.get(0)%>"><%=alTypeRow.get(1)%></a>
              <%break;}} %>
					</td>
					<td align="center">						
						<%
						if(!alRow.get(6).equals("0")){
							%><a href="qiantai/loan_hotel.jsp?bookId=<%=alRow.get(0)%>"><img src="img/goumai.gif" border="0" /><%
						}else{
						 %>
                        	<a href="qiantai/loan_hotel.jsp?bookId=<%=alRow.get(0)%>"><img src="img/goumai1.gif" border="0" />
                        	<%} %>
                        </a>
					</td>
				</tr>
				<%}}%>
			</table></td></tr></table>
		</div>
	</form>
<jsp:include flush="true" page="Copyright.jsp"/>
  </body>
</html>