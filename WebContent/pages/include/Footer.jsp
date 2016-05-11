<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- 这个是为了获取本web应用的路径的 -->
<script type="text/javascript">
function getRootPath() {
	var strFullPath = window.document.location.href;
	var strPath = window.document.location.pathname;
	var pos = strFullPath.indexOf(strPath);
	var prePath = strFullPath.substring(0, pos);
	var postPath = strPath.substring(0, strPath.substr(1).indexOf(' / ')+1); 
	return(prePath+postPath); 
} 
var webpath=getRootPath(); //webpath就是目录路径变量
var project_name = "${pageContext.request.contextPath}";

</script>

<style type="text/css">
body {
	
}

/*网页底部样式*/
.main_footer {
	background:#393939;	
	color:white;
}
</style>

<!-- 下面这两个是回到顶部的GoUP插件的js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/GoUP/goup-main.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/GoUP/jquery.goup.min.js"></script>

<!-- 网页底部 -->
	
<div id="mainFooter">
	<div class="span12 main_footer">
		<div class="row show-grid" style="margin-right:0px; margin-left:0px; ">
			
			<div class="container">
		    	<table border="0" width="100%">
		    	    <tbody>
			    		
			    	    <tr>
			    	      	<td align="left" height="24">电影推荐系统——发现、记录、分享属于你的电影——为您推荐属于你自己口味的电影</td>
			  	      	</tr>
			    	    <tr>
			    	      	<td align="left" height="24">联系我们：XXXXXXXx@xxxx.com</td>
			  	      	</tr>
			    	    <tr>
			    	      	<td align="left" height="24">Copyright 2009-2014  all rights reserved 网站备案号 :******8</td>
			  	      	</tr>
		  	   		</tbody>
				</table>  
			</div>
		</div>
   </div>       
</div>

<!--GoUP DIV-->
<div id="goup"></div>
	
