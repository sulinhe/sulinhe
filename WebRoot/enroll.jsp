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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/area.js"></script>
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
	            else
	         {
	        /* 只能输入中文和英文 正则表达式 */
              var abc= /^[\u0391-\uFFE5A-Za-z]+$/;  //网上要搜的表达式
                
                 if(!abc.test(name))/* 判断 */
                {
                  $("#name").after("<span id='span'>只能输入中文和英文</span>") 
                } 
                else
                {
	         /* 用户名是否可以使用 */
	          $.post("${pageContext.request.contextPath}/user/namepan",{"name":name},function(a)
	          {
	           if(a=="ok")
	           {
	          $("#name").after("<span id='span'>用户名可以使用</span>") 
	           }
	           else
	           {
	           $("#name").after("<span id='span'>用户名已经存在</span>")
	           }
	           },"json");
	           }
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
	         else
	         {
	           var abc=/^[a-zA-Z0-9]{6,10}$/;
	           if(!abc.test(password))
	           {
	            $("#password").after("<span id='span2'>6到10位的数字与字母组合</span>")
	           
	           }
	         
	         }
	      
	       });
	       
	        var password1;
	      /* 验证密码 */
	        $("#password1").blur(function()
	       {
	       password1=$(this).val();
	         $("#span11").empty();
	         if(password==null || password=="")
	         {
	           $("#password1").after("<span id='span11'>密码不能为空</span>")
	         }
	         else
	         {
	           if(password1!=password)
	           {
	              $("#password1").after("<span id='span11'>密码不一致</span>")
	           }
	         }
	       });
	        var arry=new Array();
	        
	       $("#button").click(function()
	       {
	          $("#span3").empty();
	       /* 获取用户名和密码 */
	       $.post("${pageContext.request.contextPath}/user/adduser",{"name":name,"password":password},function(a)
	       {
	           if(a=="ok")
	           {
	               window.location="inx.jsp";
	           }
	       },"json");
	       
	       });
	   
	   
	   });
	
	</script>
  </head>
  
  <body>
   <div class="row">
   <div class="col-md-4 col-md-offset-4">
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
         <tr>
        <td>确认密码</td>
        <td><input type="password" name="password"  class="form-control" id="password1"> </td>
        </tr>
         <tr>
        <td>性别</td>
        <td><input type="radio" name="sex" checked="checked">男
            <input type="radio" name="sex">女
        </td>
        </tr>
         <tr>
        <td>爱好</td>
        <td><input type="checkbox" name="aihao" value="打篮球">打篮球　
            <input type="checkbox" name="aihao" value="打排球">打排球　
            <input type="checkbox" name="aihao" value="踢足球">踢足球　
            <input type="checkbox" name="aihao" value="看书">看书　
            <input type="checkbox" name="aihao" value="旅游">旅游　
        </td>
        </tr>
         <tr>
        <td>出生日期</td>
        <td>
             <input type="date" name="time">
        </td>
        </tr>
        <tr>
        <td>出生地</td>
        <td>
   <select id="province" runat="server" name="province">
   </select>
   <select id="city" runat="server" name="city">
  </select>
  <select id="county" runat="server" name="city">
  </select>
  <!--js初始化函数-->
  <script type="text/javascript">
    setup()
  </script>
        </td>
        </tr>
        <tr>
        
        <td colspan="2">
        <button value="登录" class="btn btn-primary" id="button">注册</button>
       
        </td>
        </tr>
         <tr>
        <td colspan="2">
          <p id="p"></p>
        </td>
        </tr>
 
 <table>
 </div>
 </div>
  </body>
</html>

