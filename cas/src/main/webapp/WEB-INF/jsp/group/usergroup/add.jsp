<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<sf:form method="post" modelAttribute="sergroup">
name: <sf:input path="name"/> <sf:errors path="name" /><br/>
des: <sf:input path="des"/> <sf:errors path="des" /><br/>
sort: <sf:input path="sort"/> <sf:errors path="sort" /><br/>
state: <sf:input path="state"/> <sf:errors path="state" /><br/>
role:
    <select name="roleId">
        <c:forEach items="${roleList}" var="role">
            <option name="roleId" value ="${role.id}">${role.name}</option>
        </c:forEach>
    </select>
    <br/>
    prentGroup:
    <select name="parentGroup">
        <c:forEach items="${groupList}" var="group">
            <option name="parentGroup" value ="${group.id}">${group.name}</option>
        </c:forEach>
    </select>
    <br/>
<input type="submit" value="提 交" />
</sf:form>
</body>
</html>
