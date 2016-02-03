<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<sf:form method="post" modelAttribute="ser">
name: <sf:input path="name"/> <sf:errors path="name" /><br/>
phone: <sf:input path="phone"/> <sf:errors path="phone" /><br/>
groupId: <sf:input path="groupId"/> <sf:errors path="groupId" /><br/>
sort: <sf:input path="sort"/> <sf:errors path="sort" /><br/>
state: <sf:input path="state"/> <sf:errors path="state" /><br/>
roleId: <sf:input path="roleId"/> <sf:errors path="roleId" /><br/>
<input type="submit" value="提 交" />
</sf:form>
</body>
</html>
