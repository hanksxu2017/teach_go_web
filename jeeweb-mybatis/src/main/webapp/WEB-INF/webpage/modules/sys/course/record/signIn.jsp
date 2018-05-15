<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
	<title><spring:message code="sys.course" /></title>
	<meta name="decorator" content="list"/>
	<html:component name="bootstrap-treeview"/>

</head>
<body class="white-bg">
<input type="hidden" value="${courseRecId}" id="selectedCourseRecId">
<div class="row">

	<div class="col-sm-10">
		<div class="content-body">
            <div class="popover-title" >
                <div class="checkbox"></div><label><input type="checkbox" onchange="CheckAll(this)" />全选</label>
                <button type="button" class="close" onclick="hide()">
                    <span aria-hidden="true">&times;</span>
                    <span class="sr-only">Close</span>
                </button>
            </div>
            <div class="popover-content">
                <ul class="list-inline" id="ul" >
                    <!--<li><div class="checkbox"></div><label><input type="checkbox" value="0" onclick="Choose(this)"/>5M</label></li>-->
                    <c:forEach items="${courseStudentRecordList}" var="li">
                        ${li.studentRealName}
                        <li>
                            <div class='checkbox'></div>
                            <label><input type='checkbox' value="${li.studentId}" onclick='Choose(this)'/>${li.studentRealName}</label></li>
                    </c:forEach>
                </ul>
            </div>
		</div>
	</div>

</div>


<script>

	$(function () {

    });

    //全选操作
    function CheckAll(t) {
        var name = "";
        var ids = "";
        var popoverContent = $($(t).parent().parent().parent().children()[2]);
        popoverContent.find("input[type=checkbox]").each(function(i,th) {
            th.checked = t.checked;
            if (t.checked) {
                name += $(th).parent().text() + ",";
                ids += $(th).val() + ",";
            }
        });
        name = name.substr(0, name.length - 1);
        ids = ids.substr(0, ids.length - 1);
        $("#txt").val(name);
        $("#ids").val(ids);
    }

    //勾选某一个操作
    function Choose(t) {
        var oldName = $("#txt").val();
        var name = oldName == "" ? "," + $("#txt").val() : "," + $("#txt").val() + ",";
        var ids = oldName == "" ? "," + $("#ids").val() : "," + $("#ids").val() + ",";
        var newName = $(t).parent().text();
        var newid = $(t).val();

        if (t.checked) {//选中的操作
            $("#txt").val(name += newName + ",");
            $("#ids").val(ids += newid + ",");
        } else {//去掉选中的操作
            var index = name.indexOf(","+newName+",");
            var len = newName.length;
            name = name.substring(0, index) + name.substring(index + len + 1, name.length);

            var index = ids.indexOf("," + newid + ",");
            var len = newid.length;
            ids = ids.substring(0, index) + ids.substring(index + len + 1, ids.length);
        }
        name = name.substr(1, name.length - 2);
        ids = ids.substr(1, ids.length - 2);
        $("#txt").val(name);
        $("#ids").val(ids);
    }
	
</script>

</body>
</html>