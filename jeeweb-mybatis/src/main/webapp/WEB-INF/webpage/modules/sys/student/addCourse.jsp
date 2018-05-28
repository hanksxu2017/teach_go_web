<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>课时增加</title>
	<meta name="decorator" content="form"/>

</head>

<body class="white-bg"  formid="studentAddCourseForm">
<form:form id="studentAddCourseForm" modelAttribute="data" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>

		<tr>
			<td  class="width-15 active text-right">
				<label>姓名:</label>
			</td>
			<td class="width-35" >
				<span>${data.realName}</span>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>总课时:</label>
			</td>
			<td class="width-35" >
				<span>${data.totalCourse}</span>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>剩余课时:</label>
			</td>
			<td class="width-35" >
				<span>${data.remainCourse}</span>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label>新增课时:</label>
			</td>
			<td class="width-35" >
				<form:input path="addCourse" class="form-control" datatype="n" nullmsg="请输入课时数量！" htmlEscape="false" />
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		</tbody>
	</table>
</form:form>

</body>
</html>