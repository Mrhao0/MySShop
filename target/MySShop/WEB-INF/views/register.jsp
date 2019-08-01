<%--
  Created by IntelliJ IDEA.
  User: zhenghao
  Date: 2019/7/2
  Time: 13:56
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
   <%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>--%>
    <%--<script type="javascript" src="${pageContext.request.contextPath}/js/verPassWord.js"></script>--%>
    <script language="JavaScript">
        var flag = true;
        $(function(){

            if(${regedUserName=="no"}){
                $("#userNameMes").attr("class", "cuo");
                $("#userNameMes").attr("style", "color:red");
                $("#userNameMes").text("不可以注册");
                flag=true;
                return;
            }
        });
        function register() {
            console.log($("#userName123").val());
            flag=true;
            $.ajax({
                type: 'get',
                url: "${pageContext.request.contextPath}/user/verUserName.do",
                dataType: "text",
                data: {
                    userName: $("#userName123").val(),
                },
                success: function (data) {
                    console.log(data);
                    if (data == "yes"){
                        $("#userNameMes").attr("class", "dui");
                        $("#userNameMes").attr("style", "color:green");
                        $("#userNameMes").text("可以注册");
                        flag=true;
                        return;
                    } else {
                        $("#userNameMes").attr("class", "cuo");
                        $("#userNameMes").attr("style", "color:red");
                        $("#userNameMes").text("不可以注册");
                        flag=false;
                        return;
                    }
                }
            })
        }

        function verPassWord() {
            flag = true;
            var pwd = $("#passWord123").val();
            var pwd1 = /\d/;
            var pwd2 = /[a-zA-z]/;
            var pwd3 = /[^0-9a-zA-Z]/;
            var pwd4 = /[\u4e00-\u9fa5]/;
            var pwd5 = / /;
            if (!pwd1.test(pwd)) {
                $("#passWordMes").attr("class", "cuo");
                $("#passWordMes").attr("style", "color:red");
                $("#passWordMes").text("密码要包含至少一个数字")
                flag = false;
                return;
            }
            if (!pwd2.test(pwd)) {
                $("#passWordMes").attr("class", "cuo");
                $("#passWordMes").attr("style", "color:red");
                $("#passWordMes").text("密码要包含至少一个字母")
                flag = false;
                return;
            }
            if (!pwd3.test(pwd)) {
                $("#passWordMes").attr("class", "cuo");
                $("#passWordMes").attr("style", "color:red");
                $("#passWordMes").text("密码要包含至少一个符号")
                flag = false;
                return;
            }
            if (pwd4.test(pwd)) {
                $("#passWordMes").attr("class", "cuo");
                $("#passWordMes").attr("style", "color:red");
                $("#passWordMes").text("密码不能有汉字")
                flag = false;
                return;
            }
            if (pwd5.test(pwd)) {
                $("#passWordMes").attr("class", "cuo");
                $("#passWordMes").attr("style", "color:red");
                $("#passWordMes").text("密码不能有空格")
                flag = false;
                return;
            }
            var pwdlength = pwd.length;
            if (pwdlength > 16 || pwdlength < 8) {
                $("#passWordMes").attr("class", "cuo");
                $("#passWordMes").attr("style", "color:red");
                $("#passWordMes").text("密码超过16位大于8位")
                flag = false;
                return;
            }
            $("#passWordMes").attr("class", "dui");
            $("#passWordMes").attr("style", "color:green");
            $("#passWordMes").text("密码可用")
        }
       function pwdChange(){
            flag = true;
            var pwd = $("#passWord123").val();
            var rePwd = $("#rePassWord").val();
            if (rePwd != pwd) {
                $("#rePassWordMes").attr("class", "cuo");
                $("#rePassWordMes").attr("style", "color:red");
                $("#rePassWordMes").text("确认密码不匹配")
                flag = false;
                return;
            } else {
                $("#rePassWordMes").attr("class", "dui");
                $("#rePassWordMes").attr("style", "color:green");
                $("#rePassWordMes").text("确认密码isOK")
            }
        }
        function verRePassword() {
            pwdChange();
        }
        function changeImg(){
            $("#imgCode").attr("src","${pageContext.request.contextPath}/imgCode.do?msg="+Math.random());
            $("#verCode").attr("value","");
        }

        function varCode(){
            flag = true;
            if($("#verCode").val()==""){
                $("#verCodeMes").attr("class", "cuo");
                $("#verCodeMes").attr("style", "color:red");
                $("#verCodeMes").text("验证码不能为空")
                flag=false;
                return;
            }
            var coded=$("#verCode").val();

            $.ajax({
                url:"${pageContext.request.contextPath}/imgCoded.do",
                dataType:"text",
                data:{
                    code1:coded,
                },
                success:function(data){
                    console.log(data);
                    if("yes"==data){
                        $("#verCodeMes").attr("class", "dui");
                        $("#verCodeMes").attr("style", "color:green");
                        $("#verCodeMes").text("验证码isOK")
                        flag=true;
                    }else{
                        $("#verCodeMes").attr("class", "cuo");
                        $("#verCodeMes").attr("style", "color:red");
                        $("#verCodeMes").text("验证码isNotOK")
                        flag=false;
                    }
                }
            })
        }
        function imgChange(){
            changeImg();
            varCode();
        }
        function registering() {
            return flag;
        }
    </script>
