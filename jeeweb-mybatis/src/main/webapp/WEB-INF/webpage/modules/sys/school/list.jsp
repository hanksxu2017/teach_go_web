<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title>学校信息</title>
    <meta name="decorator" content="list"/>
    <html:component name="bootstrap-treeview"/>
</head>
<body title="学校信息">
<div class="row">
    <div class="col-sm-10 col-md-10">
        <grid:grid id="schoolGridId" url="${adminPath}/sys/school/ajaxList">
            <grid:column label="sys.common.key" hidden="true" name="id" width="100"/>
            <grid:column label="名称" name="name" query="true" condition="like"/>
            <grid:column label="地址" name="address" />

            <grid:toolbar title="sys.create" function="create"/>
            <grid:toolbar title="sys.edit" function="edit"/>
            <grid:toolbar title="sys.delete" function="delete"/>

            <grid:toolbar function="search"/>
            <grid:toolbar function="reset"/>
        </grid:grid>
    </div>
</div>

</body>
</html>