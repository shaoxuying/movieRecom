package movieRecom.pojo;

import java.sql.Timestamp;

public class Rating {
	private Integer id;
	private String userId;
	private String movieId;
	private Integer rating;
	private Timestamp ratingDate;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMovieId() {
		return movieId;
	}
	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}
	public Integer getRating() {
		return rating;
	}
	public void setRating(Integer rating) {
		this.rating = rating;
	}
	
	public Timestamp getRatingDate() {
		return ratingDate;
	}
	public void setRatingDate(Timestamp ratingDate) {
		this.ratingDate = ratingDate;
	}
	@Override
	public String toString() {
		return "Rating [id=" + id + ", userId=" + userId + ", movieId=" + movieId + ", rating=" + rating
				+ ", ratingDate=" + ratingDate + "]";
	}
	public Rating() {
		super();
	}
	public Rating(Integer id, String userId, String movieId, Integer rating, Timestamp ratingDate) {
		super();
		this.id = id;
		this.userId = userId;
		this.movieId = movieId;
		this.rating = rating;
		this.ratingDate = ratingDate;
	}
	public Rating(String userId, String movieId, Integer rating, Timestamp ratingDate) {
		super();
		this.userId = userId;
		this.movieId = movieId;
		this.rating = rating;
		this.ratingDate = ratingDate;
	}
	
	

}
