package movieRecom.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.opensymphony.xwork2.ModelDriven;

import movieRecom.pojo.MovieDetails;
import movieRecom.pojo.Rating;
import movieRecom.pojo.User;
import movieRecom.service.MovieDetailsService;
import movieRecom.service.RatingService;
import movieRecom.service.UserService;

@Controller
@Scope("prototype")
@ParentPackage("struts-default")
@Namespace("/movie")
public class MovieAction extends BaseAction implements ModelDriven<MovieDetails>{

	private MovieDetails movieDetails=new MovieDetails();
	private String userId;
	private Rating rating=new Rating();
	private String rateMovieId;
	private String rateNum;
	private Integer ratingId=null;
	
	

	public Integer getRatingId() {
		return ratingId;
	}

	public void setRatingId(Integer ratingId) {
		this.ratingId = ratingId;
	}

	public String getRateMovieId() {
		return rateMovieId;
	}

	public void setRateMovieId(String rateMovieId) {
		this.rateMovieId = rateMovieId;
	}

	public String getRateNum() {
		return rateNum;
	}

	public void setRateNum(String rateNum) {
		this.rateNum = rateNum;
	}

	public Rating getRating() {
		return rating;
	}

	public void setRating(Rating rating) {
		this.rating = rating;
	}


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Autowired
	//private movieRecom.service.MovieService movieService;
	private MovieDetailsService movieDetailsService;
	@Autowired
	private UserService userService;
	@Autowired
	private RatingService ratingService;
	
	@Action("queryByUserId"	)
	public String queryByUserId() throws Exception {
		
		List<Map>movieList=new ArrayList<Map>();
		Gson gson =new Gson();
		HttpSession session = request.getSession();
		String currUserId=(String) session.getAttribute("currUserId");
		User currUser= userService.checkUserId(currUserId);

		System.out.println("currUser"+currUser);
		System.out.println("userId"+userId);
		
		//String itemScores =movieService.getMovieRecom(userId);
		String itemScores =movieDetailsService.getMovieRecom(userId);
		
		System.out.println("itemScores"+itemScores);
//		request.setAttribute("itemScores", itemScores);

		//创建一个JsonParser
		JsonParser parser = new JsonParser();

		//通过JsonParser对象可以把json格式的字符串解析成一个JsonElement对象
		JsonElement el = parser.parse(itemScores);
		
		//把JsonElement对象转换成JsonObject
		JsonObject jsonObj = null;
		if(el.isJsonObject()){
		jsonObj = el.getAsJsonObject();  
		}
//		System.out.println(jsonObj);
		//把JsonElement对象转换成JsonArray
		JsonArray jsonArray = null;
		if(jsonObj.get("itemScores").isJsonArray()){
		jsonArray = jsonObj.get("itemScores").getAsJsonArray();
		}

		//遍历JsonArray对象		
		if(jsonArray!=null){
			int count=0;
			ItemScore itemScore = null;
			Iterator it = jsonArray.iterator();
			while(it.hasNext()){
				JsonElement e = (JsonElement)it.next();
				//JsonElement转换为JavaBean对象
				itemScore = gson.fromJson(e, ItemScore.class);
	//			System.out.println(itemScore.getItem()+" === "+itemScore.getScore());
				/*movie=movieService.getMovieByMovieId(itemScore.getItem());
				Map<String,Object> map =new HashMap<String,Object>();
				if(movie!=null){
					
				if (count<10 && movie.getMovie_poster()!=null && (!movie.getMovie_poster().equals(""))){
					System.out.println(movie);
					map.put("movie", movie);
					map.put("score", itemScore.getScore());
					movieList.add(map);
					count++;
				}}*/
				
				Map<String, String> map = movieDetailsService.getMovieByMovieId(itemScore.getItem());
				if(map!=null){
					map.put("score", itemScore.getScore());
					movieList.add(map);
				}
			}
		}
		String movieListJson=gson.toJson(movieList);
		System.out.println(movieListJson);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(movieListJson);
	
		return null;		
		
	}
	
	
	@Action(value = "queryByCurruserId", 
			results = { @Result(name = "success", location = "/pages/movieRecoms.jsp", type = "dispatcher")	})
	public String queryByCurruserId() throws Exception {
		
		/*List<Expatriate> list = service.queryByPager(pager);
		request.setAttribute("list", list);
		request.setAttribute("pager", pager);*/
		List<Map>movieList=new ArrayList<Map>();
		Gson gson =new Gson();
		HttpSession session = request.getSession();
		String currUserId=(String) session.getAttribute("currUserId");
		User currUser= userService.checkUserId(currUserId);

		System.out.println("currUser"+currUser);
		
		String itemScores=movieDetailsService.getMovieRecom(currUserId);
		
		
		System.out.println("itemScores"+itemScores);
//		request.setAttribute("itemScores", itemScores);

		
		
		//创建一个JsonParser
		JsonParser parser = new JsonParser();

		//通过JsonParser对象可以把json格式的字符串解析成一个JsonElement对象
		JsonElement el = parser.parse(itemScores);
		
		//把JsonElement对象转换成JsonObject
		JsonObject jsonObj = null;
		if(el.isJsonObject()){
		jsonObj = el.getAsJsonObject();  
		}
//		System.out.println(jsonObj);
		//把JsonElement对象转换成JsonArray
		JsonArray jsonArray = null;
		if(jsonObj.get("itemScores").isJsonArray()){
		jsonArray = jsonObj.get("itemScores").getAsJsonArray();
		}

		//遍历JsonArray对象		
		if(jsonArray!=null){
			int count=0;
			ItemScore itemScore = null;
			Iterator it = jsonArray.iterator();
			while(it.hasNext()){
				JsonElement e = (JsonElement)it.next();
				//JsonElement转换为JavaBean对象
				itemScore = gson.fromJson(e, ItemScore.class);
	//			System.out.println(itemScore.getItem()+" === "+itemScore.getScore());
				Map<String, String> map = movieDetailsService.getMovieByMovieId(itemScore.getItem());
				if(map!=null){
					map.put("score", itemScore.getScore());
					movieList.add(map);
				}
			}
		}
		request.setAttribute("movieList", movieList);
		
		
		return "success";
		
	}
	
