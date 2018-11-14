<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="decorator" content="form"/>
</head>
<body class="white-bg"  formid="studentChooseClassForm">
<form:form id="studentChooseClassForm" modelAttribute="data" method="post" class="form-horizontal">
    <form:hidden path="id"/>
    <table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>

        <tr>
            <td  class="width-15 active text-right">
                <label>学生姓名:</label>
            </td>
            <td class="width-35" >
                <span>${data.realName}</span>
            </td>
        </tr>

        <tr>
            <td  class="width-15 active text-right">
                <label>班级:</label>
            </td>
            <td class="width-35" >
                <select name="studyClassId" class="form-control">
                    <c:forEach items="${studyClassList}" var="studyClass">
                        <option value="${studyClass.id}">${studyClass.name}</option>
                    </c:forEach>
                </select>
                <label class="Validform_checktip"></label>
            </td>
        </tr>
        </tbody>
    </table>
</form:form>

</body>
</html>