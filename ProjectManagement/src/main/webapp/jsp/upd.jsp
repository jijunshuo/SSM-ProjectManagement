<%--
  Created by IntelliJ IDEA.
  User: 吉俊烁
  Date: 2020/10/4
  Time: 20:02
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
<form action="/upd" method="post">
    <table border="1px">
        <tr>
            <td colspan="2" align="center">项目申报信息</td>
        </tr>
        <tr>
            <td>项目编号</td>
            <td><input type="text" name="id" value="${projectinfo.id}" readonly/></td>
        </tr>
        <tr>
            <td>项目名称</td>
            <td><input type="text" name="projectname" value="${projectinfo.projectname}"/></td>
        </tr>
        <tr>
            <td>申报开始日期</td>
            <td><input type="text" name="startdate"
                       value="<fmt:formatDate value="${projectinfo.startdate}" pattern="yyyy-MM-dd" type="both"></fmt:formatDate>"/>
            </td>
        </tr>
        <tr>
            <td>申报结束日期</td>
            <td><input type="text" name="enddate"
                       value="<fmt:formatDate value="${projectinfo.enddate}" pattern="yyyy-MM-dd" type="both"></fmt:formatDate>"/>
            </td>
        </tr>
        <tr>
            <td>申报状态</td>
            <td>
                <select name="status">
                    <c:if test="${projectinfo.status==0}">
                        <option value="0">已申报</option>
                    </c:if>
                    <c:if test="${projectinfo.status==1}">
                        <option value="1">审核中</option>
                    </c:if>
                    <c:if test="${projectinfo.status==2}">
                        <option value="2">已审核</option>
                    </c:if>
                    <option value="0">已申报</option>
                    <option value="1">审核中</option>
                    <option value="2">已审核</option>
                </select>

            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <input type="submit" value="审核"/>
                <input type="reset" value="返回"/>
            </td>

        </tr>

    </table>


</form>
</body>
</html>
