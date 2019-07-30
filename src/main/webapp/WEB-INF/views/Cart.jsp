<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>购物车</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shopping-mall-index.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhonglin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/zhongling2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/myjs.js"></script>
    <script type="text/javascript">
        $(function(){
            $("[name='punit']").bind('click',function(){
                if($(this).prop('checked')){
                    $(this).next().attr("name","pid")
                    var subtotal=Number($(this).parent().find("[name='subtotal']").text());
                    $("#count").text(Number($("#count").text())+subtotal);

                }else{
                    $("[name='allunit']").attr("checked",false)
                    $(this).next().attr("name","")
                    var subtotal=Number($(this).parent().find("[name='subtotal']").text());
                    $("#count").text(Number($("#count").text())-subtotal);
                }
            });
            $("[name='allunit']").bind('click',function(){
                if($(this).prop('checked')){
                    $("[name='punit']").attr("checked",true)
                    $("[name='punit']").next().attr("name","pid")
                    var count=0.0;
                    $("[name='subtotal']").each(function () {
                        count=count+Number($(this).text());
                    });
                    $("#count").text(count);
                }else{

                }
            });
            $("[name='remove']").click(function(){
                var pid=$(this).attr("id");
                $.ajax({
                    url:"${pageContext.request.contextPath}/product/remove.do",
                    data:{
                        pid:pid,
                    },
                    success:function(data){
                        $("#pdiv"+pid).remove();
                            if($(this).parent().parent().find("[name='punit']").prop('checked')){

                                $("#count").text(data);
                            }else{

                            }
                    }
                })
            });
            //style="display: none"   隐藏标签无空白  style.visibility="visible"; 有空白
            $("[name=changeNumU]").click(function(){
                var Unum=$(this).prev().val();
                var pnumber=1;
                var pid=$(this).parent().find("[name='pnumber']").attr("id")
                    if($(this).parent().parent().find("[name='punit']").prop('checked')){
                        var unitprice=Number($(this).parent().parent().find("[name='unitprice']").text());
                        $.ajax({
                            url:"${pageContext.request.contextPath}/product/cart1.do",
                            data:{
                                number:pnumber,
                                pid:pid,
                            },
                            success:function(data){
                                console.log(data);
                                $("#count").text(Number($("#count").text())+unitprice);
                            }
                        })
                    }else{
                    }
            })
            $("[name=changeNumD]").click(function(){
                var Dnum=$(this).next().val();
                var pnumber=-1;
                var pid=$(this).parent().find("[name='pnumber']").attr("id")
                    if($(this).parent().parent().find("[name='punit']").prop('checked')){
                        var unitprice=Number($(this).parent().parent().find("[name='unitprice']").text());
                        $.ajax({
                            url:"${pageContext.request.contextPath}/product/cart1.do",
                            data:{
                                number:pnumber,
                                pid:pid,
                            },
                            success:function(data){
                                console.log(data);
                                $("#count").text(Number($("#count").text())-unitprice);
                            }
                        })
                    }else{

                    }
            })
        });
        function conf(){
            var YorN=0;
            $("[name='punit']").each(function(){
                if($(this).prop("checked")){
                    YorN=1;
                }
            });
            console.log(YorN);
        /*|| Number($("count").text())==0*/
            if(YorN==0){
                alert("请选择要结算的商品，谢谢");
                window.location.reload();
                return false;
            }else{
                return true;
            }
        }
    </script>
</head>

<body style="position:relative;">

<!--header-->
<%@include file="includePage/header.jsp" %>
<!--logo search weweima-->
<%@ include file="includePage/search.jsp" %>

    
    <!--内容开始-->
