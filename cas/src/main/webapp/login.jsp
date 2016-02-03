<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <title>df锁定</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css"/>
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.easyui.js"></script>

</head>
<body style="padding:200px 200px 0px 500px">

<div id="p" class="easyui-panel" title="登陆" align="center"  style="width:500px;height:200px;padding:35px;background:#fafafa;" >
    <form id="login_form"  action="<%=path%>/user/user/login" method="post">
        <div>
            <label>用户名：</label>
            <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />
        </div>
        <br>
        <div>
            <label>密&nbsp;码：</label>
            <input class="easyui-validatebox" type="text" name="phone" data-options="validType:'password'" />
        </div>
        <br>
        <div align="right" style="padding-right: 100px;">
            <input type="submit" value="登陆"/>
        </div>
    </form>
</div>

</body>
</html>
<script>
    $(function () {
        if("<%=request.getParameter("message")%>" == "error"){
            alert("登陆失败！");
        }
    });

</script>