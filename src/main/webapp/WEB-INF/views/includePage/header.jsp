<%--
  Created by IntelliJ IDEA.
  User: zhenghao
  Date: 2019/7/2
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<style type="text/css">
    .little-login-h{
        position:absolute;
        left:320px;
        top:30px;
        z-index:3;
        background-color: #F7F7F7;
    }
    .little-login-h1{
        display: none;
    }
</style>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="zl-header">
    <div class="zl-hd w1200">
        <p class="hd-p1 f-l">
            Hi!您好 <a id="logined">${sessionScope.user.userName}</a>，欢迎来到宅客微购，<a href="#" id="oneclick">请登录</a>  <a href="${pageContext.request.contextPath}/user/register.do">【免费注册】</a>
        </p>
        <p class="hd-p2 f-r">
            <a href="${pageContext.request.contextPath}/product/index.do">返回首页 (个人中心)</a><span>|</span>
            <a href="${pageContext.request.contextPath}/product/cart.do">我的购物车</a><span>|</span>
            <c:if test="${!empty sessionScope.user}">
            <a id="myorder" href="${pageContext.request.contextPath}/order/orderform.do">我的订单</a><span>|</span>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                <a id="myorder" href="#">我的订单</a><span>|</span>
            </c:if>
            <a href="${pageContext.request.contextPath}/user/out.do">退出登录 </a>
        </p>
        <div style="clear:both;"></div>
    </div>
</div>
<div id="minilogin" class="little-login-h1">
            <div style="width: auto;height: auto">
                <p>用户名</p>
                <input type="text" id="userName" name="userName" value="${sessionScope.user.userName}" placeholder="用户名" required/>
                <p>密码</p>
                <input type="text" id="passWord" name="passWord" value="${sessionScope.user.passWord}" placeholder="密码可见"  required/><br />
                <input type="button" id="onlogin" value="登录">
            </div>
</div>