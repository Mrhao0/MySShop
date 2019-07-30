<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>确认订单</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>
    <script type="text/javascript">
        $(function(){
            var count=0.0;
            $("[name='OIsubtatol']").each(function(){
                console.log($(this).text());
                count=count+Number($(this).text());
            });
            $("#count").text(count);
            $("#lcount").text(count);
            console.log(count);
        })
        function verlogin(){
            if(${empty sessionScope.user}){
                alert("请先登录,谢谢")
                return false;
            }
            return true;
        }
    </script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="includePage/header.jsp" %>
<!--logo search weweima-->
<%@ include file="includePage/search.jsp" %>

    
    <!--内容开始-->
<form onsubmit="return verlogin()" action="${pageContext.request.contextPath}/order/topay.do">
    <div class="payment-interface w1200">
    	<div class="pay-info">
        	<div class="info-tit">
            	<h3>选择收货地址</h3>
            </div>
            <%--<ul class="pay-dz">
            	<li class="current">
                	<h3><span class="sp1">重庆</span><span class="sp2">南岸区</span>（<span class="sp3">赵珍珍</span> 收）</h3>
                    <p><span class="sp1">南岸南坪南岸区南坪福红路19号乙单元7-2</span><span class="sp2">18983945092</span></p>
                    <a href="JavaScript:;" xiugai="">修改</a>
                </li>
                <li>
                	<h3><span class="sp1">长寿</span><span class="sp2">长寿湖</span>（<span class="sp3">赵珍珍2</span> 收）</h3>
                    <p><span class="sp1">长寿长寿南坪福红路19号乙单元8-8</span><span class="sp2">18888888888</span></p>
                    <a href="JavaScript:;" xiugai="">修改</a>
                </li>
                <li>
                	<h3><span class="sp1">李家沱</span><span class="sp2">土桥</span>（<span class="sp3">赵珍2</span> 收）</h3>
                    <p><span class="sp1">李家沱土桥南坪福红路19号华盛顿乙单元8-8</span><span class="sp2">19999999999</span></p>
                    <a href="JavaScript:;" xiugai="">修改</a>
                </li>
                <div style="clear:both;"></div>
            </ul>--%>

            <div class="psw">
                <p><input name="name" style="height: 25px;width: 200px" type="text" placeholder="收件人" value="${sessionScope.user.name}" required><span style="color: red">*</span></p>
                <p><input name="addr" style="height: 25px;width: 200px" type="text" placeholder="收件人地址" value="${sessionScope.user.addr}"  required><span style="color: red">*</span></p>
                <p><input name="phone" style="height: 25px;width: 200px" type="text" placeholder="收件人电话号码" value="${sessionScope.user.phone}"  required><span style="color: red">*</span></p>
            </div>
            <%--button class="pay-xdz-btn">使用新地址</button>--%>
        </div>
        <div class="pay-info">
        	<div class="info-tit" style="border-bottom:0;">
            	<h3>订单信息</h3>
            </div>
        </div>

        <div class="cart-con-info">
        	<div class="cart-con-tit" style="margin:20px 0 5px;">
                <p class="p1" style="width:400px;">
                    <span>商家：向东服饰专卖店</span>
                </p>
                <p class="p3" style="width:145px;">规格</p>
                <p class="p4" style="width:130px;">数量</p>

                <p class="p5">单价（元）</p>
                <p class="p6" style="width:173px;">金额（元）</p>

            </div>
            <c:forEach items="${sessionScope.Cart.cartMap}" var="pItem">

            <c:forEach items="${requestScope.pids}" var="pid">
            <c:if test="${pid==pItem.value.productInfmation.pid}">
                <input type="hidden" name="pids" value="${pid}">
            <div class="info-mid">
                <div class="mid-tu f-l">
                	<a href="#"><img style="width: 150px;height: 100px" src="${pItem.value.productInfmation.image}" /></a>
                </div>
                <div class="mid-font f-l" style="width: 220px;">
                	<a href="#">${pItem.value.productInfmation.pname}<br />${fn:substring(pItem.value.productInfmation.pdesc,0,14)}...</a>
                </div>
                <div class="mid-guige1 f-l" style="margin-right:60px;">
                	<p>颜色：蓝色</p>
                    <p>尺码：XL</p>
                </div>
                <div class="mid-sl f-l" style="margin:10px 85px 0px 0px;">
                	<%--<a href="JavaScript:;" class="sl-left">-</a>--%>
                    <input readonly type="text" value="${pItem.value.number}" />
                    <%--<a href="JavaScript:;" class="sl-right">+</a>--%>
                </div>
                <p class="mid-dj f-l">¥ ${pItem.value.productInfmation.shopPrice}</p>
                <p  class="mid-je f-l" style="margin:10px 120px 0px 0px;">¥ <span name="OIsubtatol">${pItem.value.subtotal}</span></p>
<%--                <div class="mid-chaozuo f-l">
                	<select>
                    	<option>送货上门</option>
                    	<option>快递包邮</option>
                    </select>
                </div>--%>
                <div style="clear:both;"></div>
            </div>
            </c:if>
            </c:forEach>
            </c:forEach>
            <div class="info-heji">
                <p class="f-r">店铺合计(含运费)：¥<span id="lcount"></span></p>
            </div>
            <div class="info-tijiao">
            	<p class="p1">实付款：￥<span id="count"></span></p>
                <button type="submit" class="btn">提交订单</button>
            </div>
        </div>

    </div>
