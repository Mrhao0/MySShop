<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>中林首页</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/zhonglingxm2.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>

    <script type="text/javascript">
        $(function(){

        })
    </script>
</head>
<body id="top">

<!--header-->
<%@include file="includePage/header.jsp" %>
<!--logo search weweima-->
<%@ include file="includePage/search.jsp" %>

	<!--nav-->
    <div class="nav-box">
    	<div class="nav-kuai w1200">
        	<div class="nav-kuaijie f-l">
            	<a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
                <div class="kuaijie-box">
                    <c:forEach items="${requestScope.productType}" begin="0" end="5" var="pro">
                	<div class="kuaijie-info">
                    	<dl class="kj-dl1">
                        	<dt><img src="${pageContext.request.contextPath}/images/zl2-07.gif" /><a href="${pageContext.request.contextPath}/product/productlist.do?cid=${pro.cid}">${pro.cname}</a></dt>
                            <dd>
                                <c:forEach items="${pro.productSuperList}" begin="0" end="2" var="SPpro" varStatus="vs">
                            	<a href="${pageContext.request.contextPath}/product/productlist.do?cid=${SPpro.cid}&csid=${SPpro.csid}">${SPpro.csname}</a>
                                    <c:if test="${!vs.last}">
                                    <span>|</span>
                                </c:if>
                                </c:forEach>
                            </dd>
                        </dl>
                        <div class="kuaijie-con">
                        	<dl class="kj-dl2" style="display:inline-block">
                            	<dt><a href="${pageContext.request.contextPath}/product/productlist.do?cid=${pro.cid}">${pro.cname}</a></dt>
                                <dd>
                                    <c:forEach items="${pro.productSuperList}" var="SPpro" varStatus="vs">
                                   	<a href="productlist.do?cid=${SPpro.cid}&csid=${SPpro.csid}">${SPpro.csname}
                                        <c:if test="${!vs.last}">
                                        <span>|</span>
                                        </c:if>
                                        </c:forEach>
                                </dd>
                            </dl>
                            <div style="clear:both;"></div>
                        </div>
                    </div>
                   </c:forEach>
                </div>
            </div>
            <ul class="nav-font f-l">
<c:forEach items="${requestScope.productType}" begin="0" end="5" var="pro">
    <li><a href="${pageContext.request.contextPath}/product/productlist.do?cid=${pro.cid}">${pro.cname}</a></li>
