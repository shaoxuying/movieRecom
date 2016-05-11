package movieRecom.pojo;

import java.util.List;

public class MovieDetails {
	private int id;
	private List<String> movie_writers;
	private List<String> movie_actors;
	private String movie_storyline;
	private String movie_id;
	private List<String> movie_keywords;
	private String movie_content_rate;
	private List<String> movie_director;
	private String movie_title;
	private String movie_summary;
	private String movie_year;
	private List<String> movie_genres;
	private String movie_poster;
	private String movie_imdb_rate;
	private String movie_long;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public List<String> getMovie_writers() {
		return movie_writers;
	}
	public void setMovie_writers(List<String> movie_writers) {
		this.movie_writers = movie_writers;
	}
	public List<String> getMovie_actors() {
		return movie_actors;
	}
	public void setMovie_actors(List<String> movie_actors) {
		this.movie_actors = movie_actors;
	}
	public String getMovie_storyline() {
		return movie_storyline;
	}
	public void setMovie_storyline(String movie_storyline) {
		this.movie_storyline = movie_storyline;
	}
	public String getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(String movie_id) {
		this.movie_id = movie_id;
	}
	public List<String> getMovie_keywords() {
		return movie_keywords;
	}
	public void setMovie_keywords(List<String> movie_keywords) {
		this.movie_keywords = movie_keywords;
	}
	public String getMovie_content_rate() {
		return movie_content_rate;
	}
	public void setMovie_content_rate(String movie_content_rate) {
		this.movie_content_rate = movie_content_rate;
	}
	public List<String> getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(List<String> movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_title() {
		return movie_title;
	}
	public void setMovie_title(String movie_title) {
		this.movie_title = movie_title;
	}
	public String getMovie_summary() {
		return movie_summary;
	}
	public void setMovie_summary(String movie_summary) {
		this.movie_summary = movie_summary;
	}
	public String getMovie_year() {
		return movie_year;
	}
	public void setMovie_year(String movie_year) {
		this.movie_year = movie_year;
	}
	public List<String> getMovie_genres() {
		return movie_genres;
	}
	public void setMovie_genres(List<String> movie_genres) {
		this.movie_genres = movie_genres;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
	public String getMovie_imdb_rate() {
		return movie_imdb_rate;
	}
	public void setMovie_imdb_rate(String movie_imdb_rate) {
		this.movie_imdb_rate = movie_imdb_rate;
	}
	public String getMovie_long() {
		return movie_long;
	}
	public void setMovie_long(String movie_long) {
		this.movie_long = movie_long;
	}
	@Override
	public String toString() {
		return "MovieDetails [id=" + id + ", movie_writers=" + movie_writers + ", movie_actors=" + movie_actors
				+ ", movie_storyline=" + movie_storyline + ", movie_id=" + movie_id + ", movie_keywords="
				+ movie_keywords + ", movie_content_rate=" + movie_content_rate + ", movie_director=" + movie_director
				+ ", movie_title=" + movie_title + ", movie_summary=" + movie_summary + ", movie_year=" + movie_year
				+ ", movie_genres=" + movie_genres + ", movie_poster=" + movie_poster + ", movie_imdb_rate="
				+ movie_imdb_rate + ", movie_long=" + movie_long + "]";
	}
	public MovieDetails() {
		super();
	}
	public MovieDetails(List<String> movie_writers, List<String> movie_actors, String movie_storyline, String movie_id,
			List<String> movie_keywords, String movie_content_rate, List<String> movie_director, String movie_title,
			String movie_summary, String movie_year, List<String> movie_genres, String movie_poster,
			String movie_imdb_rate, String movie_long) {
		super();
		this.movie_writers = movie_writers;
		this.movie_actors = movie_actors;
		this.movie_storyline = movie_storyline;
		this.movie_id = movie_id;
		this.movie_keywords = movie_keywords;
		this.movie_content_rate = movie_content_rate;
		this.movie_director = movie_director;
		this.movie_title = movie_title;
		this.movie_summary = movie_summary;
		this.movie_year = movie_year;
		this.movie_genres = movie_genres;
		this.movie_poster = movie_poster;
		this.movie_imdb_rate = movie_imdb_rate;
		this.movie_long = movie_long;
	}
	public MovieDetails(int id, List<String> movie_writers, List<String> movie_actors, String movie_storyline,
			String movie_id, List<String> movie_keywords, String movie_content_rate, List<String> movie_director,
			String movie_title, String movie_summary, String movie_year, List<String> movie_genres, String movie_poster,
			String movie_imdb_rate, String movie_long) {
		super();
		this.id = id;
		this.movie_writers = movie_writers;
		this.movie_actors = movie_actors;
		this.movie_storyline = movie_storyline;
		this.movie_id = movie_id;
		this.movie_keywords = movie_keywords;
		this.movie_content_rate = movie_content_rate;
		this.movie_director = movie_director;
		this.movie_title = movie_title;
		this.movie_summary = movie_summary;
		this.movie_year = movie_year;
		this.movie_genres = movie_genres;
		this.movie_poster = movie_poster;
		this.movie_imdb_rate = movie_imdb_rate;
		this.movie_long = movie_long;
	}
	
	
	

}
