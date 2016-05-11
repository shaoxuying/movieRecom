<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>没有权限 - 中软国际OA系统</title>
<link rel="stylesheet" media="screen" href="<%=request.getContextPath()%>/css/common/noperm.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
<script type="text/javascript">
function help(){
    layer.alert('Tel: 17702439117<br>QQ: 1060183401', {
    	title: '联系管理员',
        skin: 'layui-layer-lan',
        shift: 3 //动画类型
    });
}
</script>
</head>
<body>
	<div style="width:35%; float:left; margin-top:10%; text-align:right;">
		<img alt="没有权限" src="<%=request.getContextPath()%>/images/common/noperm.png" width="30%" style="margin-right:10%; margin-top:10%;">
	</div>

	<div class="demo" style="margin-top:10%; width:65%; float:right;">
		<p>
			<span>很</span><span>抱</span><span>歉</span><span>，</span><span>您</span><span>没</span><span>有</span><span>权</span><span>限</span><span>查</span><span>看</span><span>此</span><span>页</span><span>面</span><span>。</span>
		</p>
		<p>您可以：<a href="javascript:history.go(-1);"><font color="white">返回上一页</font></a>，或者<a href="<%=request.getContextPath()%>/"><font color="white">去首页</font></a>，或者<a href="javascript:void(0);" onclick="help();"><font color="white">联系管理员</font></a>。</p>
	</div>
	
	<div id="cloud" class="png"></div>
</body>
</html>