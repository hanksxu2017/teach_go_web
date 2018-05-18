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
<!-- 时间查询
<div class="row">
    <div id="groupGridIdGridQuery" class="col-sm-6">
        <div class="form-inline col-sm-6">
            <div class="form-group">
                <label class="control-label">开始日期：</label>
                <div id="startDate"  class="input-daterange input-group">
                    <input id='startDatePicker' class='form-control' />
                </div>
            </div>
        </div>
        <div class="form-inline col-sm-6">
            <div class="form-group">
                <label class="control-label">结束日期：</label>
                <div id="endDate"  class="input-daterange input-group">
                    <input id='endDatePicker' class='form-control' />
                </div>
            </div>
        </div>
        <br/>
    </div>
</div>
 -->
<div class="row">
	<div  class="col-sm-11 col-md-11">
		<grid:grid id="courseRecordGridId" url="${adminPath}/sys/course/record/ajaxList" >
            <grid:query name="queryStartDate"  queryMode="hidden" />
            <grid:query name="queryEndDate"  queryMode="hidden" />
            <grid:column label="sys.common.key" hidden="true" name="id"/>
			<grid:column label="课程编号" name="courseCode" width="80"/>
			<grid:column label="sys.course.weekInfo" name="weekDay" dict="weekinfo"  query="true" queryMode="select"  width="80"/>
		    <grid:column label="授课教师"  name="teacherRealName" query="true" condition="like" />
		    <grid:column label="开始时间"  name="courseStartDateStr"/>
		    <grid:column label="结束时间"  name="courseEndDateStr"  />
		    <grid:column label="时长(分钟)"  name="duration"  width="80"/>
		    <grid:column label="应到学生"  name="studentQuantityPlan"  width="80"/>
		    <grid:column label="实到学生"  name="studentQuantityActual"  width="80"/>
		    <grid:column label="是否存在调整"  name="haveAdjustStr"  />
			<grid:column label="进度"  name="statusStr"  />

			<grid:toolbar title="学生签到" icon="fa fa-pencil-square-o"  function="updateDialog" url="${adminPath}/sys/course/record/{id}/signIn"  winwidth="1200px" winheight="800px"/>
			<grid:toolbar title="授课调整" icon="fa fa-pencil-square-o"  function="updateDialog" url="${adminPath}/sys/course/record/{id}/adjust"  winwidth="1200px" winheight="800px"/>
			<grid:toolbar  function="search"/>
			<grid:toolbar  function="reset"/>
		</grid:grid>
	</div>
</div>

<script>
    $(function () {

        $("#startDate").datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });

        $("#endDate").datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });

    });


</script>
</body>
</html>