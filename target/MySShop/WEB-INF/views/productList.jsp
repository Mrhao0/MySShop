<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>搜索列表页(有品牌)</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>
<style type="text/css">
    input[type=number] {
        -moz-appearance: textfield;
    }
    input[type=number]::-webkit-inner-spin-button,
    input[type=number]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
    }
</style>
    <script type="text/javascript">
        $(function(){
            var flage=0;
            $("#pageNowId").change(function(){
                console.log($("#pageNowId").val());
                if($("#pageNowId").val()<1){
                    $("#pageNowId").val(1);
                }
                if($("#pageNowId").val()>${searchProduct.pageCount}){
                    $("#pageNowId").val(${searchProduct.pageCount});
                }
            });

            $("[name='buy']").click(function(){
                flage=1;
                $(this).parent().next().click();

                var pid=$(this).parent().next().attr("id");
                window.location.href = "${pageContext.request.contextPath}/order/confirmAnOrder.do?pid1="+pid;
            });
        $("[name='injoinS']").click(function (){
            var pid=$(this).attr("id");
            var num= $(this).parent().prev().find("[name='hotPnum']").text();
            console.log(num);
            $.ajax({
                url:"${pageContext.request.contextPath}/product/cart1.do",
                data:{
                    pid:pid,
                    number:num
                },
                success:function(){
                    if(flage==0){
                        alert("添加成功");
                    }
                    flage=0;
                }
            })
        })
        })
    </script>
</head>

<body>

