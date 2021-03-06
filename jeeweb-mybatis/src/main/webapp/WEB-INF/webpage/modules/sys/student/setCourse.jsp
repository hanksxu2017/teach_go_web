<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="decorator" content="form"/>
</head>
<body title="学生课时信息">
<grid:grid id="groupGridId" url="${adminPath}/sys/student/course?studentId=${studySchool.id}">
	<grid:column label="sys.common.key" hidden="true" name="id"/>
	<grid:column label="校区" name="studySchoolName"/>
	<grid:column label="班级" name="studyClassName"/>
	<grid:column label="星期" name="weekDay"/>
	<grid:column label="课时"  name="courseDesc" />

	<grid:toolbar function="create" url="${adminPath}/sys/student/course/create?studySchoolId=${studySchool.id}"  />
	<grid:toolbar   function="update"    />
	<grid:toolbar   function="delete"    />
	<grid:toolbar  function="search"  />
	<grid:toolbar  function="reset"  />
</grid:grid>

</body>
</html>