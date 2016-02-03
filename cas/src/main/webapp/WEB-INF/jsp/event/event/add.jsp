<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String path = request.getContextPath();%>
<%@ page import="com.hesc.event.util.EventStatus" %>
<!DOCTYPE>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<div align="center" style="margin-top: 100px;">
    <style>
        .form_label{
            width: 100px;
            margin: 20px;
            text-align: left;
        }
    </style>
    <form id="eventAddFrom" method="post" action="<%=path%>/event/event/add">
        <table style="margin-top: 80px;">
            <tr>
                <td>name:</td>
                <td><input type="text" name="name"/></td>
            </tr>
            <tr>
                <td>content:</td>
                <td><input type="text"  name="content"/></td>
            </tr>
            <tr>
                <td>sort:</td>
                <td><input type="text"  name="sort"/></td>
            </tr>
            <tr>
                <td>state:</td>
                <td><input type="text" disabled="disabled" name="state" value="<%=EventStatus.YULIAN.getValue()%>"/></td>
            </tr>
            <tr align="right">
                <td colspan="2">
                    <input type="button" onclick="formSubmit('eventAddFrom','eventAddDlg')" value="ss"/>
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>

