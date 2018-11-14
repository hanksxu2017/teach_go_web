<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生信息修改</title>
    <meta name="decorator" content="form"/>

</head>

<body class="white-bg" formid="studentForm">
<form:form id="studentForm" modelAttribute="data" method="post" class="form-horizontal">
    <input type="hidden" id="studyClassIdValue" value="${data.studyClassId}">
    <form:hidden path="id"/>
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>

        <tr>
            <td  class="width-15 active text-right">
                <label>姓名:</label>
            </td>
            <td class="width-35" >
                <form:input path="realName" class="form-control " datatype="*" nullmsg="请输入姓名！" htmlEscape="false" />
                <label class="Validform_checktip"></label>
            </td>

            <td  class="width-15 active text-right">
                <label>性别:</label>
            </td>
            <td class="width-35" >
                <form:select path="sex"  dict="sex" class="form-control" />
            </td>
        </tr>

        <tr>
            <td  class="width-15 active text-right">
                <label>出生日期<br/>(例如:1990.10.1):</label>
            </td>
            <td class="width-35" >
                <form:input path="birthday" id="birthday" class="form-control" datatype="*" nullmsg="请输入出生日期！" htmlEscape="false" />
                <label class="Validform_checktip"></label>
            </td>

            <td  class="width-15 active text-right">
                <label>身份证编号:</label>
            </td>
            <td class="width-35" >
                <form:input path="idCard" class="form-control " nullmsg="请输入身份证编号！" htmlEscape="false" />
            </td>
        </tr>

        <tr>
            <td  class="width-15 active text-right">
                <label>就读学校:</label>
            </td>
            <td class="width-35" >
                <select name="schoolId" class="form-control">
                    <c:forEach items="${schools}" var="school">
                        <option value="${school.id}">${school.name}</option>
                    </c:forEach>
                </select>
                <label class="Validform_checktip"></label>
            </td>

            <td  class="width-15 active text-right">
                <label>联系方式:</label>
            </td>
            <td class="width-35" >
                <form:input path="phone" class="form-control" datatype="*" nullmsg="请输入手机号！" htmlEscape="false" />
                <label class="Validform_checktip"></label>
            </td>
        </tr>

        <tr>
            <td  class="width-15 active text-right">
                <label>等级:</label>
            </td>
            <td class="width-35" >
                <form:input path="level" class="form-control" datatype="*" nullmsg="请输入等级！"  htmlEscape="false" defaultValue="25"/>
                <label class="Validform_checktip"></label>
            </td>

            <td  class="width-15 active text-right">
                <label>初始课时:</label>
            </td>
            <td class="width-35" >
                <form:input path="totalCourse" class="form-control" disabled="true"/>
            </td>
        </tr>

<%--
        学生n:n班级
<tr>
            <td  class="width-15 active text-right">
                <label>校区:</label>
            </td>
            <td class="width-35" >
                <select name="studySchoolId" class="form-control" id="studySchoolIdSelect">
                    <c:forEach items="${studySchools}" var="studyShool">
                        <option value="${studyShool.id}">${studyShool.name}</option>
                    </c:forEach>
                </select>
            </td>

            <td  class="width-15 active text-right">
                <label>班级:</label>
            </td>
            <td class="width-35" >
                <select name="studyClassId" class="form-control" id="studyClassSelect" >
                </select>
            </td>
        </tr>--%>

        </tbody>
    </table>
</form:form>


<script>

    $(function () {

        if(null != $("#studySchoolIdSelect").find('option:selected')) {
            initStudyClass($("#studySchoolIdSelect").find('option:selected').val());
        }

        $('#studySchoolIdSelect').on('change',function(){
            if($(this).val()){
                initStudyClass($(this).find('option:selected').val());
            }
        });
    });

    function initStudyClass(studySchoolIdSelect) {
        $.ajax({
            url : "${adminPath}/sys/study/class/list",
            type : 'post',
            data : {
                studySchoolId : studySchoolIdSelect
            },
            cache : false,
            success : function(d) {
                $("#studyClassSelect").empty();
                if (d.ret==0) {
                    $("#studyClassSelect").append("<option value='-1'>--请选择班级--</option>");
                    for (var i = 0; i < d.data.length; i++) {
                        if($("#studyClassIdValue").val() == d.data[i].id) {
                            $("#studyClassSelect").append("<option value='" + d.data[i].id + "' selected>" + d.data[i].name + "</option>");
                        } else {
                            $("#studyClassSelect").append("<option value='" + d.data[i].id + "'>" + d.data[i].name + "</option>");
                        }
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