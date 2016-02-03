<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="add">新增</a><br/>
<c:forEach items="${list }" var="sergroup">
${sergroup.id}----${sergroup.name}----${sergroup.des}----${sergroup.sort}----${sergroup.state}----${sergroup.createTime}----
    <a href="${sergroup.id}">查看</a>----
    <a href="${sergroup.id}/update">编辑</a>---
    <a href="${sergroup.id}/delete">删除</a>---
    <a href="${sergroup.id}/record">立案</a>
    <br/>
</c:forEach>
</body>
</html>
