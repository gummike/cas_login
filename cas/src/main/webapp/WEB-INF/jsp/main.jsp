<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.hesc.event.util.EventStatus" %>
<%@ page import="com.hesc.activiti.util.TransConditionConstant" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
    <title>智慧城管</title>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="<%=path%>/css/icon.css"/>
    <script type="text/javascript" src="<%=path%>/js/jquery.js"></script>
    <script type="text/javascript" src="<%=path%>/js/jquery.easyui.js"></script>
    <style>
        body         { font-family: Tahoma; font-size: 8pt }
        .leftmenu {
            width:180px;
        }
        .leftmenu li {
            display: inline;
            white-space: nowrap;
            display: block;
            text-decoration: none;
            margin: 6px 10px 6px 0px;
            padding: 2px 6px 2px 55px;
            color: #00527f;
            background-color: #d9e8f3;
            border: 0px solid #004266;
            font-size: 14px;
        }



        .leftmenu a:hover {
            color: red;
            background-color: #8cbbda;
        }

        .leftmenu span {
            color: #a13100;
        }
    </style>
</head>
<body class="easyui-layout">
    <div data-options="region:'north',split:true" style="height:50px; padding-right: 50px;" align="right">
        <div style="float: right"><h5 style="width: 80px;">${user.name}</h5></div>
        <div style="padding-top: 15px;"><button name="登出" id="logoutBtn">登出</button></div>


    </div>
    <div data-options="region:'west',split:true" style="width:300px;">
        <div id="left_panel" class="easyui-accordion" style="width:293px;height:705px;">
            <div title="案卷处理" data-options="iconCls:'icon-reload',selected:true" style="padding:5px;">
                <ul class="leftmenu">
                    <li onclick="showList('<%=path%>/event/event/${user.roleId}/list','待办案卷栏')"> 待办案卷</li>
                    <li onclick="showList('<%=path%>/event/event/${user.id}/myTask','我的案卷栏')"> 我的案卷</li>
                    <br/>
                    <c:if test="${userRole == 'sly'}">
                        <li onclick="doEvent('<%=path%>/event/event/add')"> 案卷上报</li>
                        <li onclick="showList('<%=path%>/event/event/<%=EventStatus.YULIAN.getValue()%>/listByStatus','预立案栏')"> 预立案</li>
                        <li onclick="showList('<%=path%>/event/event/<%=EventStatus.FQ.getValue()%>/listByStatus','废弃栏')"> 已废弃</li>
                    </c:if>
                    <c:if test="${userRole == 'pqy'}">
                        <li onclick="showList('<%=path%>/event/event/<%=EventStatus.FQ.getValue()%>/listByStatus','废弃栏')"> 已废弃</li>
                    </c:if>
                </ul>
            </div>
            <div title="流程设计" data-options="iconCls:'icon-reload'" style="padding:5px;">
                <ul class="leftmenu">
                    <li><a href="#" name="eventBtn" id="processNew"> 流程新建</a>
                </ul>
            </div>
            <div title="流程管理" data-options="iconCls:'icon-reload'" style="padding:5px;">
                <ul class="leftmenu">
                    <li onclick="showProcessList('<%=path%>/event/event/listProcess','所有流程栏')"> 所有流程</li>
                </ul>
            </div>
        </div>
    </div>
    <div data-options="region:'center'" style="padding:5px;background:#eee;">
        <div id="btnToolBar" style="padding: 2px;">
            <%--受理员--%>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.YULIAN.getValue()%>" id="liAnBtn">立案</a>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.YULIAN.getValue()%>" id="buLiAnBtn">不立案</a>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.SLY.getValue()%>" id="faPqyBtn">发派遣员</a>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.SLY.getValue()%>" id="zjZbzBtn">转交值班长</a>
            <%--派遣员--%>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.PQY.getValue()%>" id="faZybmBtn">发专业部门</a>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.PQY.getValue()%>" id="htBtn">回退</a>
            <%--值班长--%>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.ZBZ.getValue()%>" id="zhzFaPqyBtn">发派遣员</a>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.ZBZ.getValue()%>" id="zhzFqBtn">废弃</a>
            <%--专业部门--%>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.ZYBM.getValue()%>" id="zybmFaZhzxBtn">发指挥中心</a>
            <%--指挥中心--%>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.ZHZX.getValue()%>" id="zhzxFaJdzxBtn">发监督中心</a>
            <%--监督中心--%>
            <a href="#" class="easyui-linkbutton" style="display: none;"  name="<%=EventStatus.JDZX.getValue()%>" id="jaBtn">结案</a>
        </div>

        <table id="listTable"></table>
    </div>
    <div id="eventAddDlg"></div>
    <div id="faZybmDlg"></div>
    <div id="showProcessDlg"></div>

