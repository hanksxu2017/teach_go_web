<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="sys.teacher.title" /></title>
  <meta name="decorator" content="list"/>
  <html:component name="bootstrap-treeview"/>
</head>
<body title="<spring:message code="sys.teacher.title" />">
<div class="row">
	<div  class="col-sm-10 col-md-10">
		<grid:grid id="teacherGridId" url="${adminPath}/sys/teacher/ajaxList" trackTrClick="true" editable="true">
			<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
		    <grid:column label="sys.realName"  name="realName"  query="true"  condition="like" />
		    <grid:column label="sys.phone"  name="phone"/>
		    <grid:column label="sys.status"  name="statusStr"/>
			<grid:column label="sys.createDate"  name="createDateStr"/>

			<grid:toolbar title="sys.create" function="create"/>
		 	<grid:toolbar title="sys.update" function="update"/>
			<grid:toolbar title="sys.delete" function="delete"/>
            <grid:toolbar title="sys.course" icon="fa fa-pencil-square-o"  function="updateDialog" url="${adminPath}/sys/teacher/{id}/course"  winwidth="1200px" winheight="800px"/>
			<grid:toolbar function="search"/>
			<grid:toolbar function="reset"/>
		</grid:grid>
	</div>
</div>

<script>
    function whenRowSelect(rowid) {
        var rowData = $("#teacherGridIdGrid").getRowData(rowid);
        if(null != rowData) {
            // alert(rowData['realName']);
		}
	}
</script>

</body>
</html>