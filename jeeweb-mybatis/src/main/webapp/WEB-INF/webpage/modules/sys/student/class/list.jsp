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
        <grid:grid id="studentGridId" url="${adminPath}/sys/student/class/ajaxList">
            <grid:column label="sys.common.key" hidden="true" name="id" width="100"/>
            <grid:column label="学生姓名" name="studentName" query="true" condition="like"/>
            <grid:column label="学生" name="studentName" width="50"/>
            <grid:column label="班级" name="className" />
            <grid:column label="状态" name="statusStr" />
            <grid:column label="分班时间" name="createDateStr"/>
            <grid:toolbar function="search"/>
            <grid:toolbar function="reset"/>
        </grid:grid>
    </div>
</div>

<script>
    $(function () {
    });
</script>
</body>
</html>