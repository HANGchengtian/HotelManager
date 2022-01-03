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
td{font:13px 宋体}
#TbM td{border:0;font-size:13px;line-height:24px!important;line-height:24px}
}
#TbM td.pl{width:64px}
a:link{color:#000;text-decoration:none}
a:link.greenfont1{color:#178517; cursor: hand; font-family:宋体; text-decoration: none}
#TbM td.pr{width:60px}
.rb{background:#F0F7FF}
a:link.greenfont{color:#179117; cursor: hand; font-family:宋体; text-decoration: none}
}
.redfont{color:#fd2828}
-->
</style>
<script language="JavaScript">
		function check11()
			{
				
				if (document.form1.name.value == "" ) 
				{
					alert("请输入用户名!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.pwd.value == ""  )  
				{
					alert("请输入密码!");
					document.form1.pwd.focus();
					return false;
				}
				if (document.form1.cpwd.value == ""  )  
				{
					alert("请输入重复密码!");
					document.form1.cpwd.focus();
					return false;
				}
				if (document.form1.cpwd.value != document.form1.pwd.value  )  
				{
					alert("两次密码不一致!");
					document.form1.cpwd.focus();
					return false;
				}
			}
</script>
  </head>
  <jsp:include flush="true" page="/servlet/SessAdminServlet"/>
  <%
String error = (String)request.getAttribute("error");
if(error != null && error.equals("1")){
%><script>alert('用户名称重复!')</script><%
}
 %>
  <body>
  <jsp:include flush="true" page="/admin/top.jsp"/>
  <form name="form1" action="servlet/PwdNameUserServlet?xuser=1" method="post" onSubmit="return check11()">
  <center>
  <table width="99%" class="table_style"  align="center">
		<tr>
			<td valign="top">
			<table>
				<tbody style="margin: 0; padding: 0">
					<tr  >
						<td width="726" height="40" colspan="2" align="center" class="pl">						
						<a href="admin/modifypwd.jsp">修改密码</a>&nbsp;&nbsp;&nbsp; 
						 				
						&nbsp;&nbsp;&nbsp; <a href="admin/adduser.jsp">添加系统管理员</a>
						</td>
					</tr>
					<tr >
						<td class="pl" width="335" align="right">
						<span style="color: #874604">用 户 名：</span></td>
						<td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: 宋体; border: 0 none; margin: 0; padding: 0" width="456" align="left">
						<input type="text" name="name" size="20"></td>
					</tr>
					<tr class="rb">
						<td class="pl" width="335" align="right">
						<span style="color: #874604">密&nbsp;&nbsp;&nbsp; 码：</span></td>
						<td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: 宋体; border: 0 none; margin: 0; padding: 0" width="456" align="left">
						<input type="password" name="pwd" size="20"></td>
					</tr>
					<tr >
						<td class="pl" width="335" align="right">
						<span style="color: #874604">重复密码：</span></td>
						<td style="font-size: 13px; line-height: 24px !important; font-style: normal; font-variant: normal; font-weight: normal; font-family: 宋体; border: 0 none; margin: 0; padding: 0" width="456" align="left">
						<input type="password" name="cpwd" size="20"></td>
					</tr>					
					<tr><td colspan="2" align="center"><input type="submit" value="添加"/></td></tr>
					</table>
			</td>
			
		</tr>
		</table>
		</center>
		</form>
  
  </body>
</html>