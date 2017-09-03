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
		<script type="application/javascript" src="${pageContext.request.contextPath}/js/angularjs.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
	  <script type="text/javascript">
	     angular.module('myapp', [])
        .controller('mycontroller', function($scope,$http) {
             $http.post("${pageContext.request.contextPath}/goods/select").success(function(a)
             {
                 $scope.cart=a;
             });
             
             $scope.minus=function(index)
             {
             
              $scope.cart[index].account=$scope.cart[index].account-1;
              var ac=  $scope.cart[index].account;
              var gid=  $scope.cart[index].gid;
              $.post("${pageContext.request.contextPath}/goods/update",{"account":ac,"gid":gid},function(a)
              {
                     
              });
             
             };
             
             
                $scope.add=function(index)
             {
             
              $scope.cart[index].account=$scope.cart[index].account+1;
              var ac=  $scope.cart[index].account;
              var gid=  $scope.cart[index].gid;
              $.post("${pageContext.request.contextPath}/goods/update",{"account":ac,"gid":gid},function(a)
              {
                     
              });
             
             };
               var array=new Array;
            $("#button").click(function(){     
	                $("input[type='checkbox']:gt(0):checked").each(function(){	                
	                 array.push($(this).val());	                
	                }); 
	                alert(array)
	               $.post("${pageContext.request.contextPath}/goods/add?array="+array+"",function(a)
              {
                       alert("购买成功")
              });
             });
    
});
	  </script>
  </head>
  
  <body ng-app="myapp">
  <div ng-controller="mycontroller">
  <h1>欢迎${user.uname}登录</h1>
       <dir class="col-md-6 col-md-offset-4">
         <table class="table table-striped table-bordered table-hover table-condensed">
           <thead>
           <tr>
           <td><input type="checkbox" ng-model="all"></td>
           <td>id</td>
           <td>名字</td>
           <td>价钱</td>
           <td>数量</td>
           </tr>
           </thead>
          <tbody>
          <tr ng-repeat="x in cart">
           <td><input type="checkbox" ng-checked="all" value="{{x.gid}}"></td>
           <td>{{x.gid}}</td>
           <td>{{x.gname}}</td>
           <td>{{x.price}}</td>
           <td>
           <button class="btn btn-primary" ng-model="x.account" ng-click="minus($index)">-</button>
          <input type="text" ng-model="x.account" value=" {{x.account}}" style="width: 30px">
             <button class="btn btn-primary" ng-model="x.account" ng-click="add($index)">+</button>
           </td>
           
          
          </tr>
            <tr >
            <td colspan="2">  <button id="button" class="btn btn-primary">确认购买</button></td>
            </tr>
          </tbody>
         
         </table>
  </dir>
  </div>
      
  </body>
</html>
