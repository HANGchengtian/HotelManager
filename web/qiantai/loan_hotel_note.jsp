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
					alert("������Ԥ������!");
					document.form2.sumday.focus();
					return false;
				}
				if (isNaN(document.form2.sumday.value )  )  
				{
					alert("Ԥ����������������!");
					document.form2.sumday.focus();
					return false;
				}
			}
</script>	
	
  </head>
<%
String ok = (String)request.getAttribute("ok");
if(ok != null && ok.equals("1")){
%><script>alert('Ԥ���ɹ�!��ܰ��ʾ�� ����������ԭ���ܰ�ʱ��ס�����绰��������ϵ���������Ļ�Ա��Ϣ�н������²�����¼��')</script><%
}
%>
<%
String okcontinue = (String)request.getAttribute("okcontinue");
if(okcontinue != null && okcontinue.equals("1")){
%><script>alert('�����ɹ�!��ܰ��ʾ�� ����������ԭ���ܰ�ʱ��ס�����绰��������ϵ���������Ļ�Ա��Ϣ�н������²�����¼��')</script><%
}
%>
<%
String okbeforehand = (String)request.getAttribute("okbeforehand");
if(okbeforehand != null && okbeforehand.equals("1")){
%><script>alert('Ԥ���ɹ�!��ܰ��ʾ�� ����������ԭ���ܰ�ʱ��ס�����绰��������ϵ���������Ļ�Ա��Ϣ�н������²�����¼��')</script><%
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
					<td colspan="10" align="center" height="20">�ͷ�Ԥ����¼</td>
				</tr>
				<tr>
					<td align="center" height="20">�ͷ�����</td>
					<td align="center" height="20">ÿ�շ���</td>
					<td align="center" height="20">Ԥ������</td>
					<td align="center" height="20">Ԥ��ʱ��</td>
					<td align="center" height="20">�뿪ʱ��</td>

					<td align="center" height="20">���úϼ�</td>
					<td align="center" height="20">�Ƿ��뿪</td>

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
					<td align="center" height="20"><%=alRow.get(3) %>Ԫ</td>
					<td align="center" height="20"><%=alRow.get(4) %></td>
					<td align="center" height="20"><%=alRow.get(5).toString().substring(0,10) %></td>
					<td align="center" height="20"><%=alRow.get(6).toString().substring(0,10) %></td>

					<td align="center" height="20">
					<%
					if(alRow.get(7) == null){
						%><%=Integer.parseInt(alRow.get(3).toString())*Integer.parseInt(alRow.get(4).toString()) %>Ԫ<%
					}else{
						%><%=Integer.parseInt(alRow.get(3).toString())*Integer.parseInt(alRow.get(4).toString())+Integer.parseInt(alRow.get(3).toString())*Integer.parseInt(alRow.get(7).toString()) %>Ԫ<%
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