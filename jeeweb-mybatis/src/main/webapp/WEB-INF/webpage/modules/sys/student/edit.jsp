<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生信息修改</title>
    <meta name="decorator" content="form"/>

</head>

<body class="white-bg"  formid="studentForm">
<form:form id="studentForm" modelAttribute="data" method="post" class="form-horizontal">
  <form:hidden path="id" />
  <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
    <tbody>

      <tr>

        <td class="width-15 active text-right">
          <label>姓名:</label></td>
        <td class="width-35">${data.realName}</td>

        <td class="width-15 active text-right">
          <label>年龄:</label>
        </td>
        <td class="width-35">
          <form:input path="age" class="form-control " datatype="*" nullmsg="请输入年龄！" htmlEscape="false" />
        </td>

      </tr>

      <tr>
        <td class="width-15 active text-right">
          <label>校内等级:</label>
        </td>
        <td class="width-35">
          <form:input path="level" class="form-control" datatype="*" nullmsg="请输入校内等级！" htmlEscape="false" />
        </td>
      </tr>

      <tr>
        <td class="width-15 active text-right">
          <label>总课时:</label></td>
        <td class="width-35">${data.totalCourse}</td>

        <td class="width-15 active text-right">
          <label>新增课时:</label>
        </td>
        <td class="width-35">
          <form:input path="addCourse" class="form-control " datatype="*" nullmsg="请输入新增课时！" htmlEscape="false"/>
        </td>
      </tr>

      <tr>
        <td class="width-15 active text-right">
          <label class="pull-right">状态:</label>
        </td>
        <td class="width-35">
          <form:select path="status"  dict="studentStatusType" defaultValue="${data.status}" class="form-control"></form:select>
        </td>
      </tr>

      <tr>
        <td class="width-15 active">
          <label class="pull-right">家长姓名:</label>
        </td>
        <td class="width-35">
          <form:input path="parentName" class="form-control " datatype="*" nullmsg="请输入学生家长！" htmlEscape="false" />
        </td>

        <td class="width-15 active">
          <label class="pull-right">联系方式:</label>
        </td>
        <td class="width-35">
          <form:input path="parentPhone" class="form-control " datatype="*" nullmsg="请输入联系方式！" htmlEscape="false" />
        </td>

      </tr>
    </tbody>
  </table>
</form:form>
</body>
</html>