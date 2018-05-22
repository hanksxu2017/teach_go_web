<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title>班级信息|更新</title>
    <meta name="decorator" content="form"/>
    <html:component name="bootstrap-fileinput"/>
</head>
<body class="white-bg" formid="studyClassForm">
<form:form id="studyClassForm" modelAttribute="data" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>

        <tr>
            <td  class="width-15 active text-right">
                <label><font color="red">*</font>名称:</label>
            </td>
            <td class="width-35" >
                <form:input path="name" class="form-control " datatype="*" nullmsg="请输入名称！" validErrorMsg="用户名重复" htmlEscape="false" />
                <label class="Validform_checktip"></label>
            </td>
        </tr>
        <tr>
            <td  class="width-15 active text-right">
                <label>地址:</label>
            </td>
            <td  class="width-35" >
                <form:input path="address" class="form-control" htmlEscape="false"/>
            </td>
        </tr>

        </tbody>
    </table>
</form:form>
</body>
</html>