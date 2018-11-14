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
            <grid:column label="学生姓名" name="studentName" width="50"/>
            <grid:column label="班级" name="className" />
            <grid:column label="课时" name="schoolName" />
            <grid:column label="等级" name="level" width="50"/>
            <grid:column label="联系方式" name="phone"/>
            <grid:column label="剩余课时" name="remainCourse" width="80"/>
            <grid:column label="状态" name="statusStr" width="50"/>
            <grid:column label="入学时间" name="createDateStr"/>

            <grid:toolbar title="sys.create" function="create"/>
            <grid:toolbar title="sys.update" function="update"/>
            <grid:toolbar title="sys.delete" function="delete"/>

            <grid:toolbar title="课时增加" icon="fa fa-pencil-square-o"  function="updateDialog" url="${adminPath}/sys/student/{id}/addCourse"  winwidth="1200px" winheight="800px"/>

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