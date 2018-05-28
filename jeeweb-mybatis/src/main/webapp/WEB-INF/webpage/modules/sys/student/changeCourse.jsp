<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
	<title>学生课时信息</title>
	<meta name="decorator" content="list"/>
	<html:component name="bootstrap-treeview"/>
</head>
<body title="学生课时信息">
<grid:grid id="groupGridId" url="${adminPath}/sys/student/course/ajaxList?studentId=${student.id}">
	<grid:column label="sys.common.key" hidden="true" name="id"/>
	<grid:column label="校区" name="studySchoolName"/>
	<grid:column label="班级" name="studyClassName"/>
	<grid:column label="教师" name="teacherName"/>
	<grid:column label="星期" name="weekDay"/>
	<grid:column label="课时"  name="courseDesc" />
	<grid:toolbar function="create" url="${adminPath}/sys/student/course/create?studentId=${student.id}"  />
	<grid:toolbar   function="update"    />
	<grid:toolbar   function="delete"    />
	<grid:toolbar title="生成授课记录" icon="fa fa-pencil-square-o"  function="updateDialog" url="${adminPath}/sys/course/generateStudentRec?studentId=${student.id}&courseId=\"+row.id+\""  winwidth="1200px" winheight="800px"/>
	<grid:toolbar  function="search"  />
	<grid:toolbar  function="reset"  />
</grid:grid>

</body>
</html>