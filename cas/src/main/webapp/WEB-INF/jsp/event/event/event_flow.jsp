<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.hesc.event.util.EventStatus" %>
<%@ page import="com.hesc.activiti.util.TransConditionConstant" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath();%>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/icon.css"/>
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.easyui.js"></script>

</head>
<body>
<script type="text/javascript">

    $(function() {
        $.get( '<%=path%>/event/event/trace?pid=${processId}', function(infos) {
         $("#processView").css("left", infos.x-17);
         $("#processView").css("top", infos.y+28);
         $("#processView").css("width", infos.width-3);
         $("#processView").css("height", infos.height-2);
         });
    });
</script>
	<img alt="" src="<%=path%>/images/event.png">
<div id="processView" style="position:absolute;border:3px solid red; "></div>
</body>
</html>
