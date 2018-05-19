<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title><spring:message code="sys.student.title"/></title>
    <meta name="decorator" content="list"/>
    <html:component name="bootstrap-treeview"/>
</head>
<body title="<spring:message code="sys.student.title" />">
<div class="row">
    <div class="col-sm-10 col-md-10">
        <grid:grid id="studentGridId" url="${adminPath}/sys/student/ajaxList">
            <grid:column label="sys.common.key" hidden="true" name="id" width="100"/>
            <grid:column label="sys.realName" name="realName" query="true" condition="like"/>
            <grid:column label="年龄" name="age"/>
            <grid:column label="sys.student.level" name="level"/>
            <grid:column label="总课时" name="totalCourse"/>
            <grid:column label="已用课时" name="usedCourse"/>
            <grid:column label="家长姓名" name="parentName"/>
            <grid:column label="联系方式" name="parentPhone"/>
            <grid:column label="sys.status" name="statusStr"/>
            <grid:column label="sys.createDate" name="createDateStr"/>

            <grid:toolbar title="sys.create" function="create"/>
            <grid:toolbar title="sys.update" function="update"/>
            <grid:toolbar title="sys.delete" function="delete"/>
            <grid:toolbar title="sys.course" icon="fa fa-pencil-square-o"  function="updateDialog" url="${adminPath}/sys/student/{id}/course"  winwidth="1400px" winheight="800px"/>

            <grid:toolbar function="search"/>
            <grid:toolbar function="reset"/>
        </grid:grid>
    </div>
</div>

</body>
</html>