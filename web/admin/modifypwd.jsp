<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  	<style>
<!--
*{padding:0;margin:0}
.ry{background:#FFF8F0}
td{font:13px ����}
#TbM td{border:0;font-size:13px;line-height:24px!important;line-height:24px}
}
#TbM td.pl{width:64px}
a:link{color:#000;text-decoration:none}
a:link.greenfont1{color:#178517; cursor: hand; font-family:����; text-decoration: none}
#TbM td.pr{width:60px}
.rb{background:#F0F7FF}
a:link.greenfont{color:#179117; cursor: hand; font-family:����; text-decoration: none}
}
.redfont{color:#fd2828}
-->
</style>
<script language="JavaScript">
		function check11()
			{
				
				if (document.form1.oldpwd.value == "" ) 
				{
					alert("�����������!");
					document.form1.oldpwd.focus();
					return false;
				}
				if (document.form1.newpwd.value == ""  )  
				{
					alert("������������!");
					document.form1.newpwd.focus();
					return false;
				}
				if (document.form1.cnewpwd.value == ""  )  
				{
					alert("�������ظ�������!");
					document.form1.cnewpwd.focus();
					return false;
				}
				if (document.form1.cnewpwd.value != document.form1.newpwd.value  )  
				{
					alert("�������벻һ��!");
					document.form1.cnewpwd.focus();
					return false;
				}
			}
</script>
  </head>
  <jsp:include flush="true" page="/servlet/SessAdminServlet"/>
  <body>
  <jsp:include flush="true" page="/admin/top.jsp"/>
  <form name="form1" action="servlet/PwdNameUserServlet?xpwd=1" method="post" onSubmit="return check11()">
  <center>
  <table width="99%" class="table_style"  align="center">
		<tr>
			<td valign="top">
			<table id="table2" >
				<tbody style="margin: 0; padding: 0">
					<tr>
						<td class="pl" width="726" align="center" colspan="2" height="40">						
						<a href="admin/modifypwd.jsp">�޸�����</a>&nbsp;&nbsp;&nbsp; 
						 
						&nbsp;&nbsp;&nbsp; <a href="admin/adduser.jsp">����ϵͳ����Ա</a>
						</td>
					</tr>
					<tr >
						<td class="pl" width="335" align="right">
						<span style="color: #874604">��&nbsp; ��&nbsp; �룺</span></td>
						<td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: ����; border: 0 none; margin: 0; padding: 0" width="456" align="left">
						<input type="password" name="oldpwd" size="20"></td>
					</tr>
					<tr class="rb">
						<td class="pl" width="335" align="right">
						<span style="">��&nbsp; ��&nbsp; �룺</span></td>
						<td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: ����; border: 0 none; margin: 0; padding: 0" width="456" align="left">
						<input type="password" name="newpwd" size="20"></td>
					</tr>
					<tr >
						<td class="pl" width="335" align="right">
						<span style="">�ظ������룺</span></td>
						<td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: ����; border: 0 none; margin: 0; padding: 0" width="456" align="left">
						<input type="password" name="cnewpwd" size="20"></td>
					</tr>
					<tr><td colspan="2" align="center"><input type="submit" value="�޸�"/></td></tr>
					</table>
			</td>
			
		</tr>
		</table>
		</center>
		</form>
 
  </body>
</html>