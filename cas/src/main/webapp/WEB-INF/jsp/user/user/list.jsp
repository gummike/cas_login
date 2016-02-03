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
<c:forEach items="${list }" var="ser">
${ser.id}----${ser.name}----${ser.phone}----${ser.groupId}----${ser.sort}----${ser.createTime}-=${ser.roleId}=---<a href="${ser.id}">查看</a>----<a href="${ser.id}/update">编辑</a>---<a href="${ser.id}/delete">删除</a><br/>
</c:forEach>
</body>
</html>
