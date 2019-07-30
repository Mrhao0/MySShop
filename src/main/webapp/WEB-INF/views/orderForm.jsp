<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的订单</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>
    <script type="text/javascript">
        $(function(){
            $("[name='delOrder']").click(function(){
                var oid=$(this).attr("id");
                console.log(oid);
                $.ajax({
                    url:"${pageContext.request.contextPath}/order/delete.do",
                    data:{
                        oid:oid
                    },
                    success:function(data){
                        console.log(data);
                        if(data=="t"){
                            $("#orderit"+oid).remove();
                            window.location.reload();
                        }
                    }
                })
            })
            $("[name='signin']").click(function(){
                var oid=$(this).attr("id");
                $.ajax({
                    url:"${pageContext.request.contextPath}/order/signin.do",
                    data:{
                        oid:oid
                    },
                    success:function(data){
                        console.log(data);
                            window.location.reload();
                    }
                })
            })
        })
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
    	<div class="order-right f-r">
        	<div class="order-hd">
            	<dl class="f-l">
                	<dt>
                    	<a href="#"><img src="${pageContext.request.contextPath}/images/data-tu2.gif" /></a>
                    </dt>
                    <dd>
                    	<h3><a href="#">RH了</a></h3>
                        <p>zhao601884596</p>
                    </dd>
                    <div style="clear:both;"></div>
                </dl>
                <c:set var="dfk" value="0"></c:set>
                <c:set var="dfh" value="0"></c:set>
                <c:set var="dqs" value="0"></c:set>
                <c:set var="dpj" value="0"></c:set>
                <c:forEach items="${requestScope.Olist}" var="ob">
                    <c:if test="${ob.odel==0}">
                    <c:if test="${ob.state==1}">
                        <c:set var="dfk" value="${dfk+1}"></c:set>
                    </c:if>
                    <c:if test="${ob.state==2}">
                        <c:set var="dfh" value="${dfh+1}"></c:set>
                    </c:if>
                    <c:if test="${ob.state==3}">
                        <c:set var="dqs" value="${dqs+1}"></c:set>
                    </c:if>
                    <c:if test="${ob.state==4}">
                        <c:set var="dpj" value="${dpj+1}"></c:set>
                    </c:if>
                    </c:if>
                </c:forEach>
                <div class="ord-dai f-l">
                	<p><a href="${pageContext.request.contextPath}/order/orderform.do?state=1">待付款</a><span>${dfk}</span></p>
                	<p><a href="${pageContext.request.contextPath}/order/orderform.do?state=2">待发货</a><span>${dfh}</span></p>
                	<p><a href="${pageContext.request.contextPath}/order/orderform.do?state=3">待签收</a><span>${dqs}</span></p>
                	<p><a href="${pageContext.request.contextPath}/order/orderform.do?state=4">待评价</a><span>${dpj}</span></p>
                </div>
                <div style="clear:both;"></div>
            </div>
            <div class="order-md">
            	<div class="md-tit">
                	<h3>我的订单</h3>
                </div>
                <div class="md-hd">
                	<P class="md-p1"></P>
                    <p class="md-p2">商品信息</p>
                    <p class="md-p3">规格</p>
                    <p class="md-p4">单价（元）</p>
                    <p class="md-p5">金额（元）</p>
                    <p class="md-p6">操作</p>
                </div>

                <c:forEach items="${requestScope.orderBean.list}" var="ob">

                    <c:if test="${ob.state == 1}">
                        <c:set var="state" value="待支付"></c:set>
                    </c:if>
                    <c:if test="${ob.state == 2}">
                        <c:set var="state" value="待送货"></c:set>
                    </c:if>
                    <c:if test="${ob.state == 3}">
                        <c:set var="state" value="代签收"></c:set>
                    </c:if>
                    <c:if test="${ob.state == 4}">
                        <c:set var="state" value="带评论"></c:set>
                    </c:if>

                <div id="orderit${ob.oid}">
                <div class="md-info" >
                	<div class="dai" >
                    	<span>${state}</span>  <span>订单编号:${ob.oid}</span>
                    </div>
                    <c:forEach items="${ob.orderItemExts}" var="oboi">

                    <div class="dai-con" style="height: 100px;">
                    	<dl class="dl1">
                        	<dt>
                                <a href="#" class="f-l"><img src="${pageContext.request.contextPath}/images/dai.gif" /></a>
                                <div style="clear:both;"></div>
                            </dt>
                            <dd>
                            	<p>${fn:substring(oboi.productInfmation.pname,0,14)}...</p>
                                <span>X ${oboi.count}</span>
                            </dd>
                            <div style="clear:both;"></div>
                        </dl>
                        <div class="dai-right f-l">
                        	<P class="d-r-p1">颜色：蓝色<br />尺码：XL</P>
                            <p class="d-r-p2">¥ <span>${oboi.productInfmation.shopPrice}</span></p>
                            <p class="d-r-p3">¥ <span>${oboi.subtotal}</span></p>
                            <p class="d-r-p4"><a href="#"></a><br /><a href="#"></a><br /><a href="#"></a></p>
                        </div>

                    </div>
                    </c:forEach>
                </div>
                <div style="margin-left: 850px">
                    <p>总计:${ob.total}</p>
                    <c:if test="${ob.state == 1}">
                        <p><a href="${pageContext.request.contextPath}/order/topay1.do?oid=${ob.oid}">支付订单</a></p>
                        <p><a id="${ob.oid}" name="delOrder" href="#">删除订单</a></p>
                    </c:if>
                    <c:if test="${ob.state == 2}">
                        <p>催发货</p>
                        <p><a id="${ob.oid}" name="delOrder" href="#">删除订单</a></p>
                    </c:if>
                    <c:if test="${ob.state == 3}">
                        <p><a id="${ob.oid}" name="signin" href="#">签收</a></p>
                        <p><a id="${ob.oid}" name="delOrder" href="#">删除订单</a></p>
                    </c:if>
                    <c:if test="${ob.state == 4}">
                        <p><a id="${ob.oid}" name="delOrder" href="#">删除订单</a></p>
                        <p>评论</p>
                    </c:if>
                </div>
                </div>

                </c:forEach>
                <!--分页-->
                <c:if test="${empty param.pageNow || param.pageNow<1}">
                    <c:set var="pageN" value="1"></c:set>
                </c:if>
                <c:if test="${!empty param.pageNow}">
                    <c:set var="pageN" value="${param.pageNow}"></c:set>
                </c:if>
                <c:if test="${pageN>requestScope.orderBean.pageCount}">
                    <c:set var="pageN" value="${searchProduct.pageCount}"></c:set>
                </c:if>
                <c:if test="${pageN<3}">
                    <c:set var="star" value="1"></c:set>
                    <c:set var="end" value="5"></c:set>
                </c:if>
                <c:if test="${requestScope.orderBean.pageCount<5}">
                    <c:set var="star" value="1"></c:set>
                    <c:set var="end" value="${requestScope.orderBean.pageCount}"></c:set>
                </c:if>
                <c:if test="${pageN>requestScope.orderBean.pageCount-2}">
                    <c:set var="star" value="${requestScope.orderBean.pageCount-4}"></c:set>
                    <c:set var="end" value="${requestScope.orderBean.pageCount}"></c:set>
                </c:if>
                <c:if test="${pageN>=3 && pageN<=requestScope.orderBean.pageCount-2}">
                    <c:set var="star" value="${pageN-2}"></c:set>
                    <c:set var="end" value="${pageN+2}"></c:set>
                </c:if>
                <div class="paging">
                    <div class="pag-left f-l">
                        <c:if test="${pageN!=1}">
                            <a href="${pageContext.request.contextPath}/order/orderform.do?pageNow=1&state=${param.state}" class="about left-r f-l"><<</a>
                            <a href="${pageContext.request.contextPath}/order/orderform.do?pageNow=${pageN-1}&state=${param.state}" class="about left-r f-l"><</a>
                        </c:if>
                        <ul class="left-m f-l">
                            <c:forEach begin="${star}" end="${end}" var="i">
                                <li class="${i==pageN?"current":""}"><a href="${pageContext.request.contextPath}/order/orderform.do?pageNow=${i}&state=${param.state}">${i}</a></li>
                            </c:forEach>
                            <div style="clear:both;"></div>
                        </ul>
                        <c:if test="${pageN!=requestScope.orderBean.pageCount}">
                            <a href="${pageContext.request.contextPath}/order/orderform.do?pageNow=${pageN+1}&state=${param.state}" class="about left-l f-l">></a>
                            <a href="${pageContext.request.contextPath}/order/orderform.do?pageNow=${requestScope.orderBean.pageCount}&state=${param.state}" class="about left-l f-l">>></a>
                        </c:if>
                        <div style="clear:both;"></div>
                    </div>
                    <div class="pag-right f-l">
                        <form action="${pageContext.request.contextPath}/order/orderform.do?state=${param.state}" method="post">
                            <div class="jump-page f-l">
                                到第<input id="pageNowId" name="pageNow" type="number" />页
                            </div>
                            <button type="submit" class="f-l">确定</button>
                            <div style="clear:both;"></div>
                        </form>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div class="md-ft">
                	<P class="md-p1"><input type="checkbox" name="hobby" value=""></input><span>全选</span></P>
                    <a href="#">删除</a>
                    <a href="#">加入收藏夹<span>（此处始终在屏幕下方）</span></a>
                   <%-- <button>结算</button>--%>
                </div>
            </div>
            
        </div>
        <div style="clear:both;"></div>
    </div>
    
    <!--底部一块-->
