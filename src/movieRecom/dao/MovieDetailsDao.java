package movieRecom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import movieRecom.pojo.MovieDetails;

@Repository
public class MovieDetailsDao {
	
	@Autowired
	private SqlSessionFactory factory;
	
	public void insert(MovieDetails movieDetails) {
		SqlSession session = factory.openSession();
		session.insert("MOVIEDETAILS.insert", movieDetails);
	}
	
	public void insertWriters(Map<String,String> map) {
		SqlSession session = factory.openSession();
		session.insert("MOVIEDETAILS.insertWriters", map);
	}
	
	public void insertActors(Map<String,String> map) {
		SqlSession session = factory.openSession();
		session.insert("MOVIEDETAILS.insertActors", map);
	}
	
	public void insertKeywords(Map<String,String> map) {
		SqlSession session = factory.openSession();
		session.insert("MOVIEDETAILS.insertKeywords", map);
	}
	
	public void insertDirector(Map<String,String> map) {
		SqlSession session = factory.openSession();
		session.insert("MOVIEDETAILS.insertDirector", map);
	}
	
	public void insertGenres(Map<String,String> map) {
		SqlSession session = factory.openSession();
		session.insert("MOVIEDETAILS.insertGenres", map);
	}
	
	public MovieDetails getMovieByMovieId(String movie_id) {
		SqlSession session = factory.openSession();
		return session.selectOne("MOVIEDETAILS.getMovieByMovieId", movie_id);
	}
	
	public List<String> getWritersByMovieId(String movie_id) {
		SqlSession session = factory.openSession();
		return session.selectList("MOVIEDETAILS.getWritersByMovieId", movie_id);
	}
	
	public List<String> getActorsByMovieId(String movie_id) {
		SqlSession session = factory.openSession();
		return session.selectList("MOVIEDETAILS.getActorsByMovieId", movie_id);
	}
	
	public List<String> getKeywordsByMovieId(String movie_id) {
		SqlSession session = factory.openSession();
		return session.selectList("MOVIEDETAILS.getKeywordsByMovieId", movie_id);
	}
	
	public List<String> getDirectorByMovieId(String movie_id) {
		SqlSession session = factory.openSession();
		return session.selectList("MOVIEDETAILS.getDirectorByMovieId", movie_id);
	}
	
	public List<String> getGenresByMovieId(String movie_id) {
		SqlSession session = factory.openSession();
		return session.selectList("MOVIEDETAILS.getGenresByMovieId", movie_id);
	}
	

}
