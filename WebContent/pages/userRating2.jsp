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

<!-- jquery基本文件-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
<!--bootstrap的js-->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/js/bootstrap.js"></script>
<!-- layer -->
<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>

</head>

<body>
					<h3 class="page-header">
					您的评分记录
				</h3>

		    	<table  class="table table-striped table-bordered table-condensed table-hover">
		    		<thead>
					<tr>
						<th>
							电影编号
						</th>
						<th>
							标题
						</th>
						 <th>
							时长
						</th>
						<th>
							年份
						</th>
						<th>
							IMDB评分
						</th>
						<th>
							预测你的评分
						</th>					
						 					</tr>	
					</thead>	
					<tbody>	
						
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
		             </tbody>
		    	</table>
	<!-- 网页底部 -->
	<jsp:include page="/pages/include/Footer.jsp"></jsp:include>
</body>

</html>