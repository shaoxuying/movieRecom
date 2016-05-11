<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>电影详情</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/imdbMovieDetails.css" />
</head>
<body>
<div id="root" class="redesign">
<div id="title-overview-widget" class="heroic-overview">
<div class="vital">
<div class="title_block">
    <div class="title_bar_wrapper">
        <div class="ratings_wrapper">
            <div class="imdbRating" itemtype="http://schema.org/AggregateRating" itemscope="" itemprop="aggregateRating">
                <div class="ratingValue">
                    <strong title="imdb_rate"><span itemprop="ratingValue">RATE:${movieDetails.movie_imdb_rate }</span></strong>
                </div>            
            </div>            
        </div>
        <div class="titleBar">           
            <div class="title_wrapper">
                <h1 itemprop="name" class="">${movieDetails.movie_title }</h1>
                <div class="subtext">
                    <time itemprop="duration" datetime="PT44M">
                        ${movieDetails.movie_long }
                    </time>
                    <span class="ghost">|</span>
                    <c:forEach items="${movieDetails.movie_genres }" var="movie_genre">
	                    <span class="itemprop" itemprop="genre">${movie_genre }</span>, 
                    </c:forEach>                   
                </div>
            </div>
        </div>
    </div>
</div><!-- title-block  end -->
</div><!-- vital  end -->
<div class="minPosterWithPlotSummaryHeight" style="margin-left: 50px; margin-right: 50px;">
    <div class="poster">
        <a href="/movieRecom/movie/getMovieDetailsByMovieId.action?movie_id=${movieDetails.movie_id }"> <img style=" padding-top: 20px;" alt="${movieDetails.movie_title }" title="${movieDetails.movie_title }"
            src="/movieRecom/images/${movieDetails.movie_poster }" itemprop="image" />
        </a>    
    </div>
    <div class="plot_summary_wrapper">
        <script>
            if ('csm' in window) {
                 csm.measure('csm_TitlePlotAndCreditSummaryWidget_started');
            }
        </script>
        <div class="plot_summary minPlotHeightWithPoster">
            <div class="summary_text" itemprop="description">
                   ${movieDetails.movie_summary }
            </div>
        
            <div class="credit_summary_item">
                <h4 class="inline">Director:</h4>
                <c:forEach items="${movieDetails.movie_director }" var="movie_director">
                <span itemprop="director" itemscope itemtype="http://schema.org/Person">
                    ${movie_director }
                </span>
                </c:forEach>
            </div>
            <div class="credit_summary_item">
                <h4 class="inline">Writer:</h4>
                 	<c:forEach items="${movieDetails.movie_writers }" var="movie_writer">
		                <span itemprop="creator" itemscope itemtype="http://schema.org/Person">
		                   ${movie_writer },
		                </span>
                    </c:forEach>                   
            </div>
            <div class="credit_summary_item">
                <h4 class="inline">Stars:</h4>
                <c:forEach items="${movieDetails.movie_actors }" var="movie_actor">
	                <span itemprop="actors" itemscope itemtype="http://schema.org/Person">
	                    ${movie_actor },
	                </span>
                </c:forEach>         
            </div>        
        </div>
    </div>
</div><!-- minPosterWithPlotSummaryHeight  end -->
</div><!-- title-overview-widget   end -->
<div class = "article" id="titleStoryLine" style="margin-left: 40px; margin-right: 50px;">
    <h2>Storyline</h2>
        <div class="inline canwrap" itemprop="description">
            <p>${movieDetails.movie_storyline } </p>
        </div>
        <div class="see-more inline canwrap" itemprop="keywords">
            <h4 class="inline">Plot Keywords:</h4>
            <c:forEach items="${movieDetails.movie_keywords }" var="movie_keyword">
	            ${movie_keyword }
	            <span>|</span>
            </c:forEach>
        </div>      
        <hr />
        <div class="see-more inline canwrap" itemprop="genre">
            <h4 class="inline">Genres:</h4>
           	<c:forEach items="${movieDetails.movie_genres }" var="movie_genre">
	        	<span class="itemprop" itemprop="genre">${movie_genre }</span>, 
           	</c:forEach> 
        </div>
</div>

</div>

</body>
</html>