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
<input type="hidden" value="${teacher.id}" id="selectedTeacherId">
<div class="row">
	<div class="col-sm-5">
		<div class="content-body">
			<grid:grid id="selectedCourseGridId" url="${adminPath}/sys/course/ajaxList?teacherId=${teacher.id}" multiselect="false">
				<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
				<grid:query name="weekInfoId" queryMode="hidden" />
				<grid:query name="teacherId" queryMode="hidden" />
				<grid:column label="sys.course.weekInfo" name="weekInfo"   dict="weekinfo"  query="true" queryMode="select"  />
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
			<grid:grid id="blankCourseGridId" url="${adminPath}/sys/course/ajaxList?blank=1" multiselect="false">
				<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
				<grid:query name="weekInfoId" queryMode="hidden" />
				<grid:column label="sys.course.weekInfo" name="weekInfo"   dict="weekinfo"  query="true" queryMode="select"  />
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
        $("input[name='teacherId']").val($("#selectedTeacherId").val());
    });

	function removeCourse() {
        var rowId = $("#selectedCourseGridIdGrid").jqGrid("getGridParam", "selrow");
        if(null != rowId) {
            var courseInfo = $("#selectedCourseGridIdGrid").jqGrid("getRowData", rowId);
			if(null != courseInfo) {
			    var courseId = courseInfo['id'];
			    if(null != courseId && '' != courseId) {
                    $.ajax({
                        type : "post",
                        url : "${adminPath}/sys/teacher/removeCourse",
                        dataType : "json",
						data : {
                            "teacher_id" : $("#selectedTeacherId").val(),
							"course_id" : courseId,
                        },
                        success : function(data) {
                            search('selectedCourseGridIdGrid');
                            search('blankCourseGridIdGrid');
                        }
                    });
				}
			}
        }
    }

    function receiveCourse() {
        var rowId = $("#blankCourseGridIdGrid").jqGrid("getGridParam", "selrow");
        if(null != rowId) {
            var courseInfo = $("#blankCourseGridIdGrid").jqGrid("getRowData", rowId);
            if(null != courseInfo) {
                var courseId = courseInfo['id'];
                if(null != courseId && '' != courseId) {
                    $.ajax({
                        type : "post",
                        url : "${adminPath}/sys/teacher/addCourse",
                        dataType : "json",
                        data : {
                            "teacher_id" : $("#selectedTeacherId").val(),
                            "course_id" : courseId,
                        },
                        success : function(data) {
                            search('selectedCourseGridIdGrid');
                            search('blankCourseGridIdGrid');
                        }
                    });
                }
            }
        }
    }
	
	
	
</script>

</body>
</html>