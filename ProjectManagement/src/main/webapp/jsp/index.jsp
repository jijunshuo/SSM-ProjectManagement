<%--
  Created by IntelliJ IDEA.
  User: 吉俊烁
  Date: 2020/10/4
  Time: 19:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/" method="post">
    <p>申报状态:<select name="status">
        <option value="3">全部</option>
        <option value="0">已申报</option>
        <option value="1">审核中</option>
        <option value="2">已审核</option>
    </select>
        <input type="submit" value="查询"/>
    </p>
</form>
<table border="1px">
    <tr>
        <td colspan="6" align="center" style="font-size: 40px">申报项目列表</td>
    </tr>
    <tr>
        <td>项目编号</td>
        <td>项目名称</td>
        <td>申报开始日期</td>
        <td>申报结束日期</td>
        <td>申报状态</td>
        <td>操作</td>
    </tr>
    <c:forEach var="p" items="${projectinfoPageInfo.list}">
        <tr>
            <td>${p.id}</td>
            <td>${p.projectname}</td>
            <td><fmt:formatDate value="${p.startdate}" pattern="yyyy-MM-dd" type="both"></fmt:formatDate></td>
            <td><fmt:formatDate value="${p.enddate}" pattern="yyyy-MM-dd" type="both"></fmt:formatDate></td>
            <td>
                <c:if test="${p.status==0}">已申报</c:if>
                <c:if test="${p.status==1}">审核中</c:if>
                <c:if test="${p.status==2}">已审核</c:if>
            </td>
            <td>
                <c:if test="${p.status!=2}">
                    <a href="/selectByid?id=${p.id}">审核</a>
                </c:if>
            </td>
        </tr>
    </c:forEach>


</table>
<div>
    <c:if test="${projectinfoPageInfo.isFirstPage==false}">
        <a href="/?pageNum=${projectinfoPageInfo.firstPage}&status=${status}">首页</a>
        <a href="/?pageNum=${projectinfoPageInfo.prePage}&status=${status}">上一页</a>
    </c:if>
    <c:if test="${projectinfoPageInfo.isLastPage==false}">
        <a href="/?pageNum=${projectinfoPageInfo.nextPage}&status=${status}">下一页</a>
        <a href="/?pageNum=${projectinfoPageInfo.lastPage}&status=${status}">尾页</a>
    </c:if>
    <span>第${projectinfoPageInfo.pageNum}页/共${projectinfoPageInfo.pages}页</span>
</div>
<p style="color:red;">${success}</p>
</body>
</html>
