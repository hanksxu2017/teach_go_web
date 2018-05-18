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
			<grid:column label="sys.common.key" hidden="true" name="id"/>
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
			<grid:toolbar title="生成授课信息" icon="fa fa-pencil-square-o"  onclick="generateCourseRec()"/>
			<grid:toolbar  function="reset"/>
		</grid:grid>
	</div>
</div>

<script>

    function generateCourseRec() {
        var gridId = "courseGridIdGrid";

        var rowsData = $("#"+gridId).jqGrid('getGridParam','selarrrow');
        var rowData= $("#"+gridId).jqGrid('getGridParam','selrow');

        if (!rowsData || rowsData.length==0) {
            top.layer.alert('请至少选择一条数据!', {icon: 0, title:'警告'});
            return;
        }
        if (rowsData.length>1) {
            top.layer.alert('只能选择一条数据!', {icon: 0, title:'警告'});
            return;
        }

        $.ajax({
            url : "${adminPath}/sys/course/record/generateRec",
            type : 'post',
            data : {
                courseId : rowsData[0]
            },
            cache : false,
            success : function(d) {
                var msg = d.msg;
                if (d.ret==0) {
                    swal("提示！", msg, "success");
                    //刷新表单
                    // refreshTable(gridId);
                }else{
                    swal("提示！", msg, "error");
                }
            }
        });
    }



</script>
</body>
</html>