</c:forEach>
                <div style="clear:both;"></div>
            </ul>
            <div style="clear:both;"></div>
        </div>
    </div>
	
    <!--banner-->
    <div class="banner">
    	<ul class="ban-ul1">
        	<li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png" /></a></li>
        	<li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png" /></a></li>
        	<li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png" /></a></li>
        	<li><a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/banner.png" /></a></li>
        </ul>
        <div class="ban-box w1200">
        	<ol class="ban-ol1">
            	<li class="current"></li>
            	<li></li>
            	<li></li>
            	<li></li>
               	<div style="clear:both;"></div>
            </ol>
        </div>
    </div>
    
    <!--热门推荐-->
    <div class="zl-tuijian w1200">
    	<div class="tuijian-left f-l">
        	<img src="${pageContext.request.contextPath}/images/zl2-14.png" />
        </div>
    	<ul class="tuijian-right f-l">
        	<li>
            	<div class="li-box li-box1">
                	<a href="JavaScript:;" class="li-a1">锦尚世家</a>
                	<a href="JavaScript:;" class="li-a2">锦绣花苑　传承世家</a>
                    <a href="JavaScript:;" class="li-a3">more</a>
                </div>
            </li>
        	<li>
            	<div class="li-box li-box2">
                	<a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                	<a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                    <a href="JavaScript:;" class="li-a3">more</a>
                </div>
            </li>
        	<li>
            	<div class="li-box li-box3">
                	<a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                	<a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                    <a href="JavaScript:;" class="li-a3">more</a>
                </div>
            </li>
        	<li>
            	<div class="li-box li-box4">
                	<a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                	<a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                    <a href="JavaScript:;" class="li-a3">more</a>
                </div>
            </li>
        	<li>
            	<div class="li-box li-box5">
                	<a href="JavaScript:;" class="li-a1">速8快捷酒店</a>
                	<a href="JavaScript:;" class="li-a2">最大的经济型酒店</a>
                    <a href="JavaScript:;" class="li-a3">more</a>
                </div>
            </li>
        	<li>
            	<div class="li-box li-box6">
                	<a href="JavaScript:;" class="li-a1">老诚一锅羊蝎子火锅</a>
                	<a href="JavaScript:;" class="li-a2">最养生的火锅</a>
                    <a href="JavaScript:;" class="li-a3">more</a>
                </div>
            </li>
        	<li>
            	<div class="li-box li-box7">
                	<a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                	<a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                    <a href="JavaScript:;" class="li-a3">more</a>
                </div>
            </li>
        	<li>
            	<div class="li-box li-box8">
                	<a href="JavaScript:;" class="li-a1">鹏程之家汽车店</a>
                	<a href="JavaScript:;" class="li-a2">最便宜的汽车4S店</a>
                    <a href="JavaScript:;" class="li-a3">more</a>
                </div>
            </li>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
    
    <!--1F  在线商城-->
    <div class="zl-info w1200">
    	<div class="zl-title1">
        	<h3 class="title1-h3 f-l">1F  在线商城</h3>
            <ul class="title1-ul1 f-r">
            	<li class="current"><a href="JavaScript:;">食品/饮料/酒水</a></li>
            	<li><a href="JavaScript:;">粮油副食</a></li>
                <div style="clear:both;"></div>
            </ul>
            <div style="clear:both;"></div>
        </div>
        <div class="zl-con">
        	<div class="zl-con-left f-l">
            	<div class="zl-tu">
                	<img src="${pageContext.request.contextPath}/images/zl2-33.gif" class="zl-img" />
                </div>
                <p class="zl-lp">
                    黑色星期五</br>
                    优惠力度大
                </p>
                <ul class="zl-lhover">
                	<li><a href="productList.jsp">饼干糕点</a></li>
                	<li><a href="productList.jsp">厨房调味</a></li>
                	<li><a href="productList.jsp">厨房清洁</a></li>
                	<li><a href="productList.jsp">洗浴用品</a></li>
                	<li><a href="productList.jsp">宝宝喂养</a></li>
                	<li><a href="productList.jsp">家居彩电</a></li>
                	<li><a href="productList.jsp">宝宝喂养</a></li>
                	<li><a href="productList.jsp">家居彩电</a></li>
                	<li><a href="productList.jsp">厨房清洁</a></li>
                	<li><a href="productList.jsp">洗浴用品</a></li>
                	<li><a href="productList.jsp">宝宝喂养</a></li>
                	<li><a href="productList.jsp">家居彩电</a></li>
                	<li><a href="productList.jsp">宝宝喂养</a></li>
                	<li><a href="productList.jsp">家居彩电</a></li>
                    <div style="clear:both;"></div>
                </ul>
            </div>
        	<div class="zl-con-right f-l">
            	<div class="zl-rbox lihover">
                	<div class="rbox-left f-l">
                    	<div class="rbox-ltop"><a href="productInfmation.jsp"><img src="${pageContext.request.contextPath}/images/zl2-48.png" /></a></div>
                    	<ul class="rbox-lft">
                        	<li>
                            	<a href="productInfmation.jsp" class="a1">周黑鸭 鸭翅</a>
                                <p>￥25.00/袋</p>
                                <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-46.gif" /></a>
                            </li>
                        	<li>
                            	<a href="productInfmation.jsp" class="a1">特产中国山西大枣</a>
                                <p>￥25.00/袋</p>
                                <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-44.gif" /></a>
                            </li>
                        	<li>
                            	<a href="productInfmation.jsp" class="a1">Wonderful 盐焗开心果</a>
                                <p>￥39.00/袋</p>
                                <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-45.gif" /></a>
                            </li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                	<ul class="rbox-right f-l">
                    	<li>
                            <a href="productInfmation.jsp" class="a1">人头马XO香槟干邑白兰地</a>
                            <p>￥1950.00/件</p>
                            <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-47.gif" /></a>
                        </li>
                    	<li>
                            <a href="productInfmation.jsp" class="a1">DNZ新西兰进口蜂蜜</a>
                            <p>￥199.00/500ML</p>
                            <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-42.gif" /></a>
                        </li>
                    	<li>
                            <a href="productInfmation.jsp" class="a1">可口可乐樱桃味碳酸饮料</a>
                            <p>￥5.90/罐</p>
                            <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-48.gif" /></a>
                        </li>
                    	<li>
                            <a href="productInfmation.jsp" class="a1">马爹利蓝带干邑白兰地</a>
                            <p>￥3450.00/件</p>
                            <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-43.gif" /></a>
                        </li>
                        <div style="clear:both;"></div>
                    </ul>
                    <div style="clear:both;"></div>
                </div>
                <div class="zl-rbox lihover">
                	<div class="rbox-left f-l">
                    	<div class="rbox-ltop"><a href="productInfmation.jsp"><img src="${pageContext.request.contextPath}/images/zl2-48.png" /></a></div>
                    	<ul class="rbox-lft">
                        	<li>
                            	<a href="productInfmation.jsp" class="a1">特产中国山西大枣</a>
                                <p>￥25.00/袋</p>
                                <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-44.gif" /></a>
                            </li>
                        	<li>
                            	<a href="productInfmation.jsp" class="a1">Wonderful 盐焗开心果</a>
                                <p>￥39.00/袋</p>
                                <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-45.gif" /></a>
                            </li>
                        	<li>
                            	<a href="productInfmation.jsp" class="a1">周黑鸭 鸭翅</a>
                                <p>￥25.00/袋</p>
                                <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-46.gif" /></a>
                            </li>
                            <div style="clear:both;"></div>
                        </ul>
                    </div>
                	<ul class="rbox-right f-l">
                    	<li>
                            <a href="productInfmation.jsp" class="a1">DNZ新西兰进口蜂蜜</a>
                            <p>￥199.00/500ML</p>
                            <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-42.gif" /></a>
                        </li>
                    	<li>
                            <a href="productInfmation.jsp" class="a1">马爹利蓝带干邑白兰地</a>
                            <p>￥3450.00/件</p>
                            <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-43.gif" /></a>
                        </li>
                    	<li>
                            <a href="productInfmation.jsp" class="a1">人头马XO香槟干邑白兰地</a>
                            <p>￥1950.00/件</p>
                            <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-47.gif" /></a>
                        </li>
                    	<li>
                            <a href="productInfmation.jsp" class="a1">可口可乐樱桃味碳酸饮料</a>
                            <p>￥5.90/罐</p>
                            <a href="productInfmation.jsp" class="a2"><img src="${pageContext.request.contextPath}/images/zl2-48.gif" /></a>
                        </li>
                        <div style="clear:both;"></div>
                    </ul>
                    <div style="clear:both;"></div>
                </div>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
    
    <!--2F  餐饮娱乐-->
