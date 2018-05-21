<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>学生信息|新增</title>
	<meta name="decorator" content="form"/>

</head>

<body class="white-bg"  formid="studentForm">
<form:form id="studentForm" modelAttribute="data" method="post" class="form-horizontal">
	<form:hidden path="id"/>
	<table  class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		<tbody>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>姓名:</label>
			</td>
			<td class="width-35" >
				<form:input path="realName" class="form-control " datatype="*" nullmsg="请输入姓名！" htmlEscape="false" />
				<label class="Validform_checktip"></label>
			</td>

			<td  class="width-15 active text-right">
				<label><font color="red">*</font>性别:</label>
			</td>
			<td class="width-35" >
				<form:select path="sex"  dict="sex" class="form-control"></form:select>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>出生年月:</label>
			</td>
			<td class="width-35" >
				<form:input path="birthday" id="birthday" class="form-control" datatype="*" nullmsg="请设置出生年月！" htmlEscape="false" />
				<label class="Validform_checktip"></label>
			</td>

			<td  class="width-15 active text-right">
				<label><font color="red">*</font>身份证编号:</label>
			</td>
			<td class="width-35" >
				<form:input path="idCard" class="form-control " datatype="*" nullmsg="请输入身份证编号！" htmlEscape="false" />
				<label class="Validform_checktip"></label>
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
				<label><font color="red">*</font>联系方式:</label>
			</td>
			<td class="width-35" >
				<form:input path="phone" class="form-control" datatype="*" nullmsg="请输入手机号！" htmlEscape="false" />
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>等级:</label>
			</td>
			<td class="width-35" >
				<form:input path="level" class="form-control" datatype="*" nullmsg="请输入等级！"  htmlEscape="false" defaultValue="25"/>
				<label class="Validform_checktip"></label>
			</td>

			<td  class="width-15 active text-right">
				<label><font color="red">*</font>初始课时:</label>
			</td>
			<td class="width-35" >
				<form:input path="totalCourse" class="form-control" datatype="*" nullmsg="请输入课程数！"  htmlEscape="false" defaultValue="20"/>
				<label class="Validform_checktip"></label>
			</td>
		</tr>

		<tr>
			<td  class="width-15 active text-right">
				<label><font color="red">*</font>校区:</label>
			</td>
			<td class="width-35" >
				<form:select path="studyPlace"  dict="studyplace" class="form-control" id="studyPlaceSelect"></form:select>
				<label class="Validform_checktip"></label>
			</td>

			<td  class="width-15 active text-right">
				<label><font color="red">*</font>班级:</label>
			</td>
			<td class="width-35" >
				<select name="studyClassId" class="form-control" id="studyClassSelect">
				</select>
			</td>
		</tr>

		</tbody>
	</table>
</form:form>

<script>

    $(function () {

        $('#birthday').datepicker({

        });

        $('#studyPlaceSelect').on('change',function(){
            if($(this).val()){
                var selectedValue = $(this).find('option:selected').val();

                $.ajax({
                    url : "${adminPath}/sys/study/class/list",
                    type : 'post',
                    data : {
                        studyPlace : selectedValue
                    },
                    cache : false,
                    success : function(d) {
                        if (d.ret==0) {
                            for (var i = 0; i < d.data.length; i++) {
                                $("#studyClassSelect").append("<option value='" + d.data[i].id + "'>" + d.data[i].name + "</option>");
                            }
                        }else{
                            swal("提示！", d.msg, "error");
                        }
                    }
				});
            }
        });
    });


</script>

</body>
</html>