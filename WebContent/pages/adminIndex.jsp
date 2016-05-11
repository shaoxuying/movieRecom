<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电影推荐系统展示平台</title>


<!-- bootstrap样式 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css" />

<!-- page specific plugin styles -->

<!-- fonts -->
<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

<!-- movieRecoms样式 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">

<!-- 模块入口鼠标悬停 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/module/demo.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/module/normalize.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/module/set.css">



<!-- ace styles -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ace.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ace-skins.min.css" />

<!-- jquery基本文件-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<!--bootstrap的js-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.js"></script>

<!-- ace settings handler -->
<script src="<%=request.getContextPath()%>/js/ace-extra.min.js"></script>
<script type="text/javascript">

function queryByUserId(userId){
	var url='<%=request.getContextPath()%>/movie/queryByUserId.action';
	$.post(url,{'userId':userId},function(data){
			var movieListJson=eval(data);
			$("#dd-list").append("<li class=\"dd-item dd2-item\" style=\"margin-top:20px;padding-top:40px;\"data-id=\""+userId+"\"><div class=\"dd-handle dd2-handle\"><i class=\"icon-user\"></i><span >"+userId+"</span></div><div class=\"action-buttons\"><a class=\"red\" href=\"javascript:void(0)\"onclick=\"deleteItem(this);\"><i class=\"icon-trash bigger-130\"></i></a></div><div class=\"carousel slide\" id=\""+userId+"\"></div></li>");
			var ol0=document.createElement("ol");
			ol0.setAttribute("class","carousel-indicators");
			var li0=document.createElement("li");
			li0.setAttribute("data-target","#"+userId);
			li0.setAttribute("data-slide-to","0");
			li0.setAttribute("class","active");
			
			var li1=document.createElement("li");
			li1.setAttribute("data-target","#"+userId);
			li1.setAttribute("data-slide-to","1");
			
			/* var li2=document.createElement("li");
			li2.setAttribute("data-target","#"+userId);
			li2.setAttribute("data-slide-to","2"); */
			
			ol0.appendChild(li0);
			ol0.appendChild(li1);
			/* ol0.appendChild(li2); */

			document.getElementById(userId).appendChild(ol0);
			
			var div00=document.createElement("div");
			div00.setAttribute("class","carousel-inner");
			div00.setAttribute("style","padding-left:50px");
			var div0=document.createElement("div");
			div0.setAttribute("class","item active"); 
			var div1=document.createElement("div");
			div1.setAttribute("class","item"); 
			/* var div2=document.createElement("div");
			div2.setAttribute("class","item");  */
			
			
			for(var i=0;i<movieListJson.length;i++){
				var div =document.createElement("div");
				div.setAttribute("class","movie-index-carousel-item");
				div.setAttribute("id",movieListJson[i].movie_id);
				div.innerHTML="<div class=\"rec-movie-poster\"> <a target=\"_blank\" href=\"/movieRecom/movie/getMovieDetailsByMovieId.action?movie_id="+movieListJson[i].movie_id+"\" title=\""+movieListJson[i].movie_title+"\" alog-action=\"o-rec-film\"><img src=\"/movieRecom/images/"+movieListJson[i].movie_poster+"\"></a></div>";
				/* div1.appendChild(div); */
				if(i<8){
					div0.appendChild(div);
				}else if(i<16){
					div1.appendChild(div);
				}
				
			}
			div00.appendChild(div0);
			div00.appendChild(div1);
			/* div00.appendChild(div2); */
			document.getElementById(userId).appendChild(div00);
			var a1=document.createElement("a");
			a1.setAttribute("class","left carousel-control");
			a1.setAttribute("href","#"+userId);
			a1.setAttribute("data-slide","prev");
			var a2=document.createElement("a");
			a2.setAttribute("class","right carousel-control");
			a2.setAttribute("href","#"+userId);
			a2.setAttribute("data-slide","next");

			document.getElementById(userId).appendChild(a1);
			document.getElementById(userId).appendChild(a2);
			
			
			
			
	});
}

/*删除确认*/

function deleteItem(btnObj) {	

	$(btnObj).parent().parent().remove();
}

</script>
</head>

<body>

	<div class="navbar navbar-default" id="navbar">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							电影推荐展示
						</small>
					</a><!-- /.brand -->
				</div><!-- /.navbar-header -->

			</div><!-- /.container -->
	</div>
			<div class="main-container" id="main-container">
			<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

			<div class="main-container-inner">
				<a class="menu-toggler" id="menu-toggler" href="#">
					<span class="menu-text"></span>
				</a>

				<div class="sidebar" id="sidebar">
					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

					<ul class="nav nav-list">
						<li >
							<a href="/movieRecom/user/queryUserId.action?startId=${nextStartId }" >
								<i class="icon-user"></i>
								<span class="menu-text">换一批</span>
							</a>
						</li>
					<c:forEach items="${userIdList }" var="userId">
						<li >
							<a href="javascript:void(0)"
								onclick="queryByUserId(${userId});">
								<i class="icon-user"></i>
								<span class="menu-text"> ${userId } </span>
							</a>
						</li>
			 		</c:forEach>
												
					</ul><!-- /.nav-list -->

					<div class="sidebar-collapse" id="sidebar-collapse">
						<i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
					</div>

					<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
				</div>

				<div class="main-content">
					
					<div class="page-content">
						<div class="page-header">
							<h1>
								电影推荐列表
								<small>
									<i class="icon-double-angle-right"></i>
									列表可拖动
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
								<!-- PAGE CONTENT BEGINS -->
								<div class="col-lg-12">
								<div class="dd dd-draghandle">
									<ol class="dd-list" id="dd-list">
										
									</ol>
								</div>
								</div><!-- PAGE CONTENT ENDS -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div><!-- /.main-content -->

				<div class="ace-settings-container" id="ace-settings-container">
					<div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
						<i class="icon-cog bigger-150"></i>
					</div>

					<div class="ace-settings-box" id="ace-settings-box">
						<div>
							<div class="pull-left">
								<select id="skin-colorpicker" class="hide">
									<option data-skin="default" value="#438EB9">#438EB9</option>
									<option data-skin="skin-1" value="#222A2D">#222A2D</option>
									<option data-skin="skin-2" value="#C6487E">#C6487E</option>
									<option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
								</select>
							</div>
							<span>&nbsp; 选择皮肤</span>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar" />
							<label class="lbl" for="ace-settings-navbar">固定导航条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar" />
							<label class="lbl" for="ace-settings-sidebar">固定滑动条</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl" />
							<label class="lbl" for="ace-settings-rtl">切换到左边</label>
						</div>

						<div>
							<input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container" />
							<label class="lbl" for="ace-settings-add-container">
								切换窄屏
							</label>
						</div>
					</div>
				</div><!-- /#ace-settings-container -->
			</div><!-- /.main-container-inner -->

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->
		

		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='<%=request.getContextPath()%>/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="<%=request.getContextPath()%>/js/typeahead-bs2.min.js"></script>

		<!-- page specific plugin scripts -->

		<script src="<%=request.getContextPath()%>/js/jquery.nestable.min.js"></script>

		<!-- ace scripts -->

		<script src="<%=request.getContextPath()%>/js/ace-elements.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

		<script type="text/javascript">
			jQuery(function($){
			
				$('.dd').nestable();
			
				$('.dd-handle a').on('mousedown', function(e){
					e.stopPropagation();
				});
				
				$('[data-rel="tooltip"]').tooltip();
			
			});
		</script>
	<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>

</html>