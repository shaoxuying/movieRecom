<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电影推荐系统</title>


<!-- bootstrap样式 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.css">

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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css" />

<!-- star styles -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/star.css" />

<!-- jquery基本文件-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<!--bootstrap的js-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.js"></script>
<!-- layer -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>

<!-- ace settings handler -->
<script src="<%=request.getContextPath()%>/js/ace-extra.min.js"></script>
<!-- star.js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/star.js"></script>
</head>
<body>
	<!--导航条-->
	
	<div class="navbar navbar-fixed-top navbar-inverse " role="navigation">
		
		<div class="container" >
			<div class="navbar-header  pull-left">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myCollapse1">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a href="#" class="navbar-brand"> 
					<small>
						<i class="icon-leaf"></i>
						电影推荐系统
					</small>
				</a>
			</div>

			<div id="myCollapse1" class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li >
                        <a href="/movieRecom/movie/queryByCurruserId.action" title="推荐给你">
                            <i class="icon-thumbs-up "></i>&nbsp;推荐给你
                        </a>
                    </li>
                    <li class="active">
                        <a href="/movieRecom/movie/toRatingPage.action" title="评分"><i class="icon-star icon-white"></i>&nbsp;评分</a>
                    </li>			

					<li>						
						<c:if test="${currUserId != null }">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								${currUserId }
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="/movieRecom/movie/queryRatingByUserIdRankTime.action"><i class="icon-user"></i>评分记录</a></li>
								<li><a href="<%=request.getContextPath() %>/logout"><i class="icon-off"></i>退出登录</a></li>
							</ul>				
						</c:if>
					</li>
				</ul>

			</div>
		</div>
	</div>

	<div class="container" >
					<div class="page-content" style=" margin-top: 50px;">
						<div class="page-header">
							<h1>
								请为您看过的电影进行评分
								
								<a href="/movieRecom/movie/toRatingPage.action" >								
								<button style="font-size:10px;">换一批</button>
								</a>
							</h1>
							
						</div><!-- /.page-header -->

				<!--推荐内容板块-->
				<div class="row">
					<c:forEach items="${movieList}" var="map">	
						<div class="rec-movie-carousel-item " movie-id="${map.movie_id }">
						    <div class="rec-movie-poster">
						        <a target="_blank" href="/movieRecom/movie/getMovieDetailsByMovieId.action?movie_id=${map.movie_id }" title="${map.movie_title}" alog-action="o-rec-film"><img src="<%=request.getContextPath() %>/images/${map.movie_poster}"></a>
						    </div>
						    <div class="rec-movie-caption">
						        <p><a target="_blank" href="/movieRecom/movie/getMovieDetailsByMovieId.action?movie_id=${map.movie_id }" title="${map.movie_title}" alog-action="o-rec-film">${map.movie_title}</a></p>
						    </div>
					    
					       <div class="rec-movie-rating" >
					        <input hidden id="mr_${map.movie_id }" name="mr_${map.movie_id }" value="0" type="number">
					         <span class="Select"> 
					        <a onMouseOver="javascript:setProfix('${map.movie_id }_star_');showStars(1,'mr_${map.movie.movie_id }');"
					         onMouseOut="javascript:setProfix('${map.movie_id }_star_');clearStars('mr_${map.movie_id }');" 
					         href="javascript:setProfix('${map.movie_id }_star_');setStars(1,'mr_${map.movie_id }');rateMovie(${map.movie_id },1);">
					         <img id="${map.movie_id }_star_1" title="差(1)" src="/movieRecom/images/star/icon_star_1.gif"></a>
					         
					          <a onMouseOver="javascript:setProfix('${map.movie_id }_star_');showStars(2,'mr_${map.movie_id }');"
					          onMouseOut="javascript:setProfix('${map.movie_id }_star_');clearStars('mr_${map.movie_id }');"
					           href="javascript:setProfix('${map.movie_id }_star_');setStars(2,'mr_${map.movie_id }');rateMovie(${map.movie_id },2);">
					           <img id="${map.movie_id }_star_2" title="一般(2)" src="/movieRecom/images/star/icon_star_1.gif"></a>
					           
					           <a onMouseOver="javascript:setProfix('${map.movie_id }_star_');showStars(3,'mr_${map.movie_id }');" 
					           onMouseOut="javascript:setProfix('${map.movie_id }_star_');clearStars('mr_${map.movie_id }');"
					            href="javascript:setProfix('${map.movie_id }_star_');setStars(3,'mr_${map.movie_id }');rateMovie(${map.movie_id },3);">
					            <img id="${map.movie_id }_star_3" title="好(3)" src="/movieRecom/images/star/icon_star_1.gif"></a>
					            
					            <a onMouseOver="javascript:setProfix('${map.movie_id }_star_');showStars(4,'mr_${map.movie_id }');" 
					            onMouseOut="javascript:setProfix('${map.movie_id }_star_');clearStars('mr_${map.movie_id }');" 
					            href="javascript:setProfix('${map.movie_id }_star_');setStars(4,'mr_${map.movie_id }');rateMovie(${map.movie_id },4);">
					            <img id="${map.movie_id }_star_4" title="很好(4)" src="/movieRecom/images/star/icon_star_1.gif"></a>
					            
					            <a onMouseOver="javascript:setProfix('${map.movie_id }_star_');showStars(5,'mr_${map.movie_id }');"
					             onMouseOut="javascript:setProfix('${map.movie_id }_star_');clearStars('mr_${map.movie_id }');" 
					             href="javascript:setProfix('${map.movie_id }_star_');setStars(5,'mr_${map.movie_id }');rateMovie(${map.movie_id },5);">
					             <img id="${map.movie_id }_star_5" title="非常好(5)" src="/movieRecom/images/star/icon_star_1.gif"></a></span>  
					         
					    	</div>
					    	</div>
					    </c:forEach>
			</div>	<!-- recomModule end -->
		    		
		    <hr>
		    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="icon-double-angle-up icon-only bigger-110"></i>
			</a>
		<hr>
		<!-- 网页底部 -->
	<jsp:include page="/pages/include/Footer.jsp"></jsp:include>		
	</div><!-- /.page-content -->
		
	</div><!-- /.container -->

	

	
</body>
</html>