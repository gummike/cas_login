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
<c:forEach items="${list }" var="vent">
${vent.id}----${vent.name}----${vent.content}----${vent.sort}----${vent.state}----${vent.createTime}----<a href="${vent.id}">查看</a>----<a href="${vent.id}/update">编辑</a>---<a href="${vent.id}/delete">删除</a><br/>
</c:forEach>
</body>
</html>
