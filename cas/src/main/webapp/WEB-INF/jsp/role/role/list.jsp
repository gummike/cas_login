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
<c:forEach items="${list }" var="ole">
${ole.id}----${ole.name}----${ole.des}----${ole.sort}----${ole.state}----${ole.createTime}----<a href="${ole.id}">查看</a>----<a href="${ole.id}/update">编辑</a>---<a href="${ole.id}/delete">删除</a><br/>
</c:forEach>
</body>
</html>
