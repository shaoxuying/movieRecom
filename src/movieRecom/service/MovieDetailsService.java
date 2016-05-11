package movieRecom.service;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import movieRecom.common.HttpRequest;
import movieRecom.dao.MovieDetailsDao;
import movieRecom.pojo.MovieDetails;

@Service
@Transactional(rollbackFor = Exception.class)
public class MovieDetailsService {

	@Autowired
	private MovieDetailsDao movieDetailsDao;
		
	public String getMovieRecom(String userId){
		
		Map<String,Object> param =new HashMap<String,Object>();
		param.put("user", userId);
		param.put("num", 29);
		 //∑¢ÀÕ GET «Î«Û
        String s=HttpRequest.sendPost(" http://10.107.9.140:8000/queries.json", param);
        
        System.out.println("MovieService:getMovieRecom"+s);
        return s;
	}
	
	public void insert(	MovieDetails movieDetails){
		movieDetailsDao.insert(movieDetails);
		
		List<String> movieWriters = movieDetails.getMovie_writers();
		for (String movieWriter:movieWriters){
			Map<String,String> map =new HashMap<String,String>();
			map.put("movie_id", movieDetails.getMovie_id());
			map.put("movie_writer", movieWriter);
			movieDetailsDao.insertWriters(map);
		}
		
		List<String> movieActors = movieDetails.getMovie_actors();
		for (String movieActor:movieActors){
			Map<String,String> map =new HashMap<String,String>();
			map.put("movie_id", movieDetails.getMovie_id());
			map.put("movie_actor", movieActor);
			movieDetailsDao.insertActors(map);
		}
		
		List<String> movieKeyWords = movieDetails.getMovie_keywords();
		for (String movieKeyWord:movieKeyWords){
			Map<String,String> map =new HashMap<String,String>();
			map.put("movie_id", movieDetails.getMovie_id());
			map.put("movie_keyword", movieKeyWord);
			movieDetailsDao.insertKeywords(map);
		}
		
		List<String> movieDirectors = movieDetails.getMovie_director();
		for (String movieDirector:movieDirectors){
			Map<String,String> map =new HashMap<String,String>();
			map.put("movie_id", movieDetails.getMovie_id());
			map.put("movie_director", movieDirector);
			movieDetailsDao.insertDirector(map);
		}
		
		List<String> movieGenres = movieDetails.getMovie_genres();
		for (String movieGenre:movieGenres){
			Map<String,String> map =new HashMap<String,String>();
			map.put("movie_id", movieDetails.getMovie_id());
			map.put("movie_genre", movieGenre);
			movieDetailsDao.insertGenres(map);
		}
	}
		
	public MovieDetails getMovieDetailsByMovieId(String movieId){
		MovieDetails movieDetails= movieDetailsDao.getMovieByMovieId(movieId);
		movieDetails.setMovie_actors(movieDetailsDao.getActorsByMovieId(movieId));
		movieDetails.setMovie_writers(movieDetailsDao.getWritersByMovieId(movieId));
		movieDetails.setMovie_keywords(movieDetailsDao.getKeywordsByMovieId(movieId));
		movieDetails.setMovie_director(movieDetailsDao.getDirectorByMovieId(movieId));
		movieDetails.setMovie_genres(movieDetailsDao.getGenresByMovieId(movieId));		
		return movieDetails;
	}	
	
	public Map<String,String> getMovieByMovieId(String movieId){
		MovieDetails movieDetails= movieDetailsDao.getMovieByMovieId(movieId);
		Map<String,String> map= new HashMap<String,String>();
		if(movieDetails!=null){
			map.put("movie_id", movieDetails.getMovie_id());
			map.put("movie_poster", movieDetails.getMovie_poster());
			map.put("movie_title", movieDetails.getMovie_title());
			return map;
		}else {
			System.out.println("there is no movieDetails for movie:"+movieId);
			return null;
		}
	}			
	
}