<c:forEach items="${requestScope.productType}" var="fType">
    <div class="zl-info w1200">
    	<div class="zl-title1" style="border-color:#FF9A02;">
        	<h3 class="title1-h3 f-l">${fType.cname}</h3>
            <ul class="title1-ul1 title1-ul2 f-r">
                <c:forEach items="${fType.productSuperList}" var="sType" varStatus="vs">
            	<li class="${vs.first?'current':''}"><a href="JavaScript:;">${sType.csname}</a></li>
                </c:forEach>
                <div style="clear:both;"></div>
            </ul>
            <div style="clear:both;"></div>
        </div>

        <div class="zl-con">
        	<div class="zl-con-left f-l" style="background:#FBEAD0;">
            	<div class="zl-tu">
                	<img src="${pageContext.request.contextPath}/images/zl2-34.gif" class="zl-img" />
                </div>
                <p class="zl-lp" style="color:#FF9901;">
                    周末，嗨起来</br>
                    兄弟，躁起来
                </p>
                <ul class="zl-lhover" style=" background:#FF9A02;">
                	<li><a href="JavaScript:;">山珍海味</a></li>
                	<li><a href="JavaScript:;">特色美食</a></li>
                	<li><a href="JavaScript:;">主题酒店</a></li>
                	<li><a href="JavaScript:;">公寓酒店</a></li>
                	<li><a href="JavaScript:;">豪华酒店</a></li>
                	<li><a href="JavaScript:;">度假酒店</a></li>
                	<li><a href="JavaScript:;">青年旅社</a></li>   
                    <div style="clear:both;"></div>
                </ul>
            </div>
        	<div class="zl-con-right f-l">
                <c:forEach items="${fType.productSuperList}" var="sType">
            	<ul class="zl-rul1 lihover">
                    <c:forEach items="${sType.superSentedList}" var="tType">
                	<li>
                    	<div class="sy-tu1">
                        	<a href="${pageContext.request.contextPath}/product/productInfmation.do?pid=${tType.pid}"><img src="${tType.image}" /></a>
                        </div>
                        <div class="sy-tit1">
                        	<a href="${pageContext.request.contextPath}/product/productInfmation.do?pid=${tType.pid}">${tType.pname}</a>
                        </div>
                        <div class="sy-tit2">
                        	<p><a href="${pageContext.request.contextPath}/product/productInfmation.do?pid=${tType.pid}">售价：${tType.shopPrice}</a></p>
                            <p>市场价：${tType.marketPrice}</p>
                            <p>商品详情：${tType.pdesc}</p>
                        </div>
                    </li>
                    </c:forEach>
                    <div style="clear:both;"></div>
                </ul>
                 </c:forEach>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
