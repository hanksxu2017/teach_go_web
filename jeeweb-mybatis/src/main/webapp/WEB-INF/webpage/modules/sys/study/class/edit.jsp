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
            <td class="width-15 active text-right">
                <label><font color="red">*</font>校区:</label>
            </td>
            <td class="width-35">
                <form:select path="studyPlace" dict="studyplace" class="form-control"
                             id="studyPlaceSelect" defaultValue="${data.studyPlace}"></form:select>
            </td>
        </tr>

        <tr>
            <td class="width-15 active text-right">
                <label><font color="red">*</font>科目:</label>
            </td>
            <td class="width-35">
                <form:select path="subject" dict="subject" class="form-control"
                             defaultValue="${data.subject}"></form:select>
            </td>
        </tr>

        <tr>
            <td class="width-15 active text-right">
                <label><font color="red">*</font>名称:</label>
            </td>
            <td class="width-35">
                <form:input path="name" class="form-control" datatype="*" nullmsg="请输入班级名称！" htmlEscape="false"/>
                <label class="Validform_checktip"></label>
            </td>
        </tr>

        <tr>
            <td class="width-15 active text-right">
                <label><font color="red">*</font>授课老师:</label>
            </td>
            <td class="width-35">
                <select name="teacherId" class="form-control">
                    <c:forEach items="${teachers}" var="teacher">
                        <c:choose>
                            <c:when test="${techar.id == data.teacherId}">
                                <option value="${teacher.id}" selected>${teacher.realName}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${teacher.id}">${teacher.realName}</option>
                            </c:otherwise>
                        </c:choose>

                    </c:forEach>
                </select>
                <label class="Validform_checktip"></label>
            </td>
        </tr>

        <tr>
            <td class="width-15 active text-right">
                <label>备注:</label>
            </td>
            <td class="width-35">
                <form:textarea path="remarks" rows="4" htmlEscape="false" class="form-control"/>
            </td>
        </tr>

        </tbody>
    </table>
</form:form>
</body>
</html>