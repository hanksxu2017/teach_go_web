<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>学生签到</title>
    <meta name="decorator" content="form"/>
</head>

<body class="white-bg" formid="signInForm">
<form:form id="signInForm" modelAttribute="data" method="post" class="form-horizontal">
    <input type="hidden" id = "courseRecId" value="${courseRecId}">
    <div class="row">

        <div class="col-sm-10">
            <div class="content-body">
                <div class="popover-title">
                    <span class="btn btn-sm btn-info" onclick="checkAll()"><i class="fa fa fa-pencil-square-o"></i>全选</span>
                    <span class="btn btn-sm btn-info" onclick="cancelAll()"><i class="fa fa fa-pencil-square-o"></i>清空</span>
                </div>
                <div class="popover-content" id="contentDiv">
                   <%-- <ul class="list-inline" id="ul">
                        <c:forEach items="${courseStudentRecordList}" var="li">
                            <li>
                                <label><input name="studentIds" type='checkbox' value="${li.studentId}"/>${li.studentRealName}</label>
                            </li>
                        </c:forEach>
                    </ul>--%>
                </div>
            </div>
        </div>

    </div>

</form:form>


<script>

    $(function () {
        // 加载学生数据
        $.ajax({
            type : "post",
            url : "${adminPath}/sys/course/record/findStudents",
            dataType : "json",
            data : {
                "courseRecId" : $("#courseRecId").val(),
            },
            success : function(data) {
                if(data.ret == 0 && data.data != null) {
                    var studentContent = "";
                    $.each(data.data, function (index, item) {
                        if(0 == index || index / 4 == 0) {
                            studentContent += "<ul class='list-inline' id='ul'>"
                        }
                        studentContent += "<li><label><input name='studentIds' type='checkbox' value='" + item.studentId + "'/>" + item.studentRealName +　"</label></li>";
                        if(0 == index || index / 4 == 0) {
                            studentContent += "</ul>"
                        }
                    });
                    $("#contentDiv").html(studentContent);
                } else {
                    $("#contentDiv").html("<span>无学生信息</span>");
                }
            }
        });
    });

    //全选
    function checkAll() {
        var popoverContent = $("ul");
        popoverContent.find("input[type=checkbox]").each(function (i, th) {
            $(th).prop('checked', true);
        });
    }

    //取消全选
    function cancelAll() {
        var popoverContent = $("ul");
        popoverContent.find("input[type=checkbox]").each(function (i, th) {
            $(th).prop('checked', false);
        });
    }

</script>

</body>
</html>