<%--
  Created by IntelliJ IDEA.
  User: zhenghao
  Date: 2019/7/4
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人资料</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="javascript" src="${pageContext.request.contextPath}/js/verPassWord.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>
    <script type="javascript">


        var flag=true;
        function verPassWord() {
            flag = true;
            var pwd = $("#passWord").val();
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
        function updatePassWord(){

            $.ajax({
                url:"${pageContext.request.contextPath}/user/updatePassword.do",
                data:{
                    passWord:$("#passWord").val(),
                },
            })
        }
        function saveing(){
            return flag;
        }

    </script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="includePage/header.jsp" %>
<!--logo search weweima-->
<%@ include file="includePage/search.jsp" %>
<!--nav-->
<%@ include file="includePage/nav.jsp" %>

<!--内容开始-->
<form onsubmit="return saveing()" action="${pageContext.request.contextPath}/user/save.do">
<div class="personal w1200">
    <div class="personal-left f-l">
        <div class="personal-l-tit">
            <h3>个人中心</h3>
        </div>
        <ul>
            <li class="current-li per-li1"><a href="#">消息中心<span>></span></a></li>
            <li class="per-li2"><a href="#">个人资料<span>></span></a></li>
            <li class="per-li3"><a href="#">我的订单<span>></span></a></li>
            <li class="per-li4"><a href="#">我的预约<span>></span></a></li>
            <li class="per-li5"><a href="#">购物车<span>></span></a></li>
            <li class="per-li6"><a href="#">管理收货地址<span>></span></a></li>
            <li class="per-li7"><a href="#">店铺收藏<span>></span></a></li>
            <li class="per-li8"><a href="#">购买记录<span>></span></a></li>
            <li class="per-li9"><a href="#">浏览记录<span>></span></a></li>
            <li class="per-li10"><a href="#">会员积分<span>></span></a></li>
        </ul>
    </div>
    <div class="personal-r f-r">
        <div class="personal-right">
            <div class="personal-r-tit">
                <h3>个人资料</h3>
            </div>
            <div class="data-con">
                <div class="dt1">
                    <p class="f-l">当前头像：</p>
                    <div class="touxiang f-l">
                        <div class="tu f-l">
                            <a href="#">
                                <img src="${pageContext.request.contextPath}/images/data-tu.gif" />
                                <input type="file" name="" id="" class="img1" />
                            </a>
                        </div>
                        <a href="JavaScript:;" class="sc f-l" shangchuang="">上传头像</a>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
               <%-- <div class="dt1">
                    <p class="dt-p f-l">昵称：</p>
                    <input type="text" placeholder="RH了" />
                    <div style="clear:both;"></div>
                </div>--%>
                <div class="dt1">
                    <p class="dt-p f-l">用户名：</p>
                    <input type="text" readonly id="userName" name="userName" value="${sessionScope.user.userName}" required/>
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">地址：</p>
                    <input type="text" id="addr" name="addr"  value="${sessionScope.user.addr}" />
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">真实姓名：</p>
                    <input type="text" id="name" name="name"  value="${sessionScope.user.name}" />
                    <div style="clear:both;"></div>
                </div>
                <%--<div class="dt1 dt2">
                    <p class="dt-p f-l">性别：</p>
                    <input type="radio" name="hobby" value="nan"></input><span>男</span>
                    <input type="radio" name="hobby" value="nan"></input><span>女</span>
                    <div style="clear:both;"></div>
                </div>--%>
                <%--<div class="dt1">
                    <p class="dt-p f-l">年龄：</p>
                    <input type="text" value="20" />
                    <div style="clear:both;"></div>
                </div>--%>
                <%--<div class="dt1 dt3">
                    <p class="dt-p f-l">手机号：</p>
                    <input type="text" value="12345678910" />
                    <button>获取短信验证码</button>
                    <div style="clear:both;"></div>
                </div>--%>
                <div class="dt1">
                    <p class="dt-p f-l">手机号：</p>
                    <input type="tel"  id="phone" name="phone" value="${sessionScope.user.phone}" />
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1">
                    <p class="dt-p f-l">邮箱：</p>
                    <input type="email" id="email" name="email"  value="${sessionScope.user.email}" />
                    <div style="clear:both;"></div>
                </div>
                <div class="dt1 dt4">
                    <p class="dt-p f-l">密码：</p>
                    <input type="text" onblur="verPassWord()"  id="passWord"  name="passWord"  value="${sessionScope.user.passWord}" />
                    <span id="passWordMes"></span>
                    <%-- <button onclick="updatePassWord()">修改密码</button>--%>
                    <div style="clear:both;"></div>
                </div>
                <input type="submit" class="btn-pst" value="保存">
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>
</form>
<!--上传头像弹窗
<div class="tanchuang">
    <div class="t-c-bg"></div>
    <div class="t-c-con">
        <div class="tc-tit">
            <h3>上传头像</h3>
            <a href="JavaScript:;" delete=""><img src="${pageContext.request.contextPath}/images/t-c-del.gif" /></a>
            <div style="clear:both;"></div>
        </div>
        <div class="tc-con">
            <a href="#"><img src="${pageContext.request.contextPath}/images/tc-tu.gif" /></a>
            <button>保存头像</button>
        </div>
    </div>
</div>-->

<!--底部一块-->
<%@include file="includePage/foot.jsp" %>
</body>
</html>
