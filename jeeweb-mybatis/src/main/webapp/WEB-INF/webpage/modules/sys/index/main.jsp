<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>首页</title>
	<meta name="keywords" content="<spring:message code="sys.site.keywords" arguments="${platformName}"/>">
	<meta name="description" content="<spring:message code="sys.site.description" arguments="${platformName}"/>">

    <html:css  name="favicon,bootstrap,font-awesome,animate"/>
    <link href="${staticPath}/common/css/style.css" rel="stylesheet">
    
</head>

<body class="gray-bg">
    <div class="row  border-bottom white-bg dashboard-header">
        <div class="col-sm-12">
            <blockquote class="text-warning" style="font-size:14px">舟山市普陀区围棋协会</blockquote>
        </div>
    </div>
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>联系信息</h5>

                    </div>
                    <div class="ibox-content">
	                    <p><i class="fa fa-send-o"></i> 咨询：13567656558(围协张老师)</p>
	                    <p><i class="fa fa-wechat"></i> 微信公众号：普陀围棋</p>
	                </div>

                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>更新日志</h5>
                    </div>
                    <div class="ibox-content no-padding" hidden>
                        <div class="panel-body">
                            <div class="panel-group" id="version">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title">
                                                <a data-toggle="collapse" data-parent="#version" href="#v01">v1.0</a><code class="pull-right">2017.07.06</code>
                                        </h5>
                                    </div>
                                    <div id="v01" class="panel-collapse collapse in">
                                        <div class="panel-body">
                                             <ol>
                                                <li>框架首次发布</li>
                                            </ol>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>系统介绍</h5>
                    </div>
                    <div class="ibox-content">
                        <h4>功能说明：</h4>
				        <ol>
				            <li>基础数据配置模块</li>
				            <li>教师信息</li>
				            <li>学生信息</li>
				            <li>班级信息</li>
				            <li>课程信息,包括课时/课程表/</li>
				            <li>授课记录</li>
				            <li>更多……</li>
				        </ol>
                        <hr>
                         <div class="alert alert-warning">
                               普陀围棋，欢迎您！
                         </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
 	<!-- 全局js -->
	<html:js  name="jquery,bootstrap"/>

	<!-- 自定义js -->
	<script src="${staticPath}/common/js/content.js"></script>
	
</body>

</html>