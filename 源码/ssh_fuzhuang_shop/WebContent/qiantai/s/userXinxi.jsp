<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	    <base target="_self"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<script language="javascript">
            function closeOpen()
		    {
		       window.returnValue=false;
		       window.close();
		    }
		    function check1()
		    {
		        if(document.form1.userName.value=="")
		        {
		            alert("请输入用户名");
		            return false;
		        }
		        if(document.form1.userPw.value=="")
		        {
		            alert("请输入密码");
		            return false;
		        }
		        if(document.form1.userPw.value!=document.form1.userPw1.value)
		        {
		            alert("两次密码不一致");
		            return false;
		        }
		        document.form1.submit();
		    }
        </script>
	</head>
	<body>
			<form action="<%=path %>/userEdit.action" name="form1" method="post">
				<table width="98%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
					<tr>
						<td width="20%" height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							用户名：
						</td>
						<td width="80%" bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="userName" id="loginname" readonly="readonly" value="${sessionScope.user.loginname }"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							密 码：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="password" name="loginpw" value="${sessionScope.user.loginpw }"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							真实姓名：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="xingming" value="${sessionScope.user.xingming }"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							住址：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="address" value="${sessionScope.user.address }"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							性别：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="radio" name="xingbie" value="男" checked="checked"/>男
							&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="xingbie" value="女"/>女
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							联系方式：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="dianhua" value="${sessionScope.user.dianhua }"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							E-mail：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="youxiang" value="${sessionScope.user.youxiang }"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9" style="font-size: 11px;">
							QQ：
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="text" name="qq" value="${sessionScope.user.qq }"/>
						</td>
					</tr>
					<tr>
						<td height="30" align="right" bgcolor="#F9F9F9">
							&nbsp;
						</td>
						<td bgcolor="#FFFFFF">
							&nbsp;
							<input type="hidden" name="id" value="${sessionScope.user.id }">
							<input type="submit" value="确定"/>
							<input type="button" value="取消" onclick="closeOpen()"/>
						</td>
					</tr>
				</table>
			</form>
	</body>
</html>
