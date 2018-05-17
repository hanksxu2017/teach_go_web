<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><spring:message code="sys.student.createStudent" /></title>
	<meta name="decorator" content="form"/>

</head>

<body class="white-bg"  formid="studentForm">
<form:form id="studentForm" modelAttribute="data" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>姓名:</label>
			</td>
			<td class="width-35" >
				<form:input path="realName" class="form-control " datatype="*" nullmsg="请输入姓名！" htmlEscape="false" />
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>校内等级:</label>
			</td>
			<td class="width-35" >
				<form:input path="level" class="form-control" datatype="*" nullmsg="请输入等级！"  htmlEscape="false" defaultValue="0"/>
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>剩余课程:</label>
			</td>
			<td class="width-35" >
				<form:input path="remainCourse" class="form-control" datatype="*" nullmsg="请输入课程数！"  htmlEscape="false" defaultValue="20"/>
				<label class="Validform_checktip"></label>
			</td>
		</tr>
		</tbody>
	</table>
</form:form>

</body>
</html>