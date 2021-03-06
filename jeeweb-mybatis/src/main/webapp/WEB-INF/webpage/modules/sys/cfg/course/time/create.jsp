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

<body class="white-bg"  formid="cfgCourseTimeForm">
<form:form id="cfgCourseTimeForm" modelAttribute="data" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>
		<tr >
			<td  class="width-15 active text-right"><label><font color="red">*</font>星期:</label></td>
			<td  class="width-35">
				<form:select path="weekInfo"  dict="weekinfo" defaultValue="1" class="form-control" />
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>开始时间(例如: 18:30):</label>
			</td>
			<td  class="width-35" >
				<form:input path="startTime" class="form-control " datatype="*" nullmsg="请输入开始时间！" htmlEscape="false" />
				<label class="Validform_checktip"></label>
			</td>
		</tr>

        <tr>
            <td  class="width-15 active text-right">
                <label><font color="red">*</font>结束时间(例如: 20:00):</label>
            </td>
            <td  class="width-35" >
				<form:input path="endTime" class="form-control " datatype="*" nullmsg="请输入结束时间！" htmlEscape="false" />
                <label class="Validform_checktip"></label>
            </td>
        </tr>

		<tr>
			<td  class="width-15 active text-right">
				<label>序号:</label>
			</td>
			<td  class="width-35" >
				<select name="sort" class="form-control">
					<option value="1" selected>1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select>
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		</tbody>
	</table>
</form:form>

</body>
</html>