<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title><spring:message code="sys.create" /></title>
	<meta name="decorator" content="form"/>
</head>

<body class="white-bg"  formid="courseForm">
<form:form id="courseForm" modelAttribute="data" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>
		<tr >
			<td  class="width-15 active text-right"><label>星期:</label></td>
			<td  class="width-35" colspan="2">
				<form:select path="weekInfo"  dict="weekinfo" defaultValue="${data.weekInfo}" class="form-control" onchange="weekDayChanged(this)" />
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label>课时:</label>
			</td>
			<td  class="width-35" >
                <select name="courseTimeId" class="form-control" id="courseTimeIdSelect">
                    <option value="-1">--请选择课时--</option>
                    <c:forEach items="${cfgCourseTimeList}" var="cfgCourseTime">
                        <c:choose>
                            <c:when test="${cfgCourseTime.id == data.courseTimeId}">
                                <option value="${cfgCourseTime.id}" selected>${cfgCourseTime.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${cfgCourseTime.id}">${cfgCourseTime.name}</option>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                </select>
			</td>
		</tr>

        <tr>
            <td  class="width-15 active text-right">
                <label>班级:</label>
            </td>
            <td  class="width-35" >
				<select name="studyClassId" class="form-control">
                    <option value="-1">--请选择班级--</option>
					<c:forEach items="${studyClassList}" var="studyClass">
                        <c:choose>
                            <c:when test="${studyClass.id == data.studyClassId}">
                                <option value="${studyClass.id}" selected>${studyClass.name}</option>
                            </c:when>
                            <c:otherwise>
                                <option value="${studyClass.id}">${studyClass.name}</option>
                            </c:otherwise>
                        </c:choose>
					</c:forEach>
				</select>
                <label class="Validform_checktip"></label>
            </td>
        </tr>

		</tbody>
	</table>
</form:form>


<script>

	$(function () {

	    
		
    });
	
	function weekDayChanged(weekInfoSelect) {
		var weekInfo = $(weekInfoSelect).val();
		$.ajax({
            url : "${adminPath}/sys/cfg/course/time/list",
            type : 'post',
            data : {
                weekInfo : weekInfo
            },
            cache : false,
            success : function(d) {
                $("#courseTimeIdSelect").empty();
                if (d.ret==0) {
                    $("#courseTimeIdSelect").append("<option value='-1'>--请选择课时--</option>");
                    for (var i = 0; i < d.data.length; i++) {
                        $("#courseTimeIdSelect").append("<option value='" + d.data[i].id + "'>" + d.data[i].name + "</option>");
                    }
                }else{
                    swal("提示！", d.msg, "error");
                }
            }
		});

    }

</script>
</body>
</html>