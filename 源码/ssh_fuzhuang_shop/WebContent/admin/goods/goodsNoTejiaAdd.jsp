<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %> 
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>

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
        
        <script type='text/javascript' src='<%=path %>/dwr/interface/catelogService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/interface/pinpaiService.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script type="text/javascript" src="<%=path %>/js/popup.js"></script>
        
        <script language="javascript">
            var i=0;
            var i1=0;
		    function goodsCatelogSelect()
		    {
		        if(i==0)
		        {
		           document.getElementById("indicator").style.display="block";
		           catelogService.findAllCatelog(callback);
		           i=1;
		        }
		        
		    }
		   
		    function callback(data)
			{
			    document.getElementById("indicator").style.display="none";
			    //document.getElementById("goodsCatelogId1").style.display="none";
			    DWRUtil.addOptions("goodsCatelogId",data,"id","name");
			    //document.getElementById("goodsCatelogId").style.display="block";
			}
			
			function goodsPinpaiSelect()
		    {
		        if(i1==0)
		        {
		           document.getElementById("indicator1").style.display="block";
		           pinpaiService.findAllPinpai(callback1);
		           i1=1;
		        }
		        
		    }
		   
		    function callback1(data)
			{
			    document.getElementById("indicator1").style.display="none";
			    //document.getElementById("goodsCatelogId1").style.display="none";
			    DWRUtil.addOptions("goodsPinpaiId",data,"id","name");
			    //document.getElementById("goodsCatelogId").style.display="block";
			}
			
			function up()
		    {
		        var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
	            pop.setContent("contentUrl","<%=path %>/upload/upload.jsp");
	            pop.setContent("title","文件上传");
	            pop.build();
	            pop.show();
	            //另一红上传方式可以参照进销存
		    }
			function up2()
			{
				var pop=new Popup({ contentType:1,isReloadOnClose:false,width:400,height:200});
				pop.setContent("contentUrl","<%=path %>/upload/upload2.jsp");
				pop.setContent("title","文件上传");
				pop.build();
				pop.show();
				//另一红上传方式可以参照进销存
			}

		    function check()
		    {
		        if(document.formAdd.goodsCatelogId.value==0)
		        {
		            alert("请选择类别");
		            return false;
		        }
		        if(document.formAdd.goodsName.value=="")
		        {
		            alert("请填写服装名称");
		            return false;
		        }
		        if(document.formAdd.goodsShichangjia.value=="")
		        {
		            alert("请填写服装价格");
		            return false;
		        }
		        if(document.formAdd.goodsTejia.value=="")
		        {
		            alert("请填写服装特价");
		            return false;
		        }
		        document.formAdd.submit();
		    }
        </script>
	</head>

	<body leftmargin="2" topmargin="9" background='<%=path %>/images/allbg.gif'>
			<form action="<%=path %>/goodsNoTejiaAdd.action" name="formAdd" method="post" enctype="multipart/form-data">
				     <table width="98%" align="center" border="0" cellpadding="4" cellspacing="1" bgcolor="#CBD8AC" style="margin-bottom:8px">
						<tr bgcolor="#EEF4EA">
					        <td colspan="3" background="<%=path %>/images/wbg.gif" class='title'><span>服装添加</span></td>
					    </tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         服装类别：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <table>
						           <tr>
						               <td>
						                  <select name="goodsCatelogId" id="goodsCatelogId" onclick="goodsCatelogSelect()">
								             <option value="0">--请选择服装类别--</option>
								          </select>
						               </td>
						               <td>
						                   <img id="indicator" src="<%=path %>/images/loading.gif" style="display:none"/>
						               </td>
						           </tr>
						        </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         服装品牌：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <table>
						           <tr>
						               <td>
						                  <select name="goodsPinpaiId" id="goodsPinpaiId" onclick="goodsPinpaiSelect()">
								             <option value="0">--请选择品牌类别--</option>
								          </select>
						               </td>
						               <td>
						                   <img id="indicator1" src="<%=path %>/images/loading.gif" style="display:none"/>
						               </td>
						           </tr>
						        </table>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         服装名称：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="goodsName" size="20" value="" />
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         厂商：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="chubanshe" size="20"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         经销商：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="zuozhe" size="20"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         编号：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="bianhao" size="20"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         视频：
						    </td>
							<td width="75%" bgcolor="#FFFFFF" align="left">
								<input type="text" name="fujian2" id="fujian2" size="30" readonly="readonly"/>
								<input type="button" value="上传" onclick="up2()"/>
								<input type="hidden" name="fujianYuanshiming2" id="fujianYuanshiming2"/>
							</td>
						   <%-- <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="goodsYanse" size="20"/>
						    </td>--%>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        服装描述：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <FCK:editor instanceName="goodsMiaoshu"  basePath="/fckeditor" width="500" height="200" value="请输入内容" toolbarSet="Basic">
                                </FCK:editor>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         服装图片：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="fujian" id="fujian" size="30" readonly="readonly"/>
						        <input type="button" value="上传" onclick="up()"/>
						        <input type="hidden" name="fujianYuanshiming" id="fujianYuanshiming"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         市场价格：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="goodsShichangjia" size="20" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr style="display: none" align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         特格：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="goodsTejia" size="20" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						        (<font color="red">特格为0表示没有特价</font>)
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						         库存：
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						        <input type="text" name="goodsKucun" size="20" value="0" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
						    </td>
						</tr>
						<tr align='center' bgcolor="#FFFFFF" onMouseMove="javascript:this.bgColor='red';" onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						    <td width="25%" bgcolor="#FFFFFF" align="right">
						        &nbsp;
						    </td>
						    <td width="75%" bgcolor="#FFFFFF" align="left">
						    <input type="hidden" name="uid"  value="${sessionScope.user.id }"/>
						       <input type="button" value="提交" onclick="check()"/>&nbsp; 
						       <input type="reset" value="重置"/>&nbsp;
						    </td>
						</tr>
					 </table>
			</form>
   </body>
</html>