<form onsubmit="return conf()" action="${pageContext.request.contextPath}/order/confirmAnOrder.do" >
    <div class="cart-content w1200">
    	<ul class="cart-tit-nav">
        	<li class="current"><a href="#">全部商品   ${fn:length(sessionScope.Cart.cartMap)}</a></li>
        	<li><a href="#">降价商品   1</a></li>
        	<li><a href="#">进口商品   1</a></li>
            <div style="clear:both;"></div>
        </ul>
        <div class="cart-con-tit">
        	<p class="p1">

            </p>
            <p class="p2">商品信息</p>
            <%--<p class="p3">规格</p>--%>
            <p class="p4">数量</p>
            <p class="p5">单价（元）</p>
            <p class="p6">金额（元）</p>
            <p class="p7">操作</p>
        </div>

        <c:forEach items="${sessionScope.Cart.cartMap}" var="pItem">
            <div class="cart-con-info" id="pdiv${pItem.value.productInfmation.pid}">
                <div class="info-top">
                    <span>商家：向东服饰专卖店</span>
                </div>
                <div class="info-mid">
                    <input type="checkbox" value="" name="punit" class="mid-ipt f-l"></input>
                    <input type="hidden" name="" value="${pItem.value.productInfmation.pid}">
                    <div class="mid-tu f-l">
                        <a href="#"><img style="width: 150px;height: 100px" src="${pItem.value.productInfmation.image}" /></a>
                    </div>
                    <div class="mid-font f-l" style="width: 220px">
                        <a href="#">${pItem.value.productInfmation.pname}<br />${fn:substring(pItem.value.productInfmation.pdesc,0,14)}...</a>
                        <span>满赠</span>
                    </div>
                   <%-- <div class="mid-guige f-l">
                        <p>颜色：蓝色</p>
                        <p>尺码：XL</p>
                        <a href="JavaScript:;" class="xg" xg="xg1">修改</a>
                        <div class="guige-xiugai" xg-g="xg1">
                            <div class="xg-left f-l">
                                <dl>
                                    <dt>颜  色</dt>
                                    <dd>
                                        <a href="JavaScript:;" class="current">黑色</a>
                                        <a href="JavaScript:;">白色</a>
                                    </dd>
                                    <div style="clear:both;"></div>
                                </dl>
                                <dl>
                                    <dt>尺  码</dt>
                                    <dd>
                                        <a href="JavaScript:;" class="current">M</a>
                                        <a href="JavaScript:;">L</a>
                                        <a href="JavaScript:;">XL</a>
                                    </dd>
                                    <div style="clear:both;"></div>
                                </dl>
                                <a href="JavaScript:;" class="qd">确定</a>
                                <a href="JavaScript:;" class="qx" qx="xg1">取消</a>
                            </div>
                            <div class="xg-right f-l">
                                <a href="#"><img src="${pageContext.request.contextPath}/images/dai2.gif" /></a>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                    </div>--%>
                    <div class="mid-sl f-l"  style="width: 130px">
                        <a href="JavaScript:;" class="sl-left" name="changeNumD">-</a>
                        <input type="number" id='${pItem.value.productInfmation.pid}' name="pnumber" value="${pItem.value.number}" />
                        <a href="JavaScript:;" class="sl-right" name="changeNumU">+</a>
                    </div>
                    <p class="mid-dj f-l"  style="width: 135px">¥ <span name="unitprice">${pItem.value.productInfmation.shopPrice}</span></p>
                    <p class="mid-je f-l" style="width: 135px">¥ <span name="subtotal">${pItem.value.subtotal}</span></p>
                    <div class="mid-chaozuo f-l">
                       <%-- <a href="#">移入收藏夹</a>--%>
                        <a href="#" name="remove" id="${pItem.value.productInfmation.pid}">删除</a>
                    </div>
                    <div style="clear:both;"></div>
                </div>
            </div>
        </c:forEach>
        
        <!--分页-->
        <%--<div class="paging">
            	<div class="pag-left f-l">
                	<a href="#" class="about left-r f-l"><</a>
                    <ul class="left-m f-l">
                    	<li><a href="#">1</a></li>
                        <li class="current"><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                        <li><a href="#">5</a></li>
                        <li><a href="#">6</a></li>
                        <li><a href="#">...</a></li>
                        <li><a href="#">100</a></li>
                        <div style="clear:both;"></div>
                    </ul>
                	<a href="#" class="about left-l f-l">></a>
                    <div style="clear:both;"></div>
                </div>
            	<div class="pag-right f-l">
                	<div class="jump-page f-l">
                        到第<input type="text" />页
                    </div>
                    <button class="f-l">确定</button>
                    <div style="clear:both;"></div>
                </div>
                <div style="clear:both;"></div>
            </div>--%>
       	<div class="cart-con-footer">
        	<div class="quanxuan f-l">
            	<input type="checkbox" value="" name="allunit"></input>
                <span>全选</span>
                <a href="JavaScript:;">删除</a>
                <a href="#">加入收藏夹</a>
                <p>（此处始终在屏幕下方）</p>
            </div>
            <div class="jiesuan f-r">
            	<div class="jshj f-l">
                	<p>合计（不含运费）</p>
                	<p class="jshj-p2">
                    	￥：<span id="count">0</span>
                    </p>
                </div>
                    <button type="submit" class="btn">结算</button>
                <div style="clear:both;"></div>
            </div>
            <div style="clear:both;"></div>
        </div>
    </div>
</form>
<!--底部一块-->
<%@include file="includePage/foot.jsp" %>
</body>
</html>
