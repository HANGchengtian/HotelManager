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
  <script language="JavaScript">
		function check11()
			{
				
				if (document.form1.name.value == "" ) 
				{
					alert("������Ʋ���Ϊ��!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.author.value == ""  )  
				{
					alert("���߲���Ϊ��!");
					document.form1.author.focus();
					return false;
				}
				if (document.form1.publishing.value == ""  )  
				{
					alert("�����粻��Ϊ��!");
					document.form1.publishing.focus();
					return false;
				}
				if (document.form1.number.value == ""  )  
				{
					alert("��Ų���Ϊ��!");
					document.form1.number.focus();
					return false;
				}				
				if (document.form1.price.value == ""  )  
				{
					alert("���۲���Ϊ��!");
					document.form1.price.focus();
					return false;
				}				
				if (document.form1.storage.value == ""  )  
				{
					alert("���������Ϊ��!");
					document.form1.storage.focus();
					return false;
				}				
				if (document.form1.brief.value == ""  )  
				{
					alert("���ݸ�Ҫ����Ϊ��!");
					document.form1.brief.focus();
					return false;
				}
			}
</script> 
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/> 
  <body>
	<div class="bg_color" style="height:100%;">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="servlet/AddTypeServlet" method="post" name="form1" onSubmit="return check11()">
	<table width="50%" class="table_style"  align="center">
		<tr>
			<td height="25"  align="right">������ƣ�</td>
			<td height="25" >
			<input type="text" name="name" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="center" colspan="2">
			<input type="submit" value="���"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>