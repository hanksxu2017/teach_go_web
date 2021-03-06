<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>校区信息|新增</title>
	<meta name="decorator" content="form"/>

</head>

<body class="white-bg"  formid="studySchoolForm">
<form:form id="studySchoolForm" modelAttribute="data" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>名称:</label>
			</td>
			<td class="width-35" >
				<form:input path="name" class="form-control" datatype="*" nullmsg="请输入名称！" htmlEscape="false" />
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>地址:</label>
			</td>
			<td class="width-35" >
				<form:input path="address" class="form-control" datatype="*" nullmsg="请输入地址！" htmlEscape="false" />
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label>备注:</label>
			</td>
			<td class="width-35" >
				<form:textarea path="remarks" rows="4" htmlEscape="false" class="form-control" />
			</td>
		</tr>

		</tbody>
	</table>
</form:form>

</body>
</html>