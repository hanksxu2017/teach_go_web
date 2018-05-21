<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title>班级信息</title>
    <meta name="decorator" content="list"/>
    <html:component name="bootstrap-treeview"/>
</head>
<body title="班级信息">
<div class="row">
    <div class="col-sm-10 col-md-10">
        <grid:grid id="studyClassGridId" url="${adminPath}/sys/study/class/ajaxList">
            <grid:column label="sys.common.key" hidden="true" name="id" width="100"/>
            <grid:column label="校区" name="studyPlaceName" dict="studyplace" query="true" queryMode="select"  />
            <grid:column label="科目" name="subjectName" />
            <grid:column label="名称" name="name" />
            <grid:column label="授课老师" name="teacherName" query="true" queryMode="input" condition="like"/>
            <grid:column label="学生数量" name="studentCount" />
            <grid:column label="状态" name="statusStr" width="50"/>
            <grid:column label="创建时间" name="createDateStr"/>

            <grid:toolbar title="sys.create" function="create"/>
            <grid:toolbar title="sys.update" function="update"/>
            <grid:toolbar title="sys.delete" function="delete"/>

            <grid:toolbar function="search"/>
            <grid:toolbar function="reset"/>
        </grid:grid>
    </div>
</div>

</body>
</html>