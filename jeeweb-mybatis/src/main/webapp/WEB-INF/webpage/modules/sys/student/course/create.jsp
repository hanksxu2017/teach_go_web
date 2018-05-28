<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>学生课时信息|新增</title>
	<meta name="decorator" content="form"/>

</head>

<body class="white-bg"  formid="studentCourseForm">
<form:form id="studentCourseForm" modelAttribute="data" method="get" class="form-horizontal">
	<%--<input type="hidden" name="studentId" value="${student.id}">--%>
	<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>

		<tr>
			<td  class="width-15 active text-right">
				<label>校区:</label>
			</td>
			<td class="width-35" >
				<span>${studySchool.name}</span>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label>班级:</label>
			</td>
			<td class="width-35" >
                <input type="hidden" name="studyClassId" value="${studySchool.id}">
				<span>${studyClass.name}</span>
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>课时:</label>
			</td>
			<td class="width-35" >
				<select name="courseId" class="form-control">
					<option value="-1">--请选择课时--</option>
					<c:forEach items="${courseList}" var="course">
						<option value="${course.id}">${course.code}</option>
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