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
<input type="hidden" value="${student.id}" id="selectedStudentId">
<div class="row">
	<div class="col-sm-5">
		<div class="content-body">
			<grid:grid id="selectedCourseGridIdStu" url="${adminPath}/sys/course/ajaxList?studentId=${student.id}" multiselect="false">
				<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
                <grid:column label="编号"  name="code"/>
				<grid:column label="sys.course.weekInfo" name="weekDay"   dict="weekinfo"  query="true" queryMode="select"  />
				<grid:column label="开始时间"  name="startTime"/>
				<grid:column label="结束时间"  name="endTime"  />
				<grid:column label="时长(分钟)"  name="duration"  />
				<grid:column label="状态"  name="statusStr"  />

				<grid:toolbar  function="search"/>
				<grid:toolbar  function="reset"/>
			</grid:grid>
		</div>
	</div>
	<div class="col-sm-2">
		<div class="text-center" style="padding-top: 200px;">
			<button class="btn btn-large btn-info" onclick="removeCourse()"><i class="fa fa-search"></i>移除</button><br/>
			<button class="btn btn-large btn-info" onclick="receiveCourse()"><i class="fa fa-search"></i>加入</button>
		</div>
	</div>
	<div class="col-sm-5">
		<div class="content-body">
			<grid:grid id="blankCourseGridIdStu" url="${adminPath}/sys/course/ajaxList?s_blank=1&studentId=${student.id}" multiselect="false">
				<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
                <grid:column label="编号"  name="code"/>
                <grid:column label="sys.course.weekInfo" name="weekDay"   dict="weekinfo"  query="true" queryMode="select"  />
				<grid:column label="开始时间"  name="startTime"/>
				<grid:column label="结束时间"  name="endTime"  />
				<grid:column label="时长(分钟)"  name="duration"  />
				<grid:column label="状态"  name="statusStr"  />

				<grid:toolbar  function="search"/>
				<grid:toolbar  function="reset"/>
			</grid:grid>
		</div>

	</div>

</div>


<script>

	$(function () {
        $("input[name='studentId']").val($("#selectedTeacherId").val());
    });

	function removeCourse() {
        var rowId = $("#selectedCourseGridIdStuGrid").jqGrid("getGridParam", "selrow");
        if(null != rowId) {
            var courseInfo = $("#selectedCourseGridIdStuGrid").jqGrid("getRowData", rowId);
			if(null != courseInfo) {
			    var courseId = courseInfo['id'];
			    if(null != courseId && '' != courseId) {
                    $.ajax({
                        type : "post",
                        url : "${adminPath}/sys/student/removeCourse",
                        dataType : "json",
						data : {
                            "studentId" : $("#selectedStudentId").val(),
							"courseId" : courseId,
                        },
                        success : function(data) {
                            if(data.statusCode == 0) {
                                search('selectedCourseGridIdStuGrid');
                                search('blankCourseGridIdStuGrid');
                            }
                        }
                    });
				}
			}
        }
    }

    function receiveCourse() {
        var rowId = $("#blankCourseGridIdStuGrid").jqGrid("getGridParam", "selrow");
        if(null != rowId) {
            var courseInfo = $("#blankCourseGridIdStuGrid").jqGrid("getRowData", rowId);
            if(null != courseInfo) {
                var courseId = courseInfo['id'];
                if(null != courseId && '' != courseId) {
                    $.ajax({
                        type : "post",
                        url : "${adminPath}/sys/student/addCourse",
                        dataType : "json",
                        data : {
                            "studentId" : $("#selectedStudentId").val(),
                            "courseId" : courseId,
                        },
                        success : function(data) {
                            if(data.statusCode == 0) {
                                search('selectedCourseGridIdStuGrid');
                                search('blankCourseGridIdStuGrid');
                            } else if(data.statusCode == -1) {
                                alert(data.errMsg);
                            }
                        }
                    });
                }
            }
        }
    }
	
	
	
</script>

</body>
</html>