<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>
		<script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        <script language="javascript">
           function goodsDetailHou(goodsId)
           {
                 var url="<%=path %>/goodsDetailHou.action?goodsId="+goodsId;
                 var n="";
                 var w="480px";
                 var h="500px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
           }
           
           function goodsNoTejiaDel(goodsId)
           {
               if(confirm('您确定删除吗？'))
               {
                   window.location.href="<%=path %>/goodsNoTejiaDel.action?goodsId="+goodsId;
               }
           }
           
            function goodsNoTejiaEditPre(goodsId)
           {
              
                   window.location.href="<%=path %>/goodsNoTejiaEditPre.action?goodsId="+goodsId;
               
           }
           
           function goodsNoTejiaAdd()
           {
                 var url="<%=path %>/admin/goods/goodsNoTejiaAdd.jsp";
                 //var n="";
                 //var w="480px";
                 //var h="500px";
                 //var s="resizable:no;help:no;status:no;scroll:yes";
				 //openWin(url,n,w,h,s);
				 window.location.href=url;
           }
           
           function goodsShezhiTejia(goodsId)
           {
                var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/admin/goods/goodsShezhiTejia.jsp?goodsId="+goodsId);
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
           }
           
           function over(picPath)
	       {
			  if (picPath=="")picPath="/images/default.jpg";
			  x = event.clientX;
			  y = event.clientY;      
			  document.all.tip.style.display = "block";
			  document.all.tip.style.top = y;
			  document.all.tip.style.left = x+10;
			  document.all.photo.src = ".."+picPath; 
		   }
		   function out()
	       {
			  document.all.tip.style.display = "none";
		   }
		   function showPingluns(goodsId)
           {
              
                   window.location.href="<%=path %>/pinglunsMana.action?mid="+goodsId;
               
           }
		   
       </script>
	</head>

	<body leftmargin="2" topmargin="2" background='<%=path %>/images/allbg.gif'>
			<table width="98%" border="0" cellpadding="2" cellspacing="1" bgcolor="#D1DDAA" align="center" style="margin-top:8px">
				<tr bgcolor="#E7E7E7">
					<td height="14" colspan="14" background="<%=path %>/images/tbg.gif">&nbsp;服装管理&nbsp;</td>
				</tr>
				<tr align="center" bgcolor="#FAFAF1" height="22">
					<td width="5%">序号</td>
					<td width="5%">服装名称</td>
					<td width="5%">厂商</td>
					<td width="5%">经销商</td>
					<td width="5%">编号</td>
					<td width="5%">视频</td>
					<td width="10%">服装描述</td>
					<td width="10%">分类</td>
					<td width="10%">品牌</td>
					<td width="10%">服装图片</td>
					<td width="5%">市场价格</td>
					<td width="10%">特价</td>
					<td width="5%">评论</td>
					<td width="5%">库存</td>
					<td width="10%">操作</td>
		        </tr>	
				<s:iterator value="#request.goodsList" id="goods" status="sta">
				<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
					<td bgcolor="#FFFFFF" align="center">
						${sta.index+1}
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#goods.goodsName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#goods.chubanshe"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#goods.zuozhe"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<s:property value="#goods.bianhao"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
							视频
						<%--<div onmouseover = "over('<%=path %>/<s:property value="#goods.goodsYanse"/>')" onmouseout = "out()" style="cursor:hand;">
							查看图片
						</div>--%>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <a href="#" onclick="goodsDetailHou(<s:property value="#goods.goodsId"/>)" class="pn-loperator">服装描述</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#goods.goodsCatelogName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					    <s:property value="#goods.goodsPinpaiName"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					   <div onmouseover = "over('<%=path %>/<s:property value="#goods.goodsPic"/>')" onmouseout = "out()" style="cursor:hand;">
								查看图片
					   </div>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#goods.goodsShichangjia"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:if test="#goods.goodsIsnottejia=='no'">无特价&nbsp;&nbsp;&nbsp;
					         <a href="#" style="color: red" onclick="goodsShezhiTejia(<s:property value="#goods.goodsId"/>)">设为特价</a>
					     </s:if>
					     <s:if test="#goods.goodsIsnottejia=='yes'">
					        <s:property value="#goods.goodsTejia"/>
					     </s:if>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="showPingluns(<s:property value="#goods.goodsId"/>)" class="pn-loperator">评论</a>
					</td>
					<td bgcolor="#FFFFFF" align="center">
					     <s:property value="#goods.goodsKucun"/>
					</td>
					<td bgcolor="#FFFFFF" align="center">
						<a href="#" onclick="goodsNoTejiaDel(<s:property value="#goods.goodsId"/>)" class="pn-loperator">删除</a>
						<a href="#" onclick="goodsNoTejiaEditPre(<s:property value="#goods.goodsId"/>)" class="pn-loperator">修改</a>
					</td>
				</tr>
				</s:iterator>
			</table>
			
			<!--  <table width='98%'  border='0'style="margin-top:8px;margin-left: 5px;">
			  <tr>
			    <td>
			        <input type="button" value="添加" style="width: 80px;" onclick="goodsNoTejiaAdd()" />
			    </td>
			  </tr>
		    </table>-->
		    <div id="tip" style="position:absolute;display:none;border:0px;width:80px; height:80px;">
			<TABLE id="tipTable" border="0" bgcolor="#ffffee">
				<TR align="center">
					<TD><img id="photo" src="" height="80" width="80"></TD>
				</TR>
			</TABLE>
		</div>
	</body>
</html>
