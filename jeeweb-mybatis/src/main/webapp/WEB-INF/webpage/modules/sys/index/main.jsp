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
	                    <p><i class="fa fa-send-o"></i> 官网：<a href="http://www.jeeweb.cn/" target="_blank">http://www.jeeweb.cn/</a></p>
	                    <p><i class="fa fa-qq"></i> QQ群：<a href="javascript:;">570062301</a></p>
	                    <p><i class="fa fa-code"></i> 源码下载：<a href="http://git.oschina.net/dataact/jeeweb/"  target="_blank">开源中国</a></p>
	                </div>

                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>更新日志</h5>
                    </div>
                    <div class="ibox-content no-padding">
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
                        <h5>Jeeweb适用范围</h5>
                    </div>
                    <div class="ibox-content">
                        <h4>Jeeweb具有以下特点：</h4>
				        <ol>
				            <li>采用主流的框架，容易上手;</li>
				            <li>强大的代码生成器，一键生成代码</li>
				            <li>强大的标签支持，快速完成前端开发功能</li>
				            <li>提供不同风格,比如inspinia、ace。支持风格扩展...</li>
				            <li>开发效率很高，节省60%重复工作</li>
				            <li>采用Bootstrap技术，完美兼容手机端开发</li>
				            <li>Apache Shiro为权限授权层，使得权限易用，更可靠</li>
				            <li>国际化能力，支持多语言</li>
				            <li>整合短信发送、邮件发送功能</li>
				            <li>跨数据源操作，便捷集成第三方系统</li>
				            <li>计划任务管理，快捷完成计划任务的配置</li>
				            <li>Ehcahe对常用数据进行缓存</li>
				            <li>更多……</li>
				        </ol>
                        <hr>
                         <div class="alert alert-warning">
                               JeeWeb敏捷开发平台，可以应用在任何JAVA WEB项目的开发中，是信息化建设的良好解决方案。
                                                              采用代码生成功能，以及手工完善逻辑代码的开发方式，可以显著提高开发效率60%以上，极大降低开发成本。
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