</body>
</html>
<script>

    $(function () {

        //登出按钮绑定
        $("#logoutBtn").click(function(){
            $.get("<%=path%>/user/user/logout",function(data){
                if(data.success == "true"){
                    window.location = "<%=path%>"+data.result;
                }else{
                    alert("请求失败");
                }

            });
        });
        //事先展示预立案列表
        showList('<%=path%>/event/event/${user.id}/myTask','我的案卷栏');
        //按钮功能绑定

    });

    //预立案list
    function showList(url,title){
        $("#btnToolBar > a").hide();
        $('#listTable').datagrid({
            url:url,
            singleSelect:true,
            title:title,
            disabled:false,
            onSelect:function(rowIndex, rowData){
                $("#btnToolBar > a[name='"+rowData.state+"']").show();
                $("#btnToolBar > a").unbind("click");

                $("#liAnBtn").click(function() { liAn(rowData.id); });//立案
                $("#buLiAnBtn").click(function() { buLiAn(rowData.id); });//不立案
                $("#faPqyBtn").click(function() { commonDispatch(rowData.id,<%=TransConditionConstant.VAL_FPQY%>); });//发派遣员
                $("#zjZbzBtn").click(function() { commonDispatch(rowData.id,<%=TransConditionConstant.VAL_ZJZBZ%>); });//转交值班长
                $("#faZybmBtn").click(function() {faZybmDialog("<%=path%>/group/usergroup/beforeFaZybm?eventId="+rowData.id);});//发专业部门
                $("#htBtn").click(function() { commonDispatch(rowData.id,<%=TransConditionConstant.VAL_HT%>); });//回退
                $("#zhzFaPqyBtn").click(function() { commonDispatch(rowData.id,<%=TransConditionConstant.VAL_ZBZFPQY%>); });//值班长发派遣员
                $("#zhzFqBtn").click(function() { commonDispatch(rowData.id,<%=TransConditionConstant.VAL_ZBZFQ%>); });//值班长废弃
                $("#zybmFaZhzxBtn").click(function() { commonDispatch(rowData.id,<%=TransConditionConstant.VAL_FZHZX%>); });//专业部门发指挥中心
                $("#zhzxFaJdzxBtn").click(function() { commonDispatch(rowData.id,<%=TransConditionConstant.VAL_FJDZX%>); });//指挥中心发监督中心
                $("#jaBtn").click(function() { commonDispatch(rowData.id,<%=TransConditionConstant.VAL_JA%>); });//结案

            },
            columns:[[
                {field:'id',title:'id',width:300},
                {field:'name',title:'案卷名称',width:200},
                {field:'content',title:'内容',width:200},
                {field:'time',title:'创建时间',width:200},
                {field:'state',title:'状态',width:200,align:'right'}
            ]]
        });
    }

    //预立案list
    function showProcessList(url,title){
        $("#btnToolBar > a").hide();
        $('#listTable').datagrid({
            url:url,
            singleSelect:true,
            title:title,
            disabled:false,
            onDblClickRow:function(rowIndex, rowData){
                showProcessDialog("<%=path%>/event/event/eventState?processId="+rowData.id);
            },
            columns:[[
                {field:'id',title:'id',width:300},
                {field:'name',title:'流程名称',width:200},
                {field:'content',title:'流程定义',width:200},
                {field:'key',title:'案卷id',width:400,align:'right'}
            ]]
        });
    }



    /**
     * 立案
     **/
    function liAn(id){

        $.get(
            "<%=path%>/event/event/liAn",
            { eventId: id, userId: "${user.id}" },
            function(data){
                alert("立案成功");
                $('#listTable').datagrid("reload");
                $("#btnToolBar > a").hide();
            }
        );
    }

    /**
    * 不立案
    * @param id
     */
    function buLiAn(id){

        $.get(
                "<%=path%>/event/event/buLiAn",
                { eventId: id, userId: "${user.id}" },
                function(data){
                    if(data.success == "true"){
                        alert("操作成功");
                    }else{
                        alert("操作失败");
                    }
                    $('#listTable').datagrid("reload");
                    $("#btnToolBar > a").hide();
                }
        );
    }

    /**
    * 通用流程
    * @param eventId
     */
    function commonDispatch(eventId,to,roleArray){
        //alert(roleArray+"----");
        $.ajax({
            url:"<%=path%>/event/event/commonDispatch",
            traditional:true,
            type:"post",
            data: { eventId: eventId, userId: "${user.id}" ,to: to ,dispatchUserRoleId:roleArray},
            success:function(data){
                if(data.success == "true"){
                    alert("操作成功");
                }else{
                    alert("操作失败");
                }
                $('#listTable').datagrid("reload");
                $("#btnToolBar > a").hide();
            }
        });
    }



    function doEvent(url){
        $('#eventAddDlg').dialog({
            title: '案卷上报',
            width: 600,
            height: 300,
            closed: false,
            cache: false,
            href: url,
            modal: true
        });

    }


    function faZybmDialog(url){
        $('#faZybmDlg').dialog({
            title: '发专业部门',
            width: 300,
            height: 300,
            closed: false,
            cache: false,
            href: url,
            modal: true
        });

    }

    function showProcessDialog(url){
        $('#showProcessDlg').dialog({
            title: '流程状态图',
            width: 1200,
            height: 500,
            closed: false,
            cache: false,
            href: url,
            modal: true
        });

    }

    function formSubmit(formId,formDiv) {
        var $formDiv = $('#' + formDiv);
        $.messager.progress();
        var $form = $('#' + formId);
        var _url = $form.attr('action');
        $form.form('submit', {
            onSubmit : function() {
                var isValid = $form.form('validate');
                if (isValid) {
                    $.ajax({
                        url : _url,
                        data : $form.serialize(),
                        type : 'POST',
                        dataType : 'json',
                        success : function(data, textStatus, jqXHR) {
                            if (data.success) {
                                $.messager.progress('close');
                            }
                        },
                        error : function(jqXHR, textStatus, errorThrown) {
                            $.messager.alert('消息', '出错了，请检查！', 'error');
                            $.messager.progress('close');
                        }
                    });
                } else {
                    $.messager.progress('close');
                }
                $formDiv.window('close');
                return false;
            }
        });
    }
</script>