<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
  <title>教室信息</title>
  <meta name="decorator" content="grid-select"/>
</head>
<body title="教室信息">
<grid:grid id="groupGridId" url="${adminPath}/sys/dict/ajaxList?gid=${group.id}">
	<grid:column label="sys.common.key" hidden="true"   name="id" width="100"/>
    <grid:column label="校区"  name="label"  query="true"  />
    <grid:column label="sys.dict.value"  name="value"  query="true"  />
    
	<grid:toolbar function="create" url="${adminPath}/sys/dict/create?gid=${group.id}"  />
	<grid:toolbar   function="update"    />
	<grid:toolbar   function="delete"    />
	<grid:toolbar  function="search"  />
	<grid:toolbar  function="reset"  />
</grid:grid>
</body>
</html>