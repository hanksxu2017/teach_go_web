<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><spring:message code="sys.create" /></title>
	<meta name="decorator" content="form"/>
</head>

<body class="white-bg"  formid="courseForm">
<form:form id="courseForm" modelAttribute="data" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>
		<tr >
			<td  class="width-15 active text-right"><label><font color="red">*</font>星期:</label></td>
			<td  class="width-35" colspan="2">
				<form:select path="weekInfo"  dict="weekinfo" defaultValue="1" class="form-control"></form:select>
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>开始时间:</label>
			</td>
			<td  class="width-35" >
                <form:select path="startTimeHour"  dict="coursehour" defaultValue="8" class="form-control"></form:select>
				<label class="Validform_checktip"></label>
			</td>
            <td  class="width-35" >
                <form:select path="startTimeMinute"  dict="courseminute" defaultValue=":00" class="form-control"></form:select>
                <label class="Validform_checktip"></label>
            </td>
		</tr>

        <tr>
            <td  class="width-15 active text-right">
                <label><font color="red">*</font>结束时间:</label>
            </td>
            <td  class="width-35" >
                <form:select path="endTimeHour"  dict="coursehour" defaultValue="8" class="form-control"></form:select>
                <label class="Validform_checktip"></label>
            </td>
            <td  class="width-35" >
                <form:select path="endTimeMinute"  dict="courseminute" defaultValue=":00" class="form-control"></form:select>
                <label class="Validform_checktip"></label>
            </td>
        </tr>

		</tbody>
	</table>
</form:form>

</body>
</html>