<!--header-->
<%@include file="includePage/header.jsp" %>
<!--logo search weweima-->
<%@ include file="includePage/search.jsp" %>
<!--nav-->
<%@ include file="includePage/nav.jsp" %>
    
    <!--内容开始-->
    	<!--筛选结果-->
    <%--<div class="screening-results w1200">
    	<p class="tiao">找到共${searchProduct.rowCount}条</p>
    	<div class="results">
        	<p class="re-p1 f-l">
            	全部结果：零食 > <span>品牌：三只松鼠　X　</span>　>
            </p>
            <div class="re-search f-l">
            	<input type="text" placeholder="三只松鼠" class="f-l" />
                <button></button>
                <div style="clear:both;"></div>
            </div>
            <p class="re-p2 f-r">
            	<a href="#">清空筛选条件</a>
            </p>
            <div style="clear:both;"></div>
        </div>
    </div>--%>
    	<!--品牌-->
    <%--<div class="hover-brand">
    	<p class="ho-pingpai f-l">品牌</p>
        <ul class="f-l">
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu1.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu2.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu3.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu4.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu5.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu6.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu7.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu8.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu9.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu10.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu11.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu12.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu13.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu14.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu15.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu16.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu17.gif" /></a></li>
        	<li><a href="#"><img src="${pageContext.request.contextPath}/images/hover-br-li-tu18.gif" /></a></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="duoxuan f-r">
        	<button ppgd="">多选</button>
            <a href="JavaScript:;" ppgd="">更多 ∨</a>
        </div>
        <div style="clear:both;"></div>
    </div>--%>
    
    	<!--品牌 更多-->
    <%--<div class="re-brand">
        	<div class="brand-top">
            	<div class="br-t">
                	<p class="pingpai f-l">品牌</p>
                    <div class="br-abc f-l">
                    	<p class="moren f-l">默认</p>
                        <ul class="f-l">
                        	<li><a href="#">A</a></li>
                        	<li><a href="#">B</a></li>
                        	<li><a href="#">C</a></li>
                        	<li><a href="#">D</a></li>
                        	<li><a href="#">E</a></li>
                        	<li><a href="#">F</a></li>
                        	<li><a href="#">G</a></li>
                        	<li><a href="#">H</a></li>
                        	<li><a href="#">I</a></li>
                        	<li><a href="#">J</a></li>
                        	<li><a href="#">K</a></li>
                        	<li><a href="#">L</a></li>
                        	<li><a href="#">M</a></li>
                        	<li><a href="#">N</a></li>
                        	<li><a href="#">O</a></li>
                        	<li><a href="#">P</a></li>
                        	<li><a href="#">Q</a></li>
                        	<li><a href="#">R</a></li>
                        	<li><a href="#">S</a></li>
                        	<li><a href="#">T</a></li>
                        	<li><a href="#">U</a></li>
                        	<li><a href="#">V</a></li>
                        	<li><a href="#">W</a></li>
                        	<li><a href="#">X</a></li>
                        	<li><a href="#">Y</a></li>
                        	<li><a href="#">Z</a></li>
                            <div style="clear:both;"></div>
                        </ul>
                        <a href="#" class="qita f-l">其他</a>
                        <div style="clear:both;"></div>
                    </div>
                    <div style="clear:both;"></div>
                </div>
                <div class="br-b">
                	<ul>
                    	<li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>小老板</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>乐事/Lay's </span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>周黑鸭/ZHOU...</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>喜之郎/STRONG</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>费列罗/FERRERO</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>好丽友/orion</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>莱家/Loacker </span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>稻香村/dao...</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>友臣/YOUCHEN</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>好想你</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>黄飞红/HUANG...</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>可康/COCON</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>张君雅</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>德芙/Dove</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>利奥/Oreo</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>士力架/SNICKERS</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>汉斯/Hunt's</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>多力多滋</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百草味/Be ...</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>丽芝士/Richeese</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百吉福/MILKANA</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>利葡/LiPO</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>友谊牌/Tipo</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百草味/Be ...</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>丽芝士/Richeese</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百吉福/MILKANA</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>利葡/LiPO</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>友谊牌/Tipo</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百草味/Be ...</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>丽芝士/Richeese</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百吉福/MILKANA</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>利葡/LiPO</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>友谊牌/Tipo</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百草味/Be ...</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>丽芝士/Richeese</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百吉福/MILKANA</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>利葡/LiPO</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>友谊牌/Tipo</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百草味/Be ...</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>丽芝士/Richeese</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百吉福/MILKANA</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>利葡/LiPO</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>友谊牌/Tipo</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百草味/Be ...</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>丽芝士/Richeese</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>百吉福/MILKANA</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>利葡/LiPO</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" ></input>
                            <span>友谊牌/Tipo</span>
                        </li>
                        <div style="clear:both;"></div>
                    </ul>
                </div>
            </div>
        	<div class="brand-bt">
            	<button>确定</button>
            	<button class="quxiao" quxiao1="">取消</button>
            </div>
        </div>--%>
        
        <!--品牌热销-->
    <div class="brand-sales">

        <dl style="border-bottom:none;">
            <c:forEach items="${requestScope.productType}" var="prot">
                <c:if test="${prot.cid==param.cid}">
                     <dt>${prot.cname}</dt>
                </c:if>
            </c:forEach>
            <dd>
                <c:forEach items="${requestScope.productType}" var="prot">
                    <c:forEach items="${prot.productSuperList}" var="pros">
                        <c:if test="${pros.cid==param.cid}">
                                <a style="${pros.csid==param.csid?"color:green":""}" href="${pageContext.request.contextPath}/product/productlist.do?cid=${pros.cid}&csid=${pros.csid}">${pros.csname}</a>
                        </c:if>
                    </c:forEach>
                </c:forEach>
            </dd>
            <div style="clear:both;"></div>
        </dl>

    </div>
    
    <!--内容↓↑-->
    <div class="shop-page-con w1200">
    	<div class="shop-pg-left f-l" style="width:215px">
            <div class="shop-left-buttom" style="margin-top:0;">
            	<div class="sp-tit1">
                    <h3>商品推荐</h3>
                </div>
                <ul class="shop-left-ul">
                    <c:set var="d" value="1"></c:set>
                    <c:forEach items="${requestScope.productType}" var="prot">
                        <c:if test="${prot.cid==param.cid || empty param.cid}">
                            <c:forEach items="${prot.productSuperList}" var="pros">
                                <c:if test="${pros.csid==param.csid || empty param.csid}">
                                    <c:forEach items="${pros.superSentedList}" var="tpro" varStatus="vs">
                                        <c:if test="${tpro.isHot==1}" >
                                            <c:set var="d" value="${d+1}"></c:set>
                                                <c:if test="${d<5}">
                                                    <li>
                                                    <div class="li-top">
                                                        <a href="${pageContext.request.contextPath}/product/productInfmation.do?pid=${tpro.pid}" class="li-top-tu"><img style="height: 100px;width: 200px" src="${tpro.image}" /></a>
                                                        <p class="jiage"><span class="sp1">${tpro.shopPrice}</span><span class="sp2">${tpro.marketPrice}</span></p>
                                                    </div>
                                                        <p class="miaoshu">${tpro.pname}</p>
                                                    <p class="miaoshu">${tpro.pDesced}</p>
                                                    <div class="li-md">
                                                        <div class="md-l f-l">
                                                            <p class="md-l-l f-l" ap="" name="hotPnum">1</p>
                                                            <div class="md-l-r f-l">
                                                                <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                                                <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                                            </div>
                                                            <div style="clear:both;"></div>
                                                        </div>
                                                        <div class="md-r f-l">
                                                            <button class="md-l-btn1"><a name="buy"  href="#">立即购买</a></button>
                                                            <button class="md-l-btn2" name="injoinS" id="${tpro.pid}">加入购物车</button>
                                                        </div>
                                                        <div style="clear:both;"></div>
                                                    </div>
                                                    <p class="pingjia">88888评价</p>
                                                    <p class="weike">微克宅购自营</p>
                                                </li>
                                                </c:if>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </c:forEach>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </div>
    	<div class="shop-pg-right f-r">
        	<div class="shop-right-cmp" style="margin-top:0;">
            	<ul class="shop-cmp-l f-l">
                	<li class="current"><a href="#">综合 ↓</a></li>
                	<li><a href="#">销量 ↓</a></li>
                	<li><a href="#">新品 ↓</a></li>
                	<li><a href="#">评价 ↓</a></li>
                    <div style="clear:both;"></div>
                </ul>
                <div class="shop-cmp-m f-l">
                	<span>价格</span><input type="text" /><span>-</span><input type="text" />
                </div>
                <div class="shop-cmp-r f-l">
                	<ul class="f-l">
                    	<li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>包邮</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>进口</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>仅显示有货</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>满赠</span>
                        </li>
                        <li>
                        	<input type="checkbox" name="hobby" value=""></input>
                            <span>满减</span>
                        </li>
                        <div style="clear:both;"></div>
                    </ul>
                    <button>确定</button>
                </div>
                <div style="clear:both;"></div>
            </div>
            <div class="shop-right-con">
            	<ul class="shop-ul-tu shop-ul-tu1">
                    <c:forEach items="${searchProduct.list}" var="searchProduct" varStatus="vs">
                    <li style="${vs.count%4==0?"margin-right:0;":""}">
                        <div class="li-top">
                            <a href="${pageContext.request.contextPath}/product/productInfmation.do?pid=${searchProduct.pid}" class="li-top-tu"><img style="height: 100px;width: 200px" src="${searchProduct.image}" /></a>
                            <p class="jiage"><span class="sp1">${searchProduct.shopPrice}</span><span class="sp2">${searchProduct.marketPrice}</span></p>
                        </div>
                        <p class="miaoshu">${searchProduct.pname}</p>
                        <p class="miaoshu">${searchProduct.pDesced}</p>
                        <div class="li-md">
                            <div class="md-l f-l">
                                <p class="md-l-l f-l" ap="" name="hotPnum">1</p>
                                <div class="md-l-r f-l">
                                    <a href="JavaScript:;" class="md-xs" at="">∧</a>
                                    <a href="JavaScript:;" class="md-xx" ab="">∨</a>
                                </div>
                                <div style="clear:both;"></div>
                            </div>
                            <div class="md-r f-l">
                                <button class="md-l-btn1"><a name="buy" href="#">立即购买</a></button>
                                <button name="injoinS" id="${searchProduct.pid}" class="md-l-btn2">加入购物车</button>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                        <p class="pingjia">88888评价</p>
                        <p class="weike">微克宅购自营</p>
                    </li>
                    </c:forEach>
                    <div style="clear:both;"></div>
                </ul>
                
                <!--分页-->
                <c:if test="${empty param.pageNow || param.pageNow<1}">
                    <c:set var="pageN" value="1"></c:set>
                </c:if>
                <c:if test="${!empty param.pageNow}">
                    <c:set var="pageN" value="${param.pageNow}"></c:set>
                </c:if>
                <c:if test="${pageN>searchProduct.pageCount}">
                    <c:set var="pageN" value="${searchProduct.pageCount}"></c:set>
                </c:if>
                <c:if test="${pageN<3}">
                    <c:set var="star" value="1"></c:set>
                    <c:set var="end" value="5"></c:set>
                </c:if>
                <c:if test="${pageN>searchProduct.pageCount-2}">
                    <c:set var="star" value="${searchProduct.pageCount-4}"></c:set>
                    <c:set var="end" value="${searchProduct.pageCount}"></c:set>
                </c:if>
                <c:if test="${pageN>=3 && pageN<=searchProduct.pageCount-2}">
                    <c:set var="star" value="${pageN-2}"></c:set>
                    <c:set var="end" value="${pageN+2}"></c:set>
                </c:if>

                <div class="paging">
            	<div class="pag-left f-l">
                    <c:if test="${pageN!=1}">
                        <a href="${pageContext.request.contextPath}/product/productlist.do?pageNow=1&cid=${param.cid}&csid=${param.csid}&pname=${searchProduct.pname}" class="about left-r f-l"><<</a>
                	<a href="${pageContext.request.contextPath}/product/productlist.do?pageNow=${pageN-1}&cid=${param.cid}&csid=${param.csid}&pname=${searchProduct.pname}" class="about left-r f-l"><</a>
                    </c:if>
                    <ul class="left-m f-l">
                        <c:forEach begin="${star<0?1:star}" end="${end}" var="i">
                    	        <li class="${i==pageN?"current":""}"><a href="${pageContext.request.contextPath}/product/productlist.do?pageNow=${i}&cid=${param.cid}&csid=${param.csid}&pname=${searchProduct.pname}">${i}</a></li>
                        </c:forEach>
                        <div style="clear:both;"></div>
                    </ul>
                    <c:if test="${pageN!=searchProduct.pageCount}">
                	<a href="${pageContext.request.contextPath}/product/productlist.do?pageNow=${pageN+1}&cid=${param.cid}&csid=${param.csid}&pname=${searchProduct.pname}" class="about left-l f-l">></a>
                        <a href="${pageContext.request.contextPath}/product/productlist.do?pageNow=${searchProduct.pageCount}&cid=${param.cid}&csid=${param.csid}&pname=${searchProduct.pname}" class="about left-l f-l">>></a>
                    </c:if>
                    <div style="clear:both;"></div>
                </div>
            	<div class="pag-right f-l">
                    <form action="${pageContext.request.contextPath}/product/productlist.do?cid=${param.cid}&csid=${param.csid}&pname=${searchProduct.pname}" method="post">
                	<div class="jump-page f-l">
                        到第<input id="pageNowId" name="pageNow" type="number" />页
                    </div>
                    <button type="submit" class="f-l">确定</button>
                    <div style="clear:both;"></div>
                    </form>
                </div>
                <div style="clear:both;"></div>
            </div>
            </div>
        </div>
        <div style="clear:both;"></div>
    </div>
    
    <!--底部一块-->
    <%@include file="includePage/foot.jsp" %>
</body>
</html>