</c:forEach>
    
    <!--底部一块-->
    <div class="footer-box">
    	<ul class="footer-info1 w1200">
        	<li>
            	<div class="ft-tu1">
                	<a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-86.gif" /></a>
                </div>
                <h3><a href="JavaScript:;">号码保障</a></h3>
                <P>所有会员，手机短信验证</P>
            </li>
        	<li>
            	<div class="ft-tu1">
                	<a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-87.gif" /></a>
                </div>
                <h3><a href="JavaScript:;">6*12小时客服</a></h3>
                <P>有任何问题随时免费资讯</P>
            </li>
        	<li>
            	<div class="ft-tu1">
                	<a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-88.gif" /></a>
                </div>
                <h3><a href="JavaScript:;">专业专攻</a></h3>
                <P>我们只专注于建筑行业的信息服务</P>
            </li>
        	<li>
            	<div class="ft-tu1">
                	<a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-89.gif" /></a>
                </div>
                <h3><a href="JavaScript:;">注册有礼</a></h3>
                <P>随时随地注册有大礼包</P>
            </li>
        	<li>
            	<div class="ft-tu1">
                	<a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-90.gif" /></a>
                </div>
                <h3><a href="JavaScript:;">值得信赖</a></h3>
                <P>专业的产品，专业的团队</P>
            </li>
            <div style="clear:both;"></div>
        </ul>
    	<div class="footer-info2 w1200">
        	<div class="ft-if2-left f-l">
            	<dl>
                	<dt><a href="6-1服务协议.html">新手上路</a></dt>
                    <dd>
                    	<a href="6-1服务协议.html">购物流程</a>
                    	<a href="6-1服务协议.html">在线支付</a>
                    	<a href="6-1服务协议.html">投诉与建议</a>
                    </dd>
                </dl>
            	<dl>
                	<dt><a href="6-1服务协议.html">配送方式</a></dt>
                    <dd>
                    	<a href="6-1服务协议.html">货到付款区域</a>
                    	<a href="6-1服务协议.html">配送费标准</a>
                    </dd>
                </dl>
            	<dl>
                	<dt><a href="6-1服务协议.html">购物指南</a></dt>
                    <dd>
                    	<a href="6-1服务协议.html">订购流程</a>
                    	<a href="6-1服务协议.html">购物常见问题</a>
                    </dd>
                </dl>
            	<dl>
                	<dt><a href="6-1服务协议.html">售后服务</a></dt>
                    <dd>
                    	<a href="6-1服务协议.html">售后服务保障</a>
                    	<a href="6-1服务协议.html">退换货政策总则</a>
                    	<a href="6-1服务协议.html">自营商品退换细则</a>
                    </dd>
                </dl>
                <div style="clear:both;"></div>
            </div>
        	<div class="ft-if2-right f-r">
            	<h3>400-2298-223</h3>
                <p>周一至周日  9:00-24:00</p>
                <p>（仅收市话费）</p>
            </div>
            <div style="clear:both;"></div>
        </div>
        <div class="footer-info3 w1200">
        	<p>
                <a href="#">免责条款</a><span>|</span>
                <a href="#">隐私保护</a><span>|</span>
                <a href="#">咨询热点</a><span>|</span>
                <a href="#">联系我们</a><span>|</span>
                <a href="#">公司简介</a>
            </p>
        	<p>
            	<a href="#">沪ICP备13044278号</a><span>|</span>
                <a href="#">合字B1.B2-20130004</a><span>|</span>
                <a href="#">营业执照</a><span>|</span>
                <a href="#">互联网药品信息服务资格证</a><span>|</span>
                <a href="#">互联网药品交易服务资格证</a>
            </p>
            <div class="ft-if3-tu1">
            	<a href="#"><img src="${pageContext.request.contextPath}/images/zl2-91.gif" /></a>
            	<a href="#"><img src="${pageContext.request.contextPath}/images/zl2-92.gif" /></a>
            	<a href="#"><img src="${pageContext.request.contextPath}/images/zl2-93.gif" /></a>
            </div>
        </div>
    </div>
    
    <!--固定右侧-->
    <ul class="youce">
    	<li class="li1">
        	<a href="index.html" class="li1-tu1"><img src="${pageContext.request.contextPath}/images/zl2-94.png" /></a>
            <a href="index.html" class="li1-zi1">返回首页</a>
        </li>
        <li class="li2">
        	<a href="Cart.jsp"><img src="${pageContext.request.contextPath}/images/zl2-95.png" />购</br>物</br>车</a>
        </li>
        <li class="li3">
        	<a href="#" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-96.png" /></a>
            <a href="#" class="li1-zi2">我关注的品牌</a>
        </li>
        <li class="li3">
        	<a href="浏览记录.html" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-97.png" /></a>
            <a href="浏览记录.html" class="li1-zi2">我看过的</a>
        </li>
        <li class="li4">
        	<a href="JavaScript:;" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-98.gif" /></a>
            <div class="li4-ewm">
            	<a href="JavaScript:;"><img src="${pageContext.request.contextPath}/images/zl2-101.gif" /></a>
                <p>扫一扫</p>
            </div>
        </li>
        <li class="li3 li5">
        	<a href="#top" class="li1-tu2"><img src="${pageContext.request.contextPath}/images/zl2-99.gif" /></a>
            <a href="#top" class="li1-zi2">返回顶部</a>
        </li>
    </ul>
    

</body>
</html>