</head>

<body>

<!--header-->
<%@include file="includePage/header.jsp" %>
<!--logo search weweima-->
<%@ include file="includePage/search.jsp" %>
<!--内容开始-->
<form onsubmit="return registering()" action="${pageContext.request.contextPath}/user/login1.do">
    <div class="password-con registered">
        <div class="psw">
            <p class="psw-p1">用户名</p>
            <input type="text" value="${user.userName}" id="userName123" name="userName" onchange="register()"
                   placeholder="用户名中不能包含空格" required/>
            <span id="userNameMes"></span>
        </div>
        <div class="psw">
            <p class="psw-p1">输入密码</p>
            <input type="text" value="${user.passWord}" onblur="verPassWord()" onchange="pwdChange()" id="passWord123" name="passWord"
                   placeholder="请输入密码(密码由8-16的字母、数字、符号组成)" required/>
            <span id="passWordMes"></span>
        </div>
        <div class="psw">
            <p class="psw-p1">确认密码</p>
            <input type="text" onblur="verRePassword()" id="rePassWord" name="rePassWord" placeholder="请再次确认密码"
                   required/>
            <span id="rePassWordMes"></span>
        </div>
        <div class="psw psw2">
            <p class="psw-p1">手机号/邮箱</p>
            <input type="text" value="${user.phone}" id="phone" pattern="1[3-8]\d{9}" name="phone"
                   placeholder="请输入手机号/邮箱" required/>
            <%-- <button>获取短信验证码</button>--%>
        </div>
<%--        <div class="psw psw3">
            <p class="psw-p1">验证码</p>
            <input type="text" placeholder="请输入手机/邮箱验证码"/>
        </div>--%>
        <div class="psw psw3">
            <p class="psw-p1">验证码</p>
            <input type="text" id="verCode" onblur="varCode()" placeholder="请输入验证码" required/>
            <span id="verCodeMes"></span>
        </div>
        <div class="yanzhentu">
            <div class="yz-tu f-l">
                <img id="imgCode" src="${pageContext.request.contextPath}/imgCode.do"/>
            </div>
            <p class="f-l">看不清？<a href="#" onclick="imgChange()">换张图</a></p>
            <div style="clear:both;"></div>
        </div>
        <div class="agreement">
            <input type="checkbox" id="hobby" name="hobby" required></input>
            <p>我有阅读并同意<span>《宅客微购网站服务协议》</span></p>
        </div>
        <input class="psw-btn" type="submit" value="立即注册"/>
        <p class="sign-in">已有账号？请<a href="${pageContext.request.contextPath}/user/login.do">登录</a></p>
    </div>
</form>
<!--底部一块-->
<%@include file="includePage/foot.jsp" %>

</body>
</html>

