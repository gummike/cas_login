<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<sf:form method="post" modelAttribute="ser">
name: <sf:input path="name"/> <sf:errors path="name" /><br/>
password: <sf:input path="phone"/> <sf:errors path="phone" /><br/>
groupId:  <select name="groupId">
    <c:forEach items="${groupList}" var="group">
        <option name="groupId" value ="${group.id}">${group.name}</option>
    </c:forEach>
</select>
    <br/>
sort: <sf:input path="sort"/> <sf:errors path="sort" /><br/>
state: <sf:input path="state"/> <sf:errors path="state" /><br/>
role:
    <select name="roleId">
        <c:forEach items="${roleList}" var="role">
            <option name="roleId" value ="${role.id}">${role.name}</option>
        </c:forEach>
    </select><br/>
<input type="submit" value="提 交" />
</sf:form>
</body>
</html>
