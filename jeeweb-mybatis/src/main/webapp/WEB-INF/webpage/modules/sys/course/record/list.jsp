<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="sys.course.title" /></title>
  <meta name="decorator" content="list"/>
  <html:component name="bootstrap-treeview"/>
</head>
<body title="<spring:message code="sys.course.title" />">
<div class="row">
	<div  class="col-sm-10 col-md-10">
		<grid:grid id="courseRecordGridId" url="${adminPath}/sys/courseRecord/ajaxList" >
			<grid:column label="sys.common.key" hidden="true" name="id" width="100"/>
			<grid:column label="课程编号" name="courseCode" />
			<grid:column label="sys.course.weekInfo" name="weekDay" dict="weekinfo"  query="true" queryMode="select"  />
		    <grid:column label="授课教师"  name="teacherRealName"/>
		    <grid:column label="开始时间"  name="startTime"/>
		    <grid:column label="结束时间"  name="endTime"  />
		    <grid:column label="时长(分钟)"  name="duration"  />
		    <grid:column label="应到学生"  name="statusStr"  />
		    <grid:column label="实到学生"  name="statusStr"  />
		    <grid:column label="是否存在调整"  name="statusStr"  />
			<grid:column label="进度"  name="statusStr"  />

			<grid:toolbar title="学生签到" icon="fa fa-pencil-square-o"  function="updateDialog" url="${adminPath}/sys/courseRecord/{id}/signIn"  winwidth="1200px" winheight="800px"/>
			<grid:toolbar title="授课老师调整" icon="fa fa-pencil-square-o"  function="updateDialog" url="${adminPath}/sys/courseRecord/{id}/adjust"  winwidth="1200px" winheight="800px"/>
			<grid:toolbar  function="search"/>
			<grid:toolbar  function="reset"/>
		</grid:grid>
	</div>
</div>

</body>
</html>