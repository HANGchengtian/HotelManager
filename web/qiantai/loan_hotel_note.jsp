<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  <script language="JavaScript">
		function login222()
			{
				
				if (document.form2.sumday.value == "" ) 
				{
					alert("请输入预定天数!");
					document.form2.sumday.focus();
					return false;
				}
				if (isNaN(document.form2.sumday.value )  )  
				{
					alert("预定天数必须是数字!");
					document.form2.sumday.focus();
					return false;
				}
			}
</script>	
	
  </head>
<%
String ok = (String)request.getAttribute("ok");
if(ok != null && ok.equals("1")){
%><script>alert('预订成功!温馨提示： 如您有特殊原因不能按时入住，请打电话与我们联系，否则您的会员信息中将会留下不良记录！')</script><%
}
%>
<%
String okcontinue = (String)request.getAttribute("okcontinue");
if(okcontinue != null && okcontinue.equals("1")){
%><script>alert('续订成功!温馨提示： 如您有特殊原因不能按时入住，请打电话与我们联系，否则您的会员信息中将会留下不良记录！')</script><%
}
%>
<%
String okbeforehand = (String)request.getAttribute("okbeforehand");
if(okbeforehand != null && okbeforehand.equals("1")){
%><script>alert('预订成功!温馨提示： 如您有特殊原因不能按时入住，请打电话与我们联系，否则您的会员信息中将会留下不良记录！')</script><%
}
%>
 <jsp:include flush="true" page="/servlet/SessLoginServlet"/> 
  <body>
  <jsp:include flush="true" page="/servlet/ListServlet"/>
  <%
  ArrayList loanbook = (ArrayList)request.getAttribute("loanbook");
  ArrayList beforehand = (ArrayList)request.getAttribute("beforehand");
  ArrayList books = (ArrayList)request.getAttribute("books");
  ArrayList login = (ArrayList)session.getAttribute("login");
  ArrayList alRow = null;
   %>
   <jsp:include flush="true" page="top.jsp"/>
  <div align="center">
	<table border="0" width="95%" cellspacing="0" cellpadding="0" id="table1">
		<tr>
			<td  valign="top" >
			<form action="servlet/HotelinfServlet" method="post" name="form2" onSubmit="return login222()">
			<table border="1" width="100%" bordercolorlight="#C0C0C0" cellspacing="0" cellpadding="0" bordercolordark="#C0C0C0"  style="border-collapse: collapse" id="table2">
				<tr>
					<td colspan="10" align="center" height="20">客房预订记录</td>
				</tr>
				<tr>
					<td align="center" height="20">客房名称</td>
					<td align="center" height="20">每日费用</td>
					<td align="center" height="20">预订天数</td>
					<td align="center" height="20">预订时间</td>
					<td align="center" height="20">离开时间</td>

					<td align="center" height="20">费用合计</td>
					<td align="center" height="20">是否离开</td>

				</tr>
				<%
				for(int i = 0;i < loanbook.size();i++){
					alRow = (ArrayList)loanbook.get(i);
					if(!alRow.get(1).equals(login.get(0))){
						continue;
					}
				 %>
				<tr>
					<td align="center" height="20">
					<%
					for(int j = 0;j < books.size();j++){
						ArrayList booksRow = (ArrayList)books.get(j);
						if(booksRow.get(0).equals(alRow.get(2))){
							%><%=booksRow.get(1) %><%
							break;
						}
					}
					 %>
					</td>
					<td align="center" height="20"><%=alRow.get(3) %>元</td>
					<td align="center" height="20"><%=alRow.get(4) %></td>
					<td align="center" height="20"><%=alRow.get(5).toString().substring(0,10) %></td>
					<td align="center" height="20"><%=alRow.get(6).toString().substring(0,10) %></td>

					<td align="center" height="20">
					<%
					if(alRow.get(7) == null){
						%><%=Integer.parseInt(alRow.get(3).toString())*Integer.parseInt(alRow.get(4).toString()) %>元<%
					}else{
						%><%=Integer.parseInt(alRow.get(3).toString())*Integer.parseInt(alRow.get(4).toString())+Integer.parseInt(alRow.get(3).toString())*Integer.parseInt(alRow.get(7).toString()) %>元<%
					}
					 %>
					</td>
					<td align="center" height="20"><%=alRow.get(9) %></td>
					<td align="center" height="20">
					<%
					if(alRow.get(7) == null){
					 %>

					<%} %></td>
				</tr>
				<%} %>
			</table><br>			
			
		</form>
			</td>
		</tr>
	
	</table>
	</div>
	<jsp:include flush="true" page="Copyright.jsp"/>
  </body>
</html>