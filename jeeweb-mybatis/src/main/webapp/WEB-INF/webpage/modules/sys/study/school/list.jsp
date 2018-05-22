<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <title>校区信息</title>
    <meta name="decorator" content="grid-select"/>
</head>
<body title="校区信息">
<grid:grid id="studySchoolGridId" url="${adminPath}/sys/study/school/ajaxList">
    <grid:column label="sys.common.key" hidden="true" name="id"/>
    <grid:column label="sys.common.opt" name="opt" formatter="button" width="100"/>
    <grid:button title="新增班级" groupname="opt" function="rowDialogDetailRefresh" outclass="btn-primary"
                 innerclass="fa-plus" url="${adminPath}/sys/study/class?schoolId=\"+row.id+\""/>

    <%--<grid:button title="新增教室" groupname="opt" function="rowDialogDetailRefresh" outclass="btn-primary"--%>
                 <%--innerclass="fa-plus" url="${adminPath}/sys/study/classroom?schoolId=\"+row.id+\""/>--%>

    <grid:column label="校区" name="name"/>
    <grid:column label="地址" name="address"/>

    <grid:toolbar function="create"/>
    <grid:toolbar function="update"/>
    <grid:toolbar function="search"/>
    <grid:toolbar function="reset"/>
</grid:grid>
</body>
</html>