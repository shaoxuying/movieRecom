<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://shiro.apache.org/tags" prefix="shiro"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>评分记录</title>



<!-- bootstrap样式 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/js/bootstrap/css/bootstrap.css">

<!-- movieRecoms样式 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">

<!-- ace styles -->

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ace-rtl.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/ace-skins.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css" />

<!-- jquery基本文件-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<!--bootstrap的js-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
<script type="text/javascript">

/*删除确认*/

function del(ratingId,btnObj) {	

layer.confirm('确定删除该条评分记录？', {
	btn: ['删除','取消'],
	title: '确认删除',
	shadeClose: true 
}, function(){
	var url='<%=request.getContextPath()%>/movie/deleteRating.action';
	$.post(url,{'ratingId':ratingId},function(){
		
			$(btnObj).parent().remove();
			layer.msg("删除成功");
		
		
	});
}, function(){
});
}

</script>
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
                    <li >
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
		<div class="page-content" style=" margin-top: 80px;">
			<div class="page-header">
				<h1>
					您的评分记录：
					<div class="btn-group">
					<a href="/movieRecom/movie/queryRatingByUserIdRankTime.action" class="btn btn-info">按时间排序</a>
					<a href="/movieRecom/movie/queryRatingByUserIdRankRate.action" class="btn">按评分排序</a>
					</div>
								
				</h1>
				
			</div><!-- /.page-header -->

			<!--推荐内容板块-->
			<div class="row">
				<c:forEach items="${ratingListWithMovieInfo}" var="ratingInfo">	
					<div class="rec-movie-carousel-item " movie-id="${ratingInfo.movieId }">
						<div class="rec-movie-poster">
							<a target="_blank" href="/movieRecom/movie/getMovieDetailsByMovieId.action?movie_id=${ratingInfo.movieId}" title="${ratingInfo.movieTitle}" alog-action="o-rec-film"><img src="<%=request.getContextPath() %>/images/${ratingInfo.moviePoster}"></a>
						</div>
						<div class="rec-movie-caption">
						    <p><a target="_blank" href="/movieRecom/movie/getMovieDetailsByMovieId.action?movie_id=${ratingInfo.movieId}" title="${ratingInfo.movieTitle}" alog-action="o-rec-film">${ratingInfo.movieTitle}</a></p>
						</div>
						<span class="badge user-rating-badge">评分:${ratingInfo.rating}</span>
						<a href="javascript:void(0)" onclick="del(${ratingInfo.ratingId},this)" class="btn btn-user-rating">删除</a>
					</div>
				</c:forEach>
			</div>	<!-- recomModule end -->
		    		
		    <hr>
			<hr>
			<!-- 网页底部 -->
			<jsp:include page="/pages/include/Footer.jsp"></jsp:include>		
		</div><!-- /.page-content -->
		
	</div><!-- /.container -->
				
						<!-- 遍历输出数据 -->
						
						 <c:forEach items="${ratingListWithMovieInfo}" var="ratingInfo">									
		                <tr>
		                 	<td>${ratingInfo.movieId}</td>
			               <td>${ratingInfo.movieTitle}</td>
			               <td>${ratingInfo.moviePoster}</td>
			               <td>${ratingInfo.rating}</td>
			               <td>${ratingInfo.ratingId}</td>
			               <td>hello</td>               
		                
		                  
		                </tr>		                
		                </c:forEach>		                              
</body>

</html>