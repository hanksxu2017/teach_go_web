<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
  <title><spring:message code="sys.course.title" /></title>
  <meta name="decorator" content="list"/>
  <html:component name="bootstrap-treeview"/>
</head>
<body title="<spring:message code="sys.course.title" />">
<div class="row">
	<div class="col-sm-3 col-md-2" >
		<view:treeview id="courseTreeview" dataUrl="${adminPath}/sys/course/bootstrapTreeData" onNodeSelected="courseOnclick"></view:treeview>
		<script type="text/javascript">
            function courseOnclick(event, node) {
                //gridquery隐藏 查询标签概念，query,单独的query
                $("input[name='weekInfoId']").val(node.href);
                search('courseGridIdGrid');
            }
		</script>
	</div>
	<div  class="col-sm-9 col-md-10">
		<grid:grid id="courseGridId" url="${adminPath}/sys/course/ajaxList" >
			<grid:column label="sys.common.key" hidden="true" name="id" width="100"/>
			<grid:column label="编号" name="code" />
            <grid:query name="weekInfoId" queryMode="hidden" />
			<grid:column label="sys.course.weekInfo" name="weekDay"/>
		    <grid:column label="开始时间"  name="startTime"/>
		    <grid:column label="结束时间"  name="endTime"  />
		    <grid:column label="时长(分钟)"  name="duration"  />
		    <grid:column label="授课老师"  name="teacherRealName"  />
		    <grid:column label="学生数量"  name="studentCount"/>

		    <grid:column label="状态"  name="statusStr"  />
		    <grid:column label="创建时间"  name="createDateStr"  />

			<grid:toolbar title="sys.create" function="create"/>
			<grid:toolbar title="sys.update" function="update"/>
			<grid:toolbar title="sys.delete" function="delete"/>

			<grid:toolbar title="学生列表" icon="fa fa-pencil-square-o"  function="updateDialog" url="${adminPath}/sys/course/{id}/listRelStudent"  winwidth="1200px" winheight="800px"/>
			<grid:toolbar title="生成授课记录" icon="fa fa-pencil-square-o"  function="generateCourseRec"/>
			<grid:toolbar  function="reset"/>
		</grid:grid>
	</div>
</div>

<script>


    function generateCourseRec() {
        var gridId = "courseGridIdStuGrid";

        var rowId = $("#" + gridId).jqGrid("getGridParam", "selrow");
        if(null != courseInfo) {
            var courseId = courseInfo['id'];
        }

        if(tipMsg==undefined||tipMsg==''){
            tipMsg="您确定要执行该操作！";
        }
        swal({
            title: "提示",
            text: tipMsg,
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "确定",
            closeOnConfirm: false,
            cancelButtonText: "取消",
        }, function () {
            $.ajax({
                url : "${adminPath}/sys/course/generateRec",
                type : 'post',
                data : {
                    courseId : courseId
                },
                cache : false,
                success : function(d) {
                    if (d.ret==0) {
                        var msg = d.msg;
                        swal("提示！", msg, "success");
                        //刷新表单
                        refreshTable(gridId);
                    }else{
                        var msg = d.msg;
                        swal("提示！", msg, "error");
                    }
                }
            });
        });
    }



</script>
</body>
</html>