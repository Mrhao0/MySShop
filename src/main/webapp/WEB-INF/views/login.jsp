<%--
  Created by IntelliJ IDEA.
  User: zhenghao
  Date: 2019/7/2
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zhonglingxm2.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="javascript">
        $(function(){
            if(${param.login eq "f"}){
                alert("用户名或密码错误");
            }
        });
    </script>
</head>

<body>

<div class="sign-logo w1200">
    <h1 class="zl-h11"><a href="index.html" title="宅客微购"><img src="${pageContext.request.contextPath}/images/zl2-01.gif" /></a></h1>
</div>
<form action="${pageContext.request.contextPath}/user/personalData1.do">
<div class="sign-con w1200">
    <img src="${pageContext.request.contextPath}/images/logn-tu.gif" class="sign-contu f-l" />
    <div class="sign-ipt f-l">
        <p>用户名</p>
        <input type="text" id="userName" name="userName" value="${cookie.userName.value}" placeholder="用户名" required/>
        <p>密码</p>
        <input type="text" id="passWord" name="passWord" value="${cookie.passWord.value}" placeholder="密码可见"  required/><br />
        <div class="agreement">
            <input style="width: 15px;height:15px;" ${empty cookie.userName.value?'':'checked'} type="checkbox" id="hobby" name="hobby"></input>
            <span>记住密码</span>
        </div>
        <input type="submit" class="slig-btn" value="登录">
        <p>已有账号？请<a href="#">登录</a><a href="#" class="wj">忘记密码？</a></p>
        <div class="sign-qx">
            <a href="#" class="f-r"><img src="${pageContext.request.contextPath}/images/sign-xinlan.gif" /></a>
            <a href="#" class="qq f-r"><img src="${pageContext.request.contextPath}/images/sign-qq.gif" /></a>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>
</form>
<!--底部一块-->
<%@include file="includePage/foot.jsp" %>
</body>
</html>

