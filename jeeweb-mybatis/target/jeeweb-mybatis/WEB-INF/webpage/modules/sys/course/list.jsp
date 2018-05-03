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
	<div  class="col-sm-6 col-md-4">
		<grid:grid id="courseGridId" url="${adminPath}/sys/course/ajaxList" >
			<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
			<grid:column label="sys.course.weekInfo"   width="30" name="weekInfo"   dict="weekinfo"  query="true" queryMode="select"  />
		    <grid:column label="开始时间"  name="startTime"/>
		    <grid:column label="结束时间"  name="endTime"  />
		    <grid:column label="时长(分钟)"  name="duration"  />
		    <grid:column label="状态"  name="statusStr"  />
		    <grid:column label="创建时间"  name="createDateStr"  />

			<grid:toolbar title="sys.create" function="create"/>
			<grid:toolbar title="sys.update" function="update"/>
			<grid:toolbar title="sys.delete" function="delete"/>
			<grid:toolbar  function="search"/>
			<grid:toolbar  function="reset"/>
		</grid:grid>
	</div>
    <div  class="col-sm-6 col-md-4">
        <grid:grid id="courseGridId1" url="${adminPath}/sys/teacher/ajaxList">
            <grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
            <grid:column label="sys.course.weekInfo"   width="60" name="weekInfo"/>
            <grid:column label="开始时间"  name="startTime"/>
            <grid:column label="结束时间"  name="endTime"  />
            <grid:column label="时长(分钟)"  name="duration"  />
            <grid:column label="状态"  name="statusStr"  />
            <grid:column label="创建时间"  name="createDateStr"  />
        </grid:grid>
    </div>
</div>

</body>
</html>