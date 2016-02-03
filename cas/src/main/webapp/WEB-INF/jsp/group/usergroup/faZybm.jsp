<%@ page import="com.hesc.activiti.util.TransConditionConstant" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath();%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/icon.css"/>
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.easyui.js"></script>
</head>
<body>
<ul id="bmeeTree"></ul>
<div style="margin-left: 100px;  padding-top: 50px;" >

<button onclick="faZybmAjax()">发专业部门</button>
</div>

<script>
    var bmArray = new Array();
    $(function(){
        $('#bmeeTree').tree({
            url:'<%=path%>/group/usergroup/zybmTree',
            method:"get",
            checkbox:true,
            cascadeCheck:false,
            onCheck:function(node, checked){
                bmArray.push(node.id);
            }
        });

    });

    function faZybmAjax(){
        commonDispatch("${eventId}",<%=TransConditionConstant.VAL_FZYBM%>,bmArray)
        $('#faZybmDlg').dialog("close");
    }
</script>

</body>
</html>

