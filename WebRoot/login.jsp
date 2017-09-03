<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/bootstrap.css" />
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	<script type="text/javascript">
	   $(function(){
	       var name;
	      /* 验证用户名 */
	        $("#name").blur(function()
	       {
	         name=$(this).val();
	         $("#span").empty();
	         if(name==null || name=="")
	         {
	           $("#name").after("<span id='span'>用户名不能为空</span>")
	         }
	       
	       });
	   
	       var password;
	      /* 验证密码 */
	        $("#password").blur(function()
	       {
	       password=$(this).val();
	         $("#span2").empty();
	         if(password==null || password=="")
	         {
	           $("#password").after("<span id='span2'>密码不能为空</span>")
	         }
	       
	       });
	        
	       $("#button").click(function()
	       {
	          $("#span3").empty();
	          
	       /* 把用户名和密码传过去 */
	       $.post("${pageContext.request.contextPath}/user/login",{"name":name,"password":password},function(a)
	       {
	           if(a=="ok")
	           {
	               window.location="inx.jsp";
	               
	           }
	           else
	           {
	           $("#p").append("<span id='span3'>用户名或密码不正确</span>");
	           }
	       },"json");
	       
	       });
	   
	   
	   });
	
	</script>
  </head>
  
  <body>
   <table class="table table-striped table-bordered table-hover table-condensed">
        <tr>
        <td>用户名
        </td>
        <td><input type="text" name="name" class="form-control" id="name">
        </td>
        </tr>
        <tr>
        <td>密码</td>
        <td><input type="password" name="password"  class="form-control" id="password"> </td>
        </tr>
        <tr>
        <td colspan="2">
        <button value="登录" class="btn btn-primary" id="button">登录</button>
        <a  class="btn btn-primary" href="${pageContext.request.contextPath}/enroll.jsp">注册</a>
        </td>
        </tr>
         <tr>
        <td colspan="2">
          <p id="p"></p>
        </td>
        </tr>
 
 <table>
  </body>
</html>
