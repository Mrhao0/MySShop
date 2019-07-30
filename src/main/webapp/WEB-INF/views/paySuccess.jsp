<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>支付成功</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>
    <script type="text/javascript">
        $(function(){
        })
    </script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="includePage/header.jsp" %>
<!--logo search weweima-->
<%@ include file="includePage/search.jsp" %>
    
    <!--内容开始-->

    <div class="payment w1200">
    	<div class="payment-hd">
        	<h3 class="success">支付成功</h3>
        </div>
        <c:forEach items="${requestScope.ordersExt.orderItemExts}" var="pro">
        <div class="payment-bd">
        	<dl class="dl-hd">
            	<dt><a href="#"><img style="height: 100px;width: 150px" src="${pro.productInfmation.image}" /></a></dt>
                <dd>
                	<h3><a href="#">${pro.productInfmation.pname}</a>  <span style="color: #8C8C8C">数量:(${pro.count})</span></h3>
                    <P>${fn:substring(pro.productInfmation.pdesc,0 ,14 )}...</P>
                </dd>
                <div style="clear:both;"></div>
            </dl>
            <ul class="ul-bd">
            	<li><span>送货至</span><p>${requestScope.ordersExt.addr}</p></li>
            	<li><span>价格</span><p><i>${pro.subtotal}</i></p></li>
            	<li><span>卖家名称</span><p>向东食品专营店</p></li>
            	<li><span>收货信息</span><p>${requestScope.ordersExt.addr}， ${requestScope.ordersExt.name}，${requestScope.ordersExt.phone}， 000000</p></li>
            	<li><span>成交时间</span><p>${requestScope.ordersExt.ordertime}</p></li>
            	<li><span>订单号</span><p>${requestScope.ordersExt.oid}</p></li>
            </ul>
        </div>
        </c:forEach>
        <div class="payment-ft">
        	<button class="btn2"><a href="${pageContext.request.contextPath}/order/orderform.do">我的订单</a></button>
        </div>
    </div>

    <!--底部一块-->
<%@include file="includePage/foot.jsp" %>
</body>
</html>
