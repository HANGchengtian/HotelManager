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
					alert("名称不能为空!");
					document.form1.name.focus();
					return false;
				}
				if (document.form1.author.value == ""  )
				{
					alert("编号不能为空!");
					document.form1.author.focus();
					return false;
				}
				if (document.form1.publishing.value == ""  )
				{
					alert("推荐指数不能为空!");
					document.form1.publishing.focus();
					return false;
				}
				if (document.form1.number.value == ""  )
				{
					alert("客房设施不能为空!");
					document.form1.number.focus();
					return false;
				}
				if (document.form1.price.value == ""  )
				{
					alert("每日费用不能为空!");
					document.form1.price.focus();
					return false;
				}
				if (document.form1.storage.value == ""  )
				{
					alert("房间数量不能为空!");
					document.form1.storage.focus();
					return false;
				}
				if (document.form1.brief.value == ""  )
				{
					alert("内容不能为空!");
					document.form1.brief.focus();
					return false;
				}

				if (document.form1.img.value == ""  )
				{
					alert("上传文件不能为空!");
					document.form1.img.focus();
					return false;
				}
			}
</script>
	<jsp:include flush="true" page="/servlet/SessAdminServlet"/>
  <body>
	<div class="bg_color" style="height:100%;">
	<jsp:include flush="true" page="/servlet/ListServlet"/>
	<jsp:include flush="true" page="/admin/top.jsp"/>
	<form action="AddHotelServlet" method="post" name="form1" onSubmit="return check11()" enctype="multipart/form-data">
	<table width="50%" class="table_style"  align="center">
	<%
 	 ArrayList type = (ArrayList)request.getAttribute("type");
	 %>
		<tr>
			<td height="25"  align="right" width="31%">客房名称：</td>
			<td height="25"  width="66%">
			<input type="text" name="name" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">客房编号：</td>
			<td height="25"  width="66%">
			<input type="text" name="author" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">推荐指数：</td>
			<td height="25"  width="66%">
			<input type="text" name="publishing" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">客房设施：</td>
			<td height="25"  width="66%">
			<input type="text" name="number" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">每日费用：</td>
			<td height="25"  width="66%">
			<input type="text" name="price" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">房间数量：</td>
			<td height="25"  width="66%">
			<input type="text" name="storage" size="45"></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">客房简介：</td>
			<td height="25"  width="66%">
			<textarea rows="12" name="brief" cols="43"></textarea></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">客房类别：</td>
			<td height="25"  width="66%">
			<select name="type">
			<%
            for(int i = 0;i < type.size();i++){
            	ArrayList alRow = (ArrayList)type.get(i);
            %>
             <option value="<%=alRow.get(0)%>"><%=alRow.get(1)%></option>
             <%}%>
			</select>
			</td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">
			客房等级：</td>
			<td height="25"  width="66%">
			<select size="1" name="tate">
			<option value="1">推荐客房</option>
			<option value="2">标准客房</option>
			</select></td>
		</tr>
		<tr>
			<td height="25"  align="right" width="31%">
			上传图片：</td>
			<td height="25"  width="66%">
			<input type="file" name="img" size="34"></td>
		</tr>
		<tr>
			<td height="25"  align="center" colspan="2">
			<input type="submit" value="添加"></td>
		</tr>
		</table>
	</form>
  	</div>
  </body>
</html>