	@Action("insertRating")
	public void insertRating(){
		int ratingNum=Integer.parseInt(rateNum);
		HttpSession session = request.getSession();
		String currUserId=(String) session.getAttribute("currUserId");
		rating.setUserId(currUserId);
		rating.setMovieId(rateMovieId);
		rating.setRating(ratingNum);
		rating.setRatingDate(new Timestamp(new Date().getTime()));
		System.out.println(rating);
		ratingService.insert(rating);
		
		
	}
	
	@Action("deleteRating")
	public void deleteRating(){
		
		ratingService.delete(ratingId);
		
	}
	
	@Action(value="queryRatingByUserIdRankTime", 
			results = { @Result(name = "success", location = "/pages/userRatingRankTime.jsp", type = "dispatcher")	})
	public String queryRatingByUserIdRankTime(){
		
		HttpSession session = request.getSession();
		String currUserId=(String) session.getAttribute("currUserId");
		List<Rating> ratingList=ratingService.queryRatingByUserIdRankTime(currUserId);
		System.out.println("currUserId"+currUserId);
		System.out.println("ratingList:"+ratingList);
		List<Map> ratingListWithMovieInfo =new ArrayList<Map>();
		for(Rating rating:ratingList){
			Map<String, String> map=new HashMap<String,String>();
			Map<String,String> movieMap=movieDetailsService.getMovieByMovieId(rating.getMovieId());
			map.put("rating", rating.getRating().toString());
			map.put("ratingId", rating.getId().toString());
			map.put("movieId", rating.getMovieId());
			if(movieMap!=null){
				map.put("moviePoster", movieMap.get("movie_poster"));
				map.put("movieTitle", movieMap.get("movie_title"));
			}
			ratingListWithMovieInfo.add(map);
		}
		
		System.out.println(ratingListWithMovieInfo);
		request.setAttribute("ratingListWithMovieInfo", ratingListWithMovieInfo);		
		
		return "success";
		
	}
	
	@Action(value="queryRatingByUserIdRankRate", 
			results = { @Result(name = "success", location = "/pages/userRatingRankRate.jsp", type = "dispatcher")	})
	public String queryRatingByUserIdRankRate(){
		
		HttpSession session = request.getSession();
		String currUserId=(String) session.getAttribute("currUserId");
		List<Rating> ratingList=ratingService.queryRatingByUserIdRankRate(currUserId);
		System.out.println("currUserId"+currUserId);
		System.out.println("ratingList:"+ratingList);
		List<Map> ratingListWithMovieInfo =new ArrayList<Map>();
		for(Rating rating:ratingList){
			Map<String, String> map=new HashMap<String,String>();
			Map<String,String> movieMap=movieDetailsService.getMovieByMovieId(rating.getMovieId());
			map.put("rating", rating.getRating().toString());
			map.put("ratingId", rating.getId().toString());
			map.put("movieId", rating.getMovieId());
			if(movieMap!=null){
				map.put("moviePoster", movieMap.get("movie_poster"));
				map.put("movieTitle", movieMap.get("movie_title"));
			}
			ratingListWithMovieInfo.add(map);
		}
		
		System.out.println(ratingListWithMovieInfo);
		request.setAttribute("ratingListWithMovieInfo", ratingListWithMovieInfo);		
		
		return "success";
		
	}
	
	@Action(value = "toRatingPage", 
			results = { @Result(name = "success", location = "/pages/movieRating.jsp", type = "dispatcher")	})
	public String toRatingPage(){
		List<Map>movieList=new ArrayList<Map>();
		Random ra=new Random();
		for (int i=1;i<16;){
			Map<String, String> map = movieDetailsService.getMovieByMovieId(String.valueOf(ra.nextInt(18000)));
			if(map!=null){	
				movieList.add(map);
				i++;
			}				
		}
		request.setAttribute("movieList", movieList);
		return "success";
	}
	
	@Action(value = "getMovieDetailsByMovieId", 
			results = { @Result(name = "success", location = "/pages/movieDetails.jsp", type = "dispatcher")	})
	public String getMovieDetailsByMovieId(){
//		System.out.println("movie Details:");
//		System.out.println(movieDetailsService.getMovieDetailsByMovieId(movieDetails.getMovie_id()));
		request.setAttribute("movieDetails", movieDetailsService.getMovieDetailsByMovieId(movieDetails.getMovie_id()));
		return "success";
	}
	
	
	@Override
	public MovieDetails getModel() {
		// TODO Auto-generated method stub
		return movieDetails;
	}
	
	class ItemScore{
		private String item;
		private String score;
		public String getItem() {
			return item;
		}
		public void setItem(String item) {
			this.item = item;
		}
		public String getScore() {
			return score;
		}
		public void setScore(String score) {
			this.score = score;
		}
		public ItemScore(String item, String score) {
			super();
			this.item = item;
			this.score = score;
		}
		public ItemScore() {
			super();
		}
		@Override
		public String toString() {
			return "itemScore [item=" + item + ", score=" + score + "]";
		}
		
	}

}