<%@include file="includePage/foot.jsp" %>
    
    <!--查看物流 弹窗-->
    <%--<div class="view-logistics">
    	<div class="view-bg"></div>
        <div class="view-con">
        	<div class="view-tit">
            	<h3>物流信息</h3>
                <a href="JavaScript:;" guanbi="">
                	<img src="${pageContext.request.contextPath}/images/close-select-city.gif" />
                </a>
                <div style="clear:both;"></div>
            </div>
            <div class="view-bd">
            	<ul>
                	<li class="bd-pdl-li after"><span>1</span>2015-08-06　周四　　14:06:53您的订单开始处理</li>
                	<li class="after"><span>2</span>14:08:44您的订单待配货</li>
                	<li><span>3</span>14:16:04您的包裹已出库</li>
                	<li><span>4</span>14:16:03商家正通知快递公司揽件</li>
                	<li><span>5</span>21:47:54【惠州市】圆通速递 广东省惠州市惠东县收件员 已揽件</li>
                	<li class="bd-pdb-li"><span>6</span>22:13:51广东省惠州市惠东县公司 已发出</li>
                    <li class="bd-pdl-li"><span>7</span>2015-08-07　周五　　04:57:33广州转运中心公司 已收入</li>
                	<li><span>8</span>04:58:54广州转运中心公司 已发出</li>
                	<li><span>9</span>2015-08-08周六22:46:43重庆转运中心公司 已收入</li>
                	<li class="bd-pdb-li"><span>10</span>23:01:49【重庆市】重庆转运中心 已发出</li>
                    <li class="bd-pdl-li"><span>11</span>2015-08-09　周日　　00:57:11【重庆市】快件已到达 重庆市南岸区</li>
                	<li><span>12</span>11:14:52重庆市南岸区 已收入</li>
                	<li><span>13</span>11:14:52【重庆市】重庆市南岸区派件员：李天生 13330284757正在为您派件</li>
                	<li class="bd-bd-li"><span>14</span>15:53:14【重庆市】重庆市南岸区公司 已签收 签收人：保安，感谢使用圆通速递，期待再次为您服务</li>
                </ul>
                <p class="sign">您的包裹已被签收！</p>
            </div>
        </div>
    </div>--%>
    
</body>
</html>
