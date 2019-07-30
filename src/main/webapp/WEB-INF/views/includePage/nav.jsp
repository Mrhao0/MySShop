<%--
  Created by IntelliJ IDEA.
  User: zhenghao
  Date: 2019/7/5
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="nav-box">
    <div class="nav-kuai w1200">
        <div class="nav-kuaijie yjp-hover1 f-l">
            <a href="JavaScript:;" class="kj-tit1">商品分类快捷</a>
            <div class="kuaijie-box yjp-show1" style="display:none;">
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
            <%--<span><img src="${pageContext.request.contextPath}/images/zl2-05.gif" /></span>--%>
            <div style="clear:both;"></div>
        </ul>
        <div style="clear:both;"></div>
    </div>
</div>
