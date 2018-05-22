<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
	<title>课时数据</title>
	<meta name="decorator" content="list"/>
	<html:component name="bootstrap-treeview"/>
</head>
<body title="课时数据">
<div class="row">
	<div class="col-sm-3 col-md-2" >
		<view:treeview id="courseTreeview" dataUrl="${adminPath}/sys/course/bootstrapTreeData" onNodeSelected="courseOnclick"></view:treeview>
		<script type="text/javascript">
            function courseOnclick(event, node) {
                //gridquery隐藏 查询标签概念，query,单独的query
                $("input[name='weekInfoId']").val(node.href);
                search('cfgCourseTimeGridIdGrid');
            }
		</script>
	</div>
	<div  class="col-sm-9 col-md-10">
		<grid:grid id="cfgCourseTimeGridId" url="${adminPath}/sys/cfg/course/time/ajaxList">
			<grid:query name="weekInfoId" queryMode="hidden" />
			<grid:column label="sys.common.key" hidden="true" name="id"/>
			<%--<grid:column label="sys.course.weekInfo" name="weekDay"/>--%>
			<grid:column label="序号" name="sortName"/>
			<grid:column label="开始时间"  name="startTime"/>
			<grid:column label="结束时间"  name="endTime"  />

			<grid:toolbar title="sys.create" function="create"/>
			<grid:toolbar title="sys.update" function="update"/>

			<grid:toolbar function="delete"/>
			<grid:toolbar  function="search"/>
			<grid:toolbar  function="reset"/>
		</grid:grid>
	</div>
</div>
</body>
</html>