</form>
    <!--底部一块-->
<%@include file="includePage/foot.jsp" %>
    
    <!--确认订单（新增地址）-->
    <%--<div class="confirmation-tanchuang" xgdz1="">
    	<div class="tanchuang-bg"></div>
    	<div class="tanchuang-con">
        	<div class="tc-title">
            	<h3>新增地址</h3>
                <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
                <div style="clear:both;"></div>
            </div>
            <ul class="tc-con2">
            	<li class="tc-li1">
                	<p class="l-p">所在地区<span>*</span></p>
                    <div class="xl-dz">
                    	<div class="dz-left f-l">
                        	<p>新疆</p>
                            <ul>
                            	<li class="current"><a href="#">新疆</a></li>
                            	<li><a href="#">甘肃</a></li>
                            	<li><a href="#">宁夏</a></li>
                            	<li><a href="#">青海</a></li>
                            	<li><a href="#">重庆</a></li>
                            	<li><a href="#">长寿</a></li>
                            </ul>
                        </div>
                        <div class="dz-right f-l">
                        	<p>乌鲁木齐</p>
                            <ul>
                            	<li class="current"><a href="#">乌鲁木齐</a></li>
                            	<li><a href="#">昌吉</a></li>
                            	<li><a href="#">巴音</a></li>
                            	<li><a href="#">郭楞</a></li>
                            	<li><a href="#">伊犁</a></li>
                            	<li><a href="#">阿克苏</a></li>
                            	<li><a href="#">喀什</a></li>
                            	<li><a href="#">哈密</a></li>
                            	<li><a href="#">克拉玛依</a></li>
                            	<li><a href="#">博尔塔拉</a></li>
                            	<li><a href="#">吐鲁番</a></li>
                            	<li><a href="#">和田</a></li>
                            	<li><a href="#">石河子</a></li>
                            	<li><a href="#">克孜勒苏</a></li>
                            	<li><a href="#">阿拉尔</a></li>
                            	<li><a href="#">五家渠</a></li>
                            	<li><a href="#">图木舒克</a></li>
                            	<li><a href="#">库尔勒</a></li>
                                <div style="clear:both;"></div>
                            </ul>
                        </div>
                    	<div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">详细地址<span>*</span></p>
                    <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">邮政编码<span></span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">收货人姓名<span>*</span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">联系电话<span>*</span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
            </ul>
            <button class="btn-pst2">保存</button>
        </div>
    </div>--%>
    
    <!--修改地址-->
    <%--<div class="confirmation-tanchuang" xgdz2="">
    	<div class="tanchuang-bg"></div>
    	<div class="tanchuang-con">
        	<div class="tc-title">
            	<h3>新增地址</h3>
                <a href="JavaScript:;" dz-guan=""><img src="${pageContext.request.contextPath}/images/close-select-city.gif" /></a>
                <div style="clear:both;"></div>
            </div>
            <ul class="tc-con2">
            	<li class="tc-li1">
                	<p class="l-p">所在地区<span>*</span></p>
                    <div class="xl-dz">
                    	<div class="dz-left f-l">
                        	<p>北京</p>
                            <ul>
                            	<li class="current"><a href="#">新疆</a></li>
                            	<li><a href="#">甘肃</a></li>
                            	<li><a href="#">宁夏</a></li>
                            	<li><a href="#">青海</a></li>
                            	<li><a href="#">重庆</a></li>
                            	<li><a href="#">长寿</a></li>
                            </ul>
                        </div>
                        <div class="dz-right f-l">
                        	<p>天安门</p>
                            <ul>
                            	<li class="current"><a href="#">乌鲁木齐</a></li>
                            	<li><a href="#">昌吉</a></li>
                            	<li><a href="#">巴音</a></li>
                            	<li><a href="#">郭楞</a></li>
                            	<li><a href="#">伊犁</a></li>
                            	<li><a href="#">阿克苏</a></li>
                            	<li><a href="#">喀什</a></li>
                            	<li><a href="#">哈密</a></li>
                            	<li><a href="#">克拉玛依</a></li>
                            	<li><a href="#">博尔塔拉</a></li>
                            	<li><a href="#">吐鲁番</a></li>
                            	<li><a href="#">和田</a></li>
                            	<li><a href="#">石河子</a></li>
                            	<li><a href="#">克孜勒苏</a></li>
                            	<li><a href="#">阿拉尔</a></li>
                            	<li><a href="#">五家渠</a></li>
                            	<li><a href="#">图木舒克</a></li>
                            	<li><a href="#">库尔勒</a></li>
                                <div style="clear:both;"></div>
                            </ul>
                        </div>
                    	<div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">详细地址<span>*</span></p>
                    <textarea class="textarea1" placeholder="请如实填写您的详细信息，如街道名称、门牌号、楼层号和房间号。"></textarea>
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">邮政编码<span></span></p>
                    <input type="text" />
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">收货人姓名<span>*</span></p>
                    <input type="text" class="shxm" />
                    <div style="clear:both;"></div>
                </li>
            	<li class="tc-li1">
                	<p class="l-p">联系电话<span>*</span></p>
                    <input type="text" class="lxdh" />
                    <div style="clear:both;"></div>
                </li>
            </ul>
            <button class="btn-pst2">保存</button>
        </div>
    </div>--%>
</body>